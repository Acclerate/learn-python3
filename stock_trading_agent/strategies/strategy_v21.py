# -*- coding: utf-8 -*-
"""
V2.1策略 - 实时交易版本（增强版）
支持分钟级别行情观察和判断买卖点
合并V1和V2-Opt优点，增加8个新技术指标
"""

import os
import time
import pandas as pd
import numpy as np
import akshare as ak
from datetime import datetime
from typing import Dict, Optional
import sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from core.strategy_base import StrategyBase
from core.indicators import IndicatorCalculator

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''


class StrategyV21(StrategyBase):
    """
    V2.1策略 - 增强版

    合并V1和V2-Opt的优点，增加8个新技术指标：
    - DMI (趋向指标)
    - OBV (能量潮)
    - BIAS (乖离率)
    - BBI (多空指标)
    - 双周期布林带 (12+59日)
    - WR (威廉指标)
    - CCI (顺势指标)
    - EMV (简易波动指标)

    买入策略（与v2-opt保持一致，新增指标作为辅助）:
    1个买入信号即可触发

    卖出策略:
    主要由动态止损止盈处理
    """

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50):
        super().__init__(initial_capital)
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.use_dynamic_stop = True

        # 策略参数
        self.ma_periods = [5, 10, 20, 60]
        self.boll_short_period = 12
        self.boll_long_period = 59
        self.bias_periods = [6, 12, 24]
        self.dmi_period = 14

    def get_name(self) -> str:
        return "StrategyV21"

    def get_version(self) -> str:
        return "2.1"

    def initialize(self, **params):
        """初始化策略参数"""
        self.trailing_stop_pct = params.get('trailing_stop_pct', 0.06)
        self.profit_take_pct = params.get('profit_take_pct', 0.50)
        self.use_dynamic_stop = params.get('use_dynamic_stop', True)

    def calculate_advanced_indicators(self, df: pd.DataFrame, cols: Dict[str, str]) -> pd.DataFrame:
        """
        计算高级技术指标（新增8个指标）

        Args:
            df: DataFrame
            cols: 列名映射

        Returns:
            添加了高级指标的DataFrame
        """
        df = df.copy()
        close_col = cols['close_col']
        high_col = cols['high_col']
        low_col = cols['low_col']
        volume_col = cols['volume_col']

        # DMI (趋向指标)
        df['PDM'] = np.where((df[high_col] - df[high_col].shift(1)) > (df[low_col].shift(1) - df[low_col]),
                             np.maximum(df[high_col] - df[high_col].shift(1), 0), 0)
        df['MDM'] = np.where((df[low_col].shift(1) - df[low_col]) > (df[high_col] - df[high_col].shift(1)),
                             np.maximum(df[low_col].shift(1) - df[low_col], 0), 0)

        df['TR_SMOOTH'] = df['TR'].ewm(span=self.dmi_period, adjust=False).mean()
        df['PDM_SMOOTH'] = df['PDM'].ewm(span=self.dmi_period, adjust=False).mean()
        df['MDM_SMOOTH'] = df['MDM'].ewm(span=self.dmi_period, adjust=False).mean()

        tr_smooth_safe = df['TR_SMOOTH'].replace(0, np.nan)
        df['PDI'] = 100 * df['PDM_SMOOTH'] / tr_smooth_safe
        df['MDI'] = 100 * df['MDM_SMOOTH'] / tr_smooth_safe
        df['PDI'] = df['PDI'].fillna(0)
        df['MDI'] = df['MDI'].fillna(0)

        di_sum = df['PDI'] + df['MDI']
        df['DX'] = np.where(di_sum > 0, 100 * abs(df['PDI'] - df['MDI']) / di_sum, 0)
        df['ADX'] = df['DX'].ewm(span=self.dmi_period, adjust=False).mean()
        df['ADXR'] = (df['ADX'] + df['ADX'].shift(self.dmi_period)) / 2

        # 兼容旧列名
        df['+DI'] = df['PDI']
        df['-DI'] = df['MDI']

        # OBV (能量潮)
        obv = [0]
        for i in range(1, len(df)):
            if df[close_col].iloc[i] > df[close_col].iloc[i-1]:
                obv.append(obv[-1] + df[volume_col].iloc[i])
            elif df[close_col].iloc[i] < df[close_col].iloc[i-1]:
                obv.append(obv[-1] - df[volume_col].iloc[i])
            else:
                obv.append(obv[-1])
        df['OBV'] = obv
        df['OBV_MA5'] = df['OBV'].rolling(window=5).mean()

        # BIAS (乖离率)
        for period in self.bias_periods:
            ma_temp = df[close_col].rolling(window=period).mean()
            df[f'BIAS{period}'] = (df[close_col] - ma_temp) / ma_temp.replace(0, np.nan) * 100
            df[f'BIAS{period}'] = df[f'BIAS{period}'].fillna(0)

        # BBI (多空指标)
        ma4 = df[close_col].rolling(window=3).mean()
        ma5 = df[close_col].rolling(window=6).mean()
        ma6 = df[close_col].rolling(window=12).mean()
        ma7 = df[close_col].rolling(window=24).mean()
        df['BBI'] = (ma4 + ma5 + ma6 + ma7) / 4

        # 双周期布林带
        df['BOLL_SHORT_MID'] = df[close_col].rolling(window=self.boll_short_period).mean()
        df['BOLL_SHORT_STD'] = df[close_col].rolling(window=self.boll_short_period).std()
        df['BOLL_SHORT_UPPER'] = df['BOLL_SHORT_MID'] + 2 * df['BOLL_SHORT_STD']
        df['BOLL_SHORT_LOWER'] = df['BOLL_SHORT_MID'] - 2 * df['BOLL_SHORT_STD']

        df['BOLL_LONG_MID'] = df[close_col].rolling(window=self.boll_long_period).mean()
        df['BOLL_LONG_STD'] = df[close_col].rolling(window=self.boll_long_period).std()
        df['BOLL_LONG_UPPER'] = df['BOLL_LONG_MID'] + 2 * df['BOLL_LONG_STD']
        df['BOLL_LONG_LOWER'] = df['BOLL_LONG_MID'] - 2 * df['BOLL_LONG_STD']

        # WR (威廉指标)
        high_low = df[high_col].rolling(window=14).max() - df[low_col].rolling(window=14).min()
        high_low = high_low.replace(0, np.nan)
        df['WR'] = -100 * (df[high_col].rolling(window=14).max() - df[close_col]) / high_low
        df['WR'] = df['WR'].fillna(-50)

        # CCI (顺势指标)
        tp = (df[high_col] + df[low_col] + df[close_col]) / 3
        ma_tp = tp.rolling(window=20).mean()
        md = tp.rolling(window=20).apply(lambda x: np.abs(x - x.mean()).mean())
        md = md.replace(0, np.nan)
        df['CCI'] = (tp - ma_tp) / (0.015 * md)
        df['CCI'] = df['CCI'].fillna(0)

        # EMV (简易波动指标)
        volume_safe = df[volume_col].replace(0, np.nan)
        emv = (df[high_col] - df[low_col]) * (df[high_col] - df[low_col] + df[high_col].shift(1) - df[low_col].shift(1)) / (2 * volume_safe)
        df['EMV'] = emv.rolling(window=14).mean().fillna(0)
        df['MAEMV'] = df['EMV'].rolling(window=9).mean().fillna(0)

        return df

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """生成交易信号（与v2-opt保持一致的激进策略，新增指标作为辅助）"""
        df = df.copy()
        df['signal'] = 0
        df['signal_reason'] = ''

        cols = IndicatorCalculator.get_column_names(df)

        # 先计算高级指标
        df = self.calculate_advanced_indicators(df, cols)

        for i in range(30, len(df)):
            current = df.iloc[i]
            prev = df.iloc[i - 1]

            signals_buy = []
            signals_sell = []

            # ========== 核心买入信号（与v2-opt完全一致）==========

            # 1. MA金叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append("MA金叉")

            # 2. MACD金叉
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']):
                signals_buy.append("MACD金叉")

            # 3. 突破20日新高
            if current.get('BREAKOUT_20', False):
                signals_buy.append("突破20日新高")

            # 4. 价格站稳MA5
            if current[cols['close_col']] > current['MA5'] and current['MA5'] > current['MA10']:
                if prev[cols['close_col']] <= prev['MA5']:
                    signals_buy.append("突破MA5")
                elif current['MOMENTUM_5'] > 0.03:
                    signals_buy.append(f"强势上涨({current['MOMENTUM_5']*100:.1f}%)")

            # 5. RSI超卖
            if current['RSI'] < 30:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f})")

            # 6. 双金叉
            ma_up = prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']
            macd_up = prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']
            if ma_up and macd_up:
                signals_buy.append("双金叉共振")

            # ========== 新增辅助买入信号（低权重）==========

            # DMI趋势
            if current.get('PDI', 0) > current.get('MDI', 0) and current.get('ADX', 0) > 20:
                signals_buy.append("DMI上升")

            # 双周期BOLL突破
            if (prev[cols['close_col']] <= prev.get('BOLL_LONG_MID', prev[cols['close_col']]) and
                current[cols['close_col']] > current.get('BOLL_LONG_MID', current[cols['close_col']]) and
                current[cols['close_col']] > current.get('BOLL_SHORT_MID', current[cols['close_col']])):
                signals_buy.append("双BOLL突破")

            # ========== 卖出信号（仅在极端情况）==========

            if current['RSI'] > 85:
                signals_sell.append(f"RSI极度超买({current['RSI']:.1f})")

            # 综合判断（1个买入信号即可）
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            if buy_score >= 1 and sell_score == 0:
                df.loc[df.index[i], 'signal'] = 1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_buy[:3])
            elif sell_score >= 1 and buy_score == 0:
                df.loc[df.index[i], 'signal'] = -1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_sell[:3])

        return df

    def get_realtime_data(self, symbol: str) -> Optional[pd.DataFrame]:
        """获取实时分钟数据"""
        max_retries = 3
        for attempt in range(max_retries):
            try:
                df = ak.stock_zh_a_hist_min_em(
                    symbol=symbol,
                    period="1",
                    adjust="qfq"
                )
                if df is not None and not df.empty:
                    return df.tail(200)
            except Exception as e:
                if attempt < max_retries - 1:
                    time.sleep(1)
        return None

    def run_realtime_monitoring(self, symbol: str, check_interval: int = 60):
        """运行实时监控"""
        print(f"\n{'='*60}")
        print(f"启动实时交易监控 - {self.get_name()} v{self.get_version()} (增强版)")
        print(f"股票代码: {symbol}")
        print(f"初始资金: {self.initial_capital:,.2f} 元")
        print(f"基础止损: {self.trailing_stop_pct*100}% | 止盈: {self.profit_take_pct*100}%")
        print(f"按 Ctrl+C 停止监控")
        print(f"{'='*60}\n")

        try:
            while True:
                df = self.get_realtime_data(symbol)

                if df is None or df.empty:
                    print("[ERROR] 无法获取数据，等待重试...")
                    time.sleep(check_interval)
                    continue

                cols = IndicatorCalculator.get_column_names(df)
                df = IndicatorCalculator.calculate_all(
                    df,
                    close_col=cols['close_col'],
                    high_col=cols['high_col'],
                    low_col=cols['low_col'],
                    volume_col=cols['volume_col']
                )

                df = self.generate_signals(df)

                if not df.empty:
                    analysis = df.iloc[-1]
                    current_price = analysis[cols['close_col']]

                    self._print_status(symbol, analysis, cols)

                    if self.position > 0:
                        stop_reason = self.check_stop_loss(current_price)
                        if stop_reason:
                            self._execute_trade(symbol, current_price, -1, stop_reason)

                    if analysis['signal'] == 1:
                        self._execute_trade(symbol, current_price, 1, analysis['signal_reason'])
                    elif analysis['signal'] == -1:
                        self._execute_trade(symbol, current_price, -1, analysis['signal_reason'])

                print(f"\n等待 {check_interval} 秒...")
                time.sleep(check_interval)

        except KeyboardInterrupt:
            print(f"\n\n{'='*60}")
            print("监控已手动停止")
            print(f"{'='*60}")
            self._print_summary(symbol)

    def _execute_trade(self, symbol: str, price: float, signal: int, reason: str):
        """执行交易"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        if signal == 1:
            if self.cash > 0 and self.position == 0:
                shares = int(self.cash / price)
                if shares > 0:
                    cost = shares * price
                    self.cash -= cost
                    self.position = shares
                    self.avg_cost = price
                    self.highest_price = price
                    self.lowest_since_highest = price
                    self.consecutive_up = 0
                    self.consecutive_down = 0

                    self.trades.append({
                        'timestamp': timestamp,
                        'symbol': symbol,
                        'action': 'BUY',
                        'price': price,
                        'shares': shares,
                        'amount': cost,
                        'reason': reason
                    })

                    print(f"\n{'='*60}")
                    print(f"[买入] {timestamp} @ {price:.2f} x{shares} - {reason}")
                    print(f"现金: {self.cash:,.2f} | 持仓: {self.position}")
                    print(f"{'='*60}\n")

        elif signal == -1:
            if self.position > 0:
                amount = self.position * price
                cost_basis = self.position * self.avg_cost
                profit = amount - cost_basis
                profit_pct = (profit / cost_basis) * 100 if cost_basis > 0 else 0

                self.cash += amount

                self.trades.append({
                    'timestamp': timestamp,
                    'symbol': symbol,
                    'action': 'SELL',
                    'price': price,
                    'shares': self.position,
                    'amount': amount,
                    'reason': reason,
                    'profit': profit,
                    'profit_pct': profit_pct
                })

                profit_symbol = '+' if profit >= 0 else ''
                print(f"\n{'='*60}")
                print(f"[卖出] {timestamp} @ {price:.2f} x{self.position}")
                print(f"盈亏: {profit_symbol}{profit:,.2f} ({profit_symbol}{profit_pct:.2f}%) - {reason}")
                print(f"现金: {self.cash:,.2f}")
                print(f"{'='*60}\n")

                self.position = 0
                self.avg_cost = 0
                self.highest_price = 0
                self.lowest_since_highest = 0

    def _print_status(self, symbol: str, analysis: pd.Series, cols: Dict[str, str]):
        """打印市场状态"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        current_price = analysis[cols['close_col']]

        total_value = self.cash + self.position * current_price
        total_return = (total_value - self.initial_capital) / self.initial_capital * 100

        print(f"\n[{timestamp}] {symbol} - {self.get_name()}")
        print(f"价格: {current_price:.2f}")
        print(f"MA5/10/20: {analysis['MA5']:.2f} / {analysis['MA10']:.2f} / {analysis['MA20']:.2f}")
        print(f"RSI: {analysis['RSI']:.1f} | MACD: {analysis['MACD_HIST']:.4f}")

        if self.position > 0:
            profit_loss = (current_price - self.avg_cost) * self.position
            profit_pct = (current_price - self.avg_cost) / self.avg_cost * 100
            drawdown = (self.highest_price - current_price) / self.highest_price * 100
            print(f"持仓: {self.position}股 | 成本: {self.avg_cost:.2f}")
            print(f"盈亏: {profit_loss:+,.2f} ({profit_pct:+.2f}%) | 回撤: {drawdown:.2f}%")

        print(f"总资产: {total_value:,.2f} | 收益: {total_return:+.2f}%")

        if analysis['signal'] == 1:
            print(f"✅ 买入: {analysis['signal_reason']}")
        elif analysis['signal'] == -1:
            print(f"❌ 卖出: {analysis['signal_reason']}")

    def _print_summary(self, symbol: str):
        """打印总结"""
        if not self.trades:
            print("没有交易记录")
            return

        final_value = self.cash
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        sell_trades = [t for t in self.trades if t['action'] == 'SELL']
        profitable_trades = [t for t in sell_trades if t.get('profit', 0) > 0]
        win_rate = len(profitable_trades) / len(sell_trades) * 100 if sell_trades else 0

        print(f"\n最终资产: {final_value:,.2f} 元")
        print(f"总收益率: {total_return:+.2f}%")
        print(f"总交易: {len(self.trades)} 次")
        print(f"胜率: {win_rate:.2f}%")


def main():
    """主函数 - 实时监控模式"""
    SYMBOL = "002202"
    CHECK_INTERVAL = 60

    strategy = StrategyV21(
        initial_capital=100000.0,
        trailing_stop_pct=0.06,
        profit_take_pct=0.50
    )
    strategy.run_realtime_monitoring(SYMBOL, CHECK_INTERVAL)


if __name__ == "__main__":
    main()
