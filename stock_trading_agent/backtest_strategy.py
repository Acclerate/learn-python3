# -*- coding: utf-8 -*-
"""
股票交易策略回测模块
基于技术指标（MA5, MA10, RSI）的量化回测
"""

import os
import time
import pandas as pd
import numpy as np
import akshare as ak
from datetime import datetime, timedelta
from typing import Dict, List, Tuple

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''


class BacktestEngine:
    """回测引擎"""

    def __init__(self, initial_capital: float = 100000.0):
        """
        初始化回测引擎

        Args:
            initial_capital: 初始资金，默认 10 万
        """
        self.initial_capital = initial_capital
        self.cash = initial_capital
        self.position = 0  # 持仓数量
        self.position_value = 0.0  # 持仓市值
        self.avg_cost = 0.0  # 平均持仓成本
        self.trades = []  # 交易记录
        self.daily_value = []  # 每日净值

    def calculate_indicators(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        计算技术指标

        Args:
            df: 包含收盘价的 DataFrame

        Returns:
            添加了技术指标的 DataFrame
        """
        df = df.copy()

        # 获取收盘价列名
        columns = df.columns.tolist()
        if 'close' in columns:
            close_col = 'close'
        elif '收盘' in columns:
            close_col = '收盘'
        elif 'Close' in columns:
            close_col = 'Close'
        else:
            raise ValueError(f"无法找到收盘价列，当前列: {columns}")

        # 移动平均线
        df['MA5'] = df[close_col].rolling(window=5).mean()
        df['MA10'] = df[close_col].rolling(window=10).mean()
        df['MA20'] = df[close_col].rolling(window=20).mean()

        # RSI (14周期)
        delta = df[close_col].diff()
        gain = (delta.where(delta > 0, 0)).rolling(window=14).mean()
        loss = (-delta.where(delta < 0, 0)).rolling(window=14).mean()
        rs = gain / loss
        df['RSI'] = 100 - (100 / (1 + rs))

        # MACD
        exp12 = df[close_col].ewm(span=12, adjust=False).mean()
        exp26 = df[close_col].ewm(span=26, adjust=False).mean()
        df['MACD'] = exp12 - exp26
        df['MACD_SIGNAL'] = df['MACD'].ewm(span=9, adjust=False).mean()
        df['MACD_HIST'] = df['MACD'] - df['MACD_SIGNAL']

        # 布林带
        df['BOLL_MID'] = df[close_col].rolling(window=20).mean()
        df['BOLL_STD'] = df[close_col].rolling(window=20).std()
        df['BOLL_UPPER'] = df['BOLL_MID'] + 2 * df['BOLL_STD']
        df['BOLL_LOWER'] = df['BOLL_MID'] - 2 * df['BOLL_STD']

        return df

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
        print(f"[*] Fetching historical data for {symbol} ({start_date} ~ {end_date})...")

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
                    print(f"    [OK] Got {len(df)} records")
                    return df
            except Exception as e:
                if attempt < max_retries - 1:
                    print(f"    [Retry] {attempt + 1}/{max_retries}: {str(e)[:30]}...")
                    time.sleep(2)
                else:
                    raise e

        raise ValueError(f"Failed to fetch data for {symbol}")

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成交易信号

        策略说明:
        - 买入信号:
          1. MA5 上穿 MA10 (金叉)
          2. RSI < 30 (超卖)
          3. MACD 金叉
          4. 价格跌破布林带下轨
        - 卖出信号:
          1. MA5 下穿 MA10 (死叉)
          2. RSI > 70 (超买)
          3. MACD 死叉

        Args:
            df: 包含技术指标的 DataFrame

        Returns:
            添加了交易信号的 DataFrame
        """
        df = df.copy()

        # 初始化信号列
        df['signal'] = 0  # 0: 无信号, 1: 买入, -1: 卖出
        df['signal_reason'] = ''

        # 获取收盘价列名
        columns = df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
        else:
            close_col = 'Close'

        # 遍历每一行（从第20行开始，确保指标有足够数据）
        for i in range(20, len(df)):
            current = df.iloc[i]
            prev = df.iloc[i - 1]

            signals_buy = []
            signals_sell = []

            # 1. MA 金叉/死叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append("MA金叉")
            elif prev['MA5'] >= prev['MA10'] and current['MA5'] < current['MA10']:
                signals_sell.append("MA死叉")

            # 2. RSI 超买超卖
            if current['RSI'] < 30:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f})")
            elif current['RSI'] > 70:
                signals_sell.append(f"RSI超买({current['RSI']:.1f})")

            # 3. MACD 金叉/死叉
            if prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']:
                signals_buy.append("MACD金叉")
            elif prev['MACD'] >= prev['MACD_SIGNAL'] and current['MACD'] < current['MACD_SIGNAL']:
                signals_sell.append("MACD死叉")

            # 4. 布林带突破
            if current[close_col] < current['BOLL_LOWER']:
                signals_buy.append("跌破布林下轨")
            elif current[close_col] > current['BOLL_UPPER']:
                signals_sell.append("突破布林上轨")

            # 综合判断信号 (降低阈值，更容易触发)
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            # 只要有1个买入信号且没有卖出信号就买入
            if buy_score >= 1 and sell_score == 0:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)
            # 只要有1个卖出信号且没有买入信号就卖出
            elif sell_score >= 1 and buy_score == 0:
                df.loc[i, 'signal'] = -1
                df.loc[i, 'signal_reason'] = ','.join(signals_sell)
            # 多个买入信号覆盖单个卖出信号
            elif buy_score >= 2:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)

        return df

    def execute_trade(self, date, price: float, signal: int, reason: str):
        """
        执行交易

        Args:
            date: 交易日期
            price: 交易价格
            signal: 信号类型 (1: 买入, -1: 卖出)
            reason: 信号原因
        """
        if signal == 1:  # 买入信号
            if self.cash > 0:
                # 全仓买入
                shares = int(self.cash / price)
                if shares > 0:
                    cost = shares * price
                    self.cash -= cost
                    self.position += shares

                    # 更新平均成本
                    total_cost = self.avg_cost * (self.position - shares) + cost
                    self.avg_cost = total_cost / self.position if self.position > 0 else 0

                    self.trades.append({
                        'date': date,
                        'action': 'BUY',
                        'price': price,
                        'shares': shares,
                        'amount': cost,
                        'reason': reason,
                        'cash_after': self.cash,
                        'position_after': self.position,
                        'avg_cost': self.avg_cost
                    })
                    print(f"    [BUY] {date} @ {price:.2f} x{shares} shares, reason: {reason}")

        elif signal == -1:  # 卖出信号
            if self.position > 0:
                # 全部卖出
                amount = self.position * price
                cost_basis = self.position * self.avg_cost
                profit = amount - cost_basis
                profit_pct = (profit / cost_basis) * 100 if cost_basis > 0 else 0

                self.cash += amount

                self.trades.append({
                    'date': date,
                    'action': 'SELL',
                    'price': price,
                    'shares': self.position,
                    'amount': amount,
                    'reason': reason,
                    'cash_after': self.cash,
                    'profit': profit,
                    'profit_pct': profit_pct
                })
                print(f"    [SELL] {date} @ {price:.2f} x{self.position} shares, profit: {profit:.2f} ({profit_pct:.2f}%)")

                # 重置持仓
                self.position = 0
                self.avg_cost = 0

    def run_backtest(self, symbol: str, start_date: str, end_date: str) -> Dict:
        """
        运行回测

        Args:
            symbol: 股票代码
            start_date: 开始日期 (YYYYMMDD)
            end_date: 结束日期 (YYYYMMDD)

        Returns:
            回测结果字典
        """
        print(f"\n{'='*60}")
        print(f"BACKTEST: {symbol}")
        print(f"Period: {start_date} ~ {end_date}")
        print(f"Initial Capital: {self.initial_capital:,.2f} CNY")
        print(f"{'='*60}\n")

        # 重置状态
        self.cash = self.initial_capital
        self.position = 0
        self.position_value = 0
        self.avg_cost = 0
        self.trades = []
        self.daily_value = []

        # 获取历史数据
        df = self.get_historical_data(symbol, start_date, end_date)

        # 计算技术指标
        print("[*] Calculating indicators...")
        df = self.calculate_indicators(df)

        # 生成交易信号
        print("[*] Generating signals...")
        df = self.generate_signals(df)

        # 获取收盘价列名
        columns = df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
            date_col = '日期'
        else:
            close_col = 'Close'
            date_col = 'Date'

        # 执行回测
        print("[*] Executing backtest...")
        for i, row in df.iterrows():
            if pd.isna(row['signal']) or row['signal'] == 0:
                # 更新每日净值
                total_value = self.cash + self.position * row[close_col]
                self.daily_value.append({
                    'date': row[date_col],
                    'total_value': total_value,
                    'cash': self.cash,
                    'position': self.position,
                    'price': row[close_col]
                })
                continue

            # 执行交易
            self.execute_trade(row[date_col], row[close_col], int(row['signal']), row['signal_reason'])

            # 更新每日净值
            total_value = self.cash + self.position * row[close_col]
            self.daily_value.append({
                'date': row[date_col],
                'total_value': total_value,
                'cash': self.cash,
                'position': self.position,
                'price': row[close_col]
            })

        # 最后一天如果还有持仓，强制平仓
        last_row = df.iloc[-1]
        if self.position > 0:
            self.execute_trade(last_row[date_col], last_row[close_col], -1, "回测结束平仓")

        # 计算回测结果
        final_value = self.cash
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        # 统计交易次数
        buy_trades = [t for t in self.trades if t['action'] == 'BUY']
        sell_trades = [t for t in self.trades if t['action'] == 'SELL']

        # 计算胜率
        profitable_trades = [t for t in sell_trades if t.get('profit', 0) > 0]
        win_rate = len(profitable_trades) / len(sell_trades) * 100 if sell_trades else 0

        # 计算最大回撤
        daily_values = [v['total_value'] for v in self.daily_value]
        peak = daily_values[0]
        max_drawdown = 0
        for value in daily_values:
            if value > peak:
                peak = value
            drawdown = (peak - value) / peak * 100
            if drawdown > max_drawdown:
                max_drawdown = drawdown

        # 计算夏普比率（简化版）
        returns = pd.Series([self.daily_value[i]['total_value'] / self.daily_value[i-1]['total_value'] - 1
                            for i in range(1, len(self.daily_value))])
        sharpe_ratio = returns.mean() / returns.std() * np.sqrt(252) if returns.std() > 0 else 0

        result = {
            'symbol': symbol,
            'start_date': start_date,
            'end_date': end_date,
            'initial_capital': self.initial_capital,
            'final_value': final_value,
            'total_return': total_return,
            'total_trades': len(self.trades),
            'buy_trades': len(buy_trades),
            'sell_trades': len(sell_trades),
            'win_rate': win_rate,
            'max_drawdown': max_drawdown,
            'sharpe_ratio': sharpe_ratio,
            'trades': self.trades,
            'daily_value': self.daily_value
        }

        return result

    def print_report(self, result: Dict):
        """打印回测报告"""
        print(f"\n{'='*60}")
        print(f"BACKTEST REPORT - {result['symbol']}")
        print(f"{'='*60}")
        print(f"Period:           {result['start_date']} ~ {result['end_date']}")
        print(f"Initial Capital:  {result['initial_capital']:,.2f} CNY")
        print(f"Final Value:      {result['final_value']:,.2f} CNY")
        print(f"Total Return:     {result['total_return']:+.2f}%")
        print(f"-" * 60)
        print(f"Total Trades:     {result['total_trades']}")
        print(f"  Buy Orders:     {result['buy_trades']}")
        print(f"  Sell Orders:    {result['sell_trades']}")
        print(f"Win Rate:         {result['win_rate']:.2f}%")
        print(f"Max Drawdown:     {result['max_drawdown']:.2f}%")
        print(f"Sharpe Ratio:     {result['sharpe_ratio']:.4f}")
        print(f"{'='*60}\n")

        # 打印交易明细
        if result['trades']:
            print("Trade History:")
            print(f"{'Date':<12} {'Action':<6} {'Price':>8} {'Shares':>6} {'Amount':>12} {'Reason':<20}")
            print("-" * 70)
            for trade in result['trades']:
                action = trade['action']
                profit_info = ""
                if action == 'SELL':
                    profit_info = f" (P&L: {trade['profit']:+.2f}, {trade['profit_pct']:+.2f}%)"
                print(f"{str(trade['date']):<12} {action:<6} {trade['price']:>7.2f} {trade['shares']:>6} {trade['amount']:>11,.2f} {trade['reason']:<20}{profit_info}")
            print()


def get_date_range(months: int = 3) -> Tuple[str, str]:
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


def main():
    """主函数"""
    # 配置参数
    SYMBOL = "002202"  # 股票代码
    INITIAL_CAPITAL = 100000.0  # 初始资金 10 万
    MONTHS = 3  # 回测时间范围（近3个月）

    # 获取日期范围
    start_date, end_date = get_date_range(MONTHS)
    print(f"\nDate Range: {start_date} ~ {end_date} (Recent {MONTHS} months)\n")

    # 创建回测引擎
    engine = BacktestEngine(initial_capital=INITIAL_CAPITAL)

    # 运行回测
    result = engine.run_backtest(SYMBOL, start_date, end_date)

    # 打印报告
    engine.print_report(result)

    # 保存回测结果到 CSV
    if result['daily_value']:
        df_daily = pd.DataFrame(result['daily_value'])
        output_file = f"backtest_{SYMBOL}_{start_date}_{end_date}.csv"
        df_daily.to_csv(output_file, index=False, encoding='utf-8-sig')
        print(f"Daily values saved to: {output_file}")


if __name__ == "__main__":
    main()
