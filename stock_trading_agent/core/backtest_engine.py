# -*- coding: utf-8 -*-
"""
通用回测引擎
支持任何继承自StrategyBase的策略进行回测
"""

import os
import time
import pandas as pd
import numpy as np
import akshare as ak
from datetime import datetime, timedelta
from typing import Dict, Optional
from .strategy_base import StrategyBase
from .indicators import IndicatorCalculator

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''


class BacktestEngine:
    """
    通用回测引擎

    使用策略模式，支持任何继承自StrategyBase的策略
    """

    def __init__(self, strategy: StrategyBase):
        """
        初始化回测引擎

        Args:
            strategy: 策略实例（必须继承自StrategyBase）
        """
        if not isinstance(strategy, StrategyBase):
            raise TypeError("策略必须继承自StrategyBase")

        self.strategy = strategy
        self.initial_capital = strategy.initial_capital

    def get_historical_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """
        获取历史数据

        Args:
            symbol: 股票代码
            start_date: 开始日期 (YYYYMMDD)
            end_date: 结束日期 (YYYYMMDD)

        Returns:
            历史行情数据
        """
        print(f"[*] 获取历史数据: {symbol} ({start_date} ~ {end_date})...")

        max_retries = 3
        for attempt in range(max_retries):
            try:
                df = ak.stock_zh_a_hist(
                    symbol=symbol,
                    period="daily",
                    start_date=start_date,
                    end_date=end_date,
                    adjust="qfq"
                )
                if df is not None and not df.empty:
                    print(f"    [OK] 获取 {len(df)} 条记录")
                    return df
            except Exception as e:
                if attempt < max_retries - 1:
                    print(f"    [重试] {attempt + 1}/{max_retries}: {str(e)[:30]}...")
                    time.sleep(2)
                else:
                    raise e

        raise ValueError(f"无法获取 {symbol} 的数据")

    def get_date_range(self, months: int = 3) -> tuple:
        """
        获取最近N个月的日期范围

        Args:
            months: 月数

        Returns:
            (start_date, end_date) 格式: YYYYMMDD
        """
        end = datetime.now()
        start = end - timedelta(days=30 * months)

        # 如果是周末，回退到上一个周五
        if end.weekday() == 5:  # 周六
            end = end - timedelta(days=1)
        elif end.weekday() == 6:  # 周日
            end = end - timedelta(days=2)

        return start.strftime('%Y%m%d'), end.strftime('%Y%m%d')

    def run(self, symbol: str, start_date: str = None, end_date: str = None,
            months: int = 3) -> Dict:
        """
        运行回测

        Args:
            symbol: 股票代码
            start_date: 开始日期 (YYYYMMDD)，可选
            end_date: 结束日期 (YYYYMMDD)，可选
            months: 如果没有指定日期，使用最近N个月

        Returns:
            回测结果字典
        """
        # 确定日期范围
        if start_date is None or end_date is None:
            start_date, end_date = self.get_date_range(months)

        print(f"\n{'='*60}")
        print(f"回测: {self.strategy.get_name()} v{self.strategy.get_version()} - {symbol}")
        print(f"周期: {start_date} ~ {end_date}")
        print(f"初始资金: {self.initial_capital:,.2f} CNY")
        print(f"{'='*60}\n")

        # 重置策略状态
        self.strategy.reset_state()

        # 获取历史数据
        df = self.get_historical_data(symbol, start_date, end_date)

        # 计算技术指标
        print("[*] 计算技术指标...")
        cols = IndicatorCalculator.get_column_names(df)
        df = IndicatorCalculator.calculate_all(
            df,
            close_col=cols['close_col'],
            high_col=cols['high_col'],
            low_col=cols['low_col'],
            volume_col=cols['volume_col']
        )

        # 生成交易信号（调用策略的generate_signals方法）
        print("[*] 生成交易信号...")
        df = self.strategy.generate_signals(df)

        # 执行回测
        print("[*] 执行回测...")
        result = self._execute_backtest(df, cols)

        return result

    def _execute_backtest(self, df: pd.DataFrame, cols: Dict[str, str]) -> Dict:
        """
        执行回测逻辑

        Args:
            df: 包含信号的DataFrame
            cols: 列名映射

        Returns:
            回测结果字典
        """
        close_col = cols['close_col']
        date_col = cols['date_col']

        prev_price = None

        for i, row in df.iterrows():
            current_price = row[close_col]

            # 检查止损止盈
            if self.strategy.position > 0 and prev_price is not None:
                stop_reason = self.strategy.check_stop_loss(current_price)
                if stop_reason:
                    self._execute_sell(row[date_col], current_price, stop_reason)
                    prev_price = current_price
                    continue

            # 处理交易信号
            if pd.notna(row.get('signal', 0)) and row['signal'] != 0:
                if row['signal'] == 1:
                    self._execute_buy(row[date_col], current_price, row.get('signal_reason', ''))
                elif row['signal'] == -1:
                    self._execute_sell(row[date_col], current_price, row.get('signal_reason', ''))

            # 更新每日净值
            total_value = self.strategy.cash + self.strategy.position * current_price
            self.strategy.records.append({
                'date': row[date_col],
                'total_value': total_value,
                'cash': self.strategy.cash,
                'position': self.strategy.position,
                'price': current_price
            })

            prev_price = current_price

        # 最后一天强制平仓
        if self.strategy.position > 0:
            last_row = df.iloc[-1]
            self._execute_sell(last_row[date_col], last_row[close_col], "回测结束平仓")

        # 计算结果
        return self._calculate_results(df, cols)

    def _execute_buy(self, date, price: float, reason: str):
        """执行买入"""
        if self.strategy.cash > 0 and self.strategy.position == 0:
            shares = int(self.strategy.cash / price)
            if shares > 0:
                cost = shares * price
                self.strategy.cash -= cost
                self.strategy.position = shares
                self.strategy.avg_cost = price
                self.strategy.highest_price = price
                self.strategy.lowest_since_highest = price
                self.strategy.consecutive_up = 0
                self.strategy.consecutive_down = 0

                self.strategy.trades.append({
                    'date': date,
                    'action': 'BUY',
                    'price': price,
                    'shares': shares,
                    'amount': cost,
                    'reason': reason
                })
                print(f"    [BUY] {date} @ {price:.2f} x{shares} - {reason}")

    def _execute_sell(self, date, price: float, reason: str):
        """执行卖出"""
        if self.strategy.position > 0:
            amount = self.strategy.position * price
            cost_basis = self.strategy.position * self.strategy.avg_cost
            profit = amount - cost_basis
            profit_pct = (profit / cost_basis) * 100 if cost_basis > 0 else 0

            self.strategy.cash += amount

            self.strategy.trades.append({
                'date': date,
                'action': 'SELL',
                'price': price,
                'shares': self.strategy.position,
                'amount': amount,
                'reason': reason,
                'profit': profit,
                'profit_pct': profit_pct
            })

            profit_symbol = '+' if profit >= 0 else ''
            print(f"    [SELL] {date} @ {price:.2f} x{self.strategy.position}, profit: {profit_symbol}{profit:.2f} ({profit_symbol}{profit_pct:.2f}%) - {reason}")

            self.strategy.position = 0
            self.strategy.avg_cost = 0
            self.strategy.highest_price = 0
            self.strategy.lowest_since_highest = 0

    def _calculate_results(self, df: pd.DataFrame, cols: Dict[str, str]) -> Dict:
        """计算回测结果"""
        final_value = self.strategy.cash
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        buy_trades = [t for t in self.strategy.trades if t['action'] == 'BUY']
        sell_trades = [t for t in self.strategy.trades if t['action'] == 'SELL']
        profitable_trades = [t for t in sell_trades if t.get('profit', 0) > 0]
        win_rate = len(profitable_trades) / len(sell_trades) * 100 if sell_trades else 0

        # 最大回撤
        daily_values = [v['total_value'] for v in self.strategy.records]
        peak = daily_values[0]
        max_drawdown = 0
        for value in daily_values:
            if value > peak:
                peak = value
            drawdown = (peak - value) / peak * 100
            if drawdown > max_drawdown:
                max_drawdown = drawdown

        # 夏普比率
        returns = pd.Series([self.strategy.records[i]['total_value'] / self.strategy.records[i-1]['total_value'] - 1
                            for i in range(1, len(self.strategy.records))])
        sharpe_ratio = returns.mean() / returns.std() * np.sqrt(252) if returns.std() > 0 else 0

        return {
            'strategy_name': self.strategy.get_name(),
            'strategy_version': self.strategy.get_version(),
            'initial_capital': self.initial_capital,
            'final_value': final_value,
            'total_return': total_return,
            'total_trades': len(self.strategy.trades),
            'buy_trades': len(buy_trades),
            'sell_trades': len(sell_trades),
            'win_rate': win_rate,
            'max_drawdown': max_drawdown,
            'sharpe_ratio': sharpe_ratio,
            'trades': self.strategy.trades,
            'daily_value': self.strategy.records
        }

    @staticmethod
    def print_report(result: Dict):
        """打印回测报告"""
        print(f"\n{'='*60}")
        print(f"回测报告 - {result['strategy_name']} v{result['strategy_version']}")
        print(f"{'='*60}")
        print(f"初始资金:     {result['initial_capital']:,.2f} CNY")
        print(f"最终资产:     {result['final_value']:,.2f} CNY")
        print(f"总收益率:     {result['total_return']:+.2f}%")
        print(f"-" * 60)
        print(f"总交易次数:   {result['total_trades']}")
        print(f"  买入:       {result['buy_trades']}")
        print(f"  卖出:       {result['sell_trades']}")
        print(f"胜率:         {result['win_rate']:.2f}%")
        print(f"最大回撤:     {result['max_drawdown']:.2f}%")
        print(f"夏普比率:     {result['sharpe_ratio']:.4f}")
        print(f"{'='*60}\n")

        # 打印交易明细
        if result['trades']:
            print("交易明细:")
            print(f"{'日期':<12} {'操作':<6} {'价格':>8} {'数量':>6} {'金额':>12} {'盈亏':>12} {'原因'}")
            print("-" * 100)
            for trade in result['trades']:
                action = trade['action']
                profit_info = ""
                if action == 'SELL':
                    profit = trade.get('profit', 0)
                    profit_pct = trade.get('profit_pct', 0)
                    profit_symbol = '+' if profit >= 0 else ''
                    profit_info = f"{profit_symbol}{profit:,.2f} ({profit_symbol}{profit_pct:.2f}%)"
                reason = trade['reason'][:30] if len(trade['reason']) > 30 else trade['reason']
                print(f"{str(trade['date']):<12} {action:<6} {trade['price']:>7.2f} {trade['shares']:>6} "
                      f"{trade['amount']:>11,.2f} {profit_info:>12} {reason}")
            print()

    @staticmethod
    def save_results(result: Dict, symbol: str, start_date: str, end_date: str):
        """保存回测结果到CSV"""
        if result['daily_value']:
            df_daily = pd.DataFrame(result['daily_value'])
            output_file = f"backtest_{result['strategy_name']}_v{result['strategy_version']}_{symbol}_{start_date}_{end_date}.csv"
            df_daily.to_csv(output_file, index=False, encoding='utf-8-sig')
            print(f"每日净值已保存到: {output_file}")
