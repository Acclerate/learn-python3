# -*- coding: utf-8 -*-
"""
V1策略 - 实时交易版本
基于MA、RSI、MACD、布林带的基础策略
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


class StrategyV1(StrategyBase):
    """
    V1策略 - 基础版

    买入条件：
    - MA金叉
    - MACD金叉
    - 突破20日新高
    - RSI超卖
    - 价格跌破布林下轨

    卖出条件：
    - MA死叉
    - RSI超买
    - MACD死叉
    - 突破布林上轨
    """

    def __init__(self, initial_capital: float = 100000.0):
        super().__init__(initial_capital)
        self.trailing_stop_pct = 0.06
        self.profit_take_pct = 0.50

    def get_name(self) -> str:
        return "StrategyV1"

    def get_version(self) -> str:
        return "1.0"

    def initialize(self, **params):
        """初始化策略参数"""
        self.trailing_stop_pct = params.get('trailing_stop_pct', 0.06)
        self.profit_take_pct = params.get('profit_take_pct', 0.50)

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """生成交易信号"""
        df = df.copy()

        # 获取列名
        cols = IndicatorCalculator.get_column_names(df)

        # 初始化信号列
        df['signal'] = 0
        df['signal_reason'] = ''

        # 遍历生成信号（从第20行开始，确保指标有足够数据）
        for i in range(20, len(df)):
            current = df.iloc[i]
            prev = df.iloc[i - 1]

            signals_buy = []
            signals_sell = []

            # 买入信号
            # 1. MA金叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append("MA金叉")

            # 2. RSI超卖
            if current['RSI'] < 30:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f})")

            # 3. MACD金叉
            if prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']:
                signals_buy.append("MACD金叉")

            # 4. 布林带突破
            if current[cols['close_col']] < current['BOLL_LOWER']:
                signals_buy.append("跌破布林下轨")

            # 卖出信号
            # 1. MA死叉
            if prev['MA5'] >= prev['MA10'] and current['MA5'] < current['MA10']:
                signals_sell.append("MA死叉")

            # 2. RSI超买
            if current['RSI'] > 70:
                signals_sell.append(f"RSI超买({current['RSI']:.1f})")

            # 3. MACD死叉
            if prev['MACD'] >= prev['MACD_SIGNAL'] and current['MACD'] < current['MACD_SIGNAL']:
                signals_sell.append("MACD死叉")

            # 4. 布林带突破
            if current[cols['close_col']] > current['BOLL_UPPER']:
                signals_sell.append("突破布林上轨")

            # 综合判断
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            # 只要有1个买入信号且没有卖出信号就买入
            if buy_score >= 1 and sell_score == 0:
                df.loc[df.index[i], 'signal'] = 1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_buy)
            # 只要有1个卖出信号且没有买入信号就卖出
            elif sell_score >= 1 and buy_score == 0:
                df.loc[df.index[i], 'signal'] = -1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_sell)
            # 多个买入信号覆盖单个卖出信号
            elif buy_score >= 2:
                df.loc[df.index[i], 'signal'] = 1
                df.loc[df.index[i], 'signal_reason'] = ','.join(signals_buy)

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
                else:
                    print(f"[ERROR] 获取数据失败: {e}")
        return None

    def run_realtime_monitoring(self, symbol: str, check_interval: int = 60):
        """
        运行实时监控

        Args:
            symbol: 股票代码
            check_interval: 检查间隔（秒）
        """
        print(f"\n{'='*60}")
        print(f"启动实时交易监控 - {self.get_name()} v{self.get_version()}")
        print(f"股票代码: {symbol}")
        print(f"初始资金: {self.initial_capital:,.2f} 元")
        print(f"检查间隔: {check_interval} 秒")
        print(f"按 Ctrl+C 停止监控")
        print(f"{'='*60}\n")

        try:
            while True:
                df = self.get_realtime_data(symbol)

                if df is None or df.empty:
                    print("[ERROR] 无法获取数据，等待重试...")
                    time.sleep(check_interval)
                    continue

                # 计算指标
                cols = IndicatorCalculator.get_column_names(df)
                df = IndicatorCalculator.calculate_all(
                    df,
                    close_col=cols['close_col'],
                    high_col=cols['high_col'],
                    low_col=cols['low_col'],
                    volume_col=cols['volume_col']
                )

                # 生成信号
                df = self.generate_signals(df)

                if not df.empty:
                    analysis = df.iloc[-1]
                    current_price = analysis[cols['close_col']]

                    # 打印状态
                    self._print_status(symbol, analysis, cols)

                    # 检查止损
                    if self.position > 0:
                        stop_reason = self.check_stop_loss(current_price)
                        if stop_reason:
                            self._execute_trade(symbol, current_price, -1, stop_reason)

                    # 执行信号
                    if analysis['signal'] == 1:
                        self._execute_trade(symbol, current_price, 1, analysis['signal_reason'])
                    elif analysis['signal'] == -1:
                        self._execute_trade(symbol, current_price, -1, analysis['signal_reason'])

                print(f"\n等待 {check_interval} 秒后进行下一次检查...")
                time.sleep(check_interval)

        except KeyboardInterrupt:
            print(f"\n\n{'='*60}")
            print("监控已手动停止")
            print(f"{'='*60}")
            self._print_summary(symbol)
        except Exception as e:
            print(f"\n[ERROR] 监控异常: {e}")
            import traceback
            traceback.print_exc()

    def _execute_trade(self, symbol: str, price: float, signal: int, reason: str):
        """执行交易"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        if signal == 1:  # 买入
            if self.cash > 0 and self.position == 0:
                shares = int(self.cash / price)
                if shares > 0:
                    cost = shares * price
                    self.cash -= cost
                    self.position = shares
                    self.avg_cost = price
                    self.highest_price = price

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
                    print(f"市值: {self.cash + self.position * price:,.2f}")
                    print(f"{'='*60}\n")

        elif signal == -1:  # 卖出
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
            print(f"持仓: {self.position}股 | 成本: {self.avg_cost:.2f}")
            print(f"盈亏: {profit_loss:+,.2f} ({profit_pct:+.2f}%)")

        print(f"总资产: {total_value:,.2f} | 收益: {total_return:+.2f}%")

        if analysis['signal'] == 1:
            print(f"✅ 买入信号: {analysis['signal_reason']}")
        elif analysis['signal'] == -1:
            print(f"❌ 卖出信号: {analysis['signal_reason']}")

    def _print_summary(self, symbol: str):
        """打印总结"""
        if not self.trades:
            print("没有交易记录")
            return

        final_value = self.cash + self.position * (self.trades[-1]['price'] if self.trades else 0)
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        print(f"\n最终资产: {final_value:,.2f} 元")
        print(f"总收益率: {total_return:+.2f}%")
        print(f"总交易: {len(self.trades)} 次")


def main():
    """主函数 - 实时监控模式"""
    SYMBOL = "002202"
    CHECK_INTERVAL = 60

    strategy = StrategyV1(initial_capital=100000.0)
    strategy.run_realtime_monitoring(SYMBOL, CHECK_INTERVAL)


if __name__ == "__main__":
    main()
