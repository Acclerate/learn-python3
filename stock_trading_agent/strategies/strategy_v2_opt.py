# -*- coding: utf-8 -*-
"""
V2-Opt策略 - 实时交易版本（激进优化版）
更激进的买入策略 + 动态止损止盈
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


class StrategyV2Opt(StrategyBase):
    """
    V2-Opt策略 - 激进优化版

    买入策略（更激进）:
    1. MA金叉
    2. MACD金叉
    3. 突破20日新高
    4. RSI超卖反弹
    5. 价格站稳MA5（降低门槛）
    6. 双金叉（MA+MACD）

    卖出策略:
    由移动止损/止盈处理，避免过早卖出
    """

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50):
        super().__init__(initial_capital)
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.use_dynamic_stop = True

    def get_name(self) -> str:
        return "StrategyV2Opt"

    def get_version(self) -> str:
        return "2.0-opt"

    def initialize(self, **params):
        """初始化策略参数"""
        self.trailing_stop_pct = params.get('trailing_stop_pct', 0.06)
        self.profit_take_pct = params.get('profit_take_pct', 0.50)
        self.use_dynamic_stop = params.get('use_dynamic_stop', True)

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """生成激进型交易信号"""
        df = df.copy()
        df['signal'] = 0
        df['signal_reason'] = ''

        cols = IndicatorCalculator.get_column_names(df)

        for i in range(30, len(df)):
            current = df.iloc[i]
            prev = df.iloc[i - 1]

            signals_buy = []
            signals_sell = []

            # === 买入信号（激进）===
            # 1. MA金叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append("MA金叉")

            # 2. MACD金叉
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']):
                signals_buy.append("MACD金叉")

            # 3. 突破20日新高
            if current.get('BREAKOUT_20', False):
                signals_buy.append("突破20日新高")

            # 4. 价格站稳MA5（激进）
            if current[cols['close_col']] > current['MA5'] and current['MA5'] > current['MA10']:
                if prev[cols['close_col']] <= prev['MA5']:
                    signals_buy.append("突破MA5")
                elif current['MOMENTUM_5'] > 0.03:
                    signals_buy.append(f"强势上涨({current['MOMENTUM_5']*100:.1f}%)")

            # 5. RSI超卖反弹
            if current['RSI'] < 30:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f})")

            # 6. 双金叉（MA+MACD）
            ma_up = prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']
            macd_up = prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']
            if ma_up and macd_up:
                signals_buy.append("双金叉共振")

            # === 卖出信号（保守，主要由止损处理）===
            # 只在极端情况下信号卖出
            if current['RSI'] > 85:
                signals_sell.append(f"RSI极度超买({current['RSI']:.1f})")

            # 综合判断
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            # 买入：1个信号即可（激进）
            if buy_score >= 1 and sell_score == 0:
                df.loc[df.index[i], 'signal'] = 1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_buy)
            # 卖出：极端情况
            elif sell_score >= 1 and buy_score == 0:
                df.loc[df.index[i], 'signal'] = -1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_sell)

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
        print(f"启动实时交易监控 - {self.get_name()} v{self.get_version()} (激进型)")
        print(f"股票代码: {symbol}")
        print(f"初始资金: {self.initial_capital:,.2f} 元")
        print(f"基础止损: {self.trailing_stop_pct*100}% | 止盈: {self.profit_take_pct*100}%")
        print(f"动态止损: {self.use_dynamic_stop}")
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
        print(f"RSI: {analysis['RSI']:.1f} | MACD_HIST: {analysis['MACD_HIST']:.4f}")

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

    strategy = StrategyV2Opt(
        initial_capital=100000.0,
        trailing_stop_pct=0.06,
        profit_take_pct=0.50
    )
    strategy.run_realtime_monitoring(SYMBOL, CHECK_INTERVAL)


if __name__ == "__main__":
    main()
