# -*- coding: utf-8 -*-
"""
股票交易策略回测模块 V2-Optimized
激进型优化版：更高收益，动态止盈止损
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


class BacktestEngineV2Opt:
    """回测引擎 V2 优化版 - 激进型"""

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50,
                 use_dynamic_stop: bool = True):
        """
        初始化回测引擎

        Args:
            initial_capital: 初始资金，默认 10 万
            trailing_stop_pct: 基础移动止损百分比，默认 6%
            profit_take_pct: 止盈百分比，默认 50%（提高）
            use_dynamic_stop: 是否使用动态止损
        """
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.use_dynamic_stop = use_dynamic_stop
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.lowest_since_highest = 0.0  # 最高价后的最低价
        self.trades = []
        self.daily_value = []
        self.consecutive_up_days = 0  # 连续上涨天数
        self.consecutive_down_days = 0  # 连续下跌天数

    def calculate_indicators(self, df: pd.DataFrame) -> pd.DataFrame:
        """计算技术指标"""
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
        df['MA60'] = df[close_col].rolling(window=60).mean()

        # RSI
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

        # ATR (Average True Range) - 波动率指标
        df['HL'] = df.get('最高', df.get('High', df[close_col])) - df.get('最低', df.get('Low', df[close_col]))
        df['HC'] = abs(df.get('最高', df.get('High', df[close_col])) - df[close_col].shift(1))
        df['LC'] = abs(df.get('最低', df.get('Low', df[close_col])) - df[close_col].shift(1))
        df['TR'] = df[['HL', 'HC', 'LC']].max(axis=1)
        df['ATR'] = df['TR'].rolling(window=14).mean()

        # 动量指标
        df['MOMENTUM_5'] = df[close_col] / df[close_col].shift(5) - 1  # 5日涨跌幅
        df['MOMENTUM_10'] = df[close_col] / df[close_col].shift(10) - 1  # 10日涨跌幅

        # 趋势强度
        df['TREND_UP'] = (df['MA5'] > df['MA10']) & (df['MA10'] > df['MA20'])
        df['TREND_STRONG'] = df['MA5'] > df['MA20']
        df['PRICE_ABOVE_MA20'] = df[close_col] > df['MA20']

        # 突破信号
        df['BREAKOUT_20D'] = df[close_col] > df[close_col].shift(1).rolling(20).max().shift(1)

        return df

    def get_historical_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """获取历史数据"""
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

    def generate_signals_aggressive(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成激进型交易信号

        买入策略（更激进）:
        1. MA金叉
        2. MACD金叉
        3. 突破20日新高
        4. RSI超卖反弹
        5. 价格站稳MA5（降低门槛）

        卖出策略:
        由移动止损/止盈处理，避免过早卖出
        """
        df = df.copy()
        df['signal'] = 0
        df['signal_reason'] = ''

        # 获取收盘价列名
        columns = df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
        else:
            close_col = 'Close'

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
            if current.get('BREAKOUT_20D', False):
                signals_buy.append("突破20日新高")

            # 4. 价格站稳MA5（激进）
            if current[close_col] > current['MA5'] and current['MA5'] > current['MA10']:
                # 刚突破
                if prev[close_col] <= prev['MA5']:
                    signals_buy.append("突破MA5")
                # 连续上涨
                elif current['MOMENTUM_5'] > 0.03:  # 5日涨幅>3%
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
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)
            # 卖出：极端情况
            elif sell_score >= 1 and buy_score == 0:
                df.loc[i, 'signal'] = -1
                df.loc[i, 'signal_reason'] = ','.join(signals_sell)

        return df

    def get_dynamic_stop_loss(self, current_price: float) -> Tuple[float, float]:
        """
        动态止损止盈计算

        基于当前盈利状态和波动率动态调整
        """
        if self.avg_cost == 0:
            return self.trailing_stop_pct, self.profit_take_pct

        profit_pct = (current_price - self.avg_cost) / self.avg_cost

        # 动态调整止损
        if profit_pct > 0.5:  # 盈利>50%
            # 保护50%利润，止损设为盈利点的50%回撤
            stop_loss = max(0.05, profit_pct * 0.5)
        elif profit_pct > 0.3:  # 盈利>30%
            # 保护30%利润
            stop_loss = max(0.04, profit_pct * 0.4)
        elif profit_pct > 0.15:  # 盈利>15%
            # 盈亏平衡点+5%
            stop_loss = 0.02
        else:  # 盈利<15%
            # 使用基础止损
            stop_loss = self.trailing_stop_pct

        # 动态调整止盈（让利润奔跑）
        if profit_pct > 0.3:  # 已有30%利润
            # 使用追踪止盈，回撤10%才卖出
            take_profit = max(profit_pct * 0.7, 0.15)
        elif profit_pct > 0.2:
            take_profit = 0.4
        else:
            take_profit = self.profit_take_pct

        return stop_loss, take_profit

    def execute_trade(self, date, price: float, signal: int, reason: str):
        """执行交易"""
        if signal == 1:  # 买入信号
            if self.cash > 0 and self.position == 0:
                shares = int(self.cash / price)
                if shares > 0:
                    cost = shares * price
                    self.cash -= cost
                    self.position = shares
                    self.avg_cost = price
                    self.highest_price = price
                    self.lowest_since_highest = price
                    self.consecutive_up_days = 0
                    self.consecutive_down_days = 0

                    self.trades.append({
                        'date': date,
                        'action': 'BUY',
                        'price': price,
                        'shares': shares,
                        'amount': cost,
                        'reason': reason,
                        'cash_after': self.cash,
                        'position_after': self.position
                    })
                    print(f"    [BUY] {date} @ {price:.2f} x{shares} shares - {reason}")
                    return True
            return False

        elif signal == -1:  # 卖出信号
            if self.position > 0:
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
                print(f"    [SELL] {date} @ {price:.2f} x{self.position} shares, profit: {profit:.2f} ({profit_pct:.2f}%) - {reason}")

                self.position = 0
                self.avg_cost = 0
                self.highest_price = 0
                self.lowest_since_highest = 0
                return True
            return False

        return False

    def check_dynamic_stop(self, date, price: float, prev_price: float) -> bool:
        """
        动态止损止盈检查

        优化版：
        1. 盈利<10%：不启动移动止损，只硬止损
        2. 盈利10-30%：宽松止损（15%回撤）
        3. 盈利>30%：动态追踪止损

        Args:
            date: 当前日期
            price: 当前价格
            prev_price: 前一日价格

        Returns:
            True if should sell, False otherwise
        """
        if self.position == 0:
            return False

        # 更新最高价
        if price > self.highest_price:
            self.highest_price = price
            self.lowest_since_highest = price
            self.consecutive_up_days += 1
            self.consecutive_down_days = 0
        elif price < self.lowest_since_highest:
            self.lowest_since_highest = price
            self.consecutive_up_days = 0
            self.consecutive_down_days += 1

        # 计算盈利
        profit_pct = (price - self.avg_cost) / self.avg_cost

        # 硬止损：亏损超过20%
        if profit_pct < -0.20:
            reason = f"硬止损亏损{profit_pct*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        # 分阶段动态止损
        if profit_pct < 0.10:
            # 盈利<10%：不启动移动止损，给股票更多波动空间
            return False
        elif profit_pct < 0.20:
            # 盈利10-20%：宽松止损，回撤20%才卖出
            stop_loss_pct = 0.20
            take_profit_pct = 0.50
        elif profit_pct < 0.30:
            # 盈利20-30%：保护部分利润
            stop_loss_pct = 0.15
            take_profit_pct = 0.60
        elif profit_pct < 0.50:
            # 盈利30-50%：紧密追踪
            stop_loss_pct = 0.10
            take_profit_pct = 0.80
        else:
            # 盈利>50%：让利润大幅奔跑
            stop_loss_pct = 0.08
            take_profit_pct = 1.00  # 100%才止盈

        # 计算从最高点的回撤
        drawdown_from_highest = (self.highest_price - price) / self.highest_price

        # 止盈触发
        if profit_pct >= take_profit_pct:
            # 强势延续，继续持有
            if self.consecutive_up_days >= 3:
                return False
            reason = f"止盈盈利{profit_pct*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        # 移动止损触发
        if drawdown_from_highest >= stop_loss_pct:
            # 检查是否是假跌破
            if self.consecutive_down_days < 3:
                return False
            reason = f"移动止损回撤{drawdown_from_highest*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        return False

    def run_backtest(self, symbol: str, start_date: str, end_date: str) -> Dict:
        """运行回测"""
        print(f"\n{'='*60}")
        print(f"BACKTEST V2-OPTIMIZED: {symbol} (激进型优化)")
        print(f"Period: {start_date} ~ {end_date}")
        print(f"Initial Capital: {self.initial_capital:,.2f} CNY")
        print(f"Base Trailing Stop: {self.trailing_stop_pct*100}% | Profit Take: {self.profit_take_pct*100}%")
        print(f"Dynamic Stop: {self.use_dynamic_stop}")
        print(f"{'='*60}\n")

        # 重置状态
        self.cash = self.initial_capital
        self.position = 0
        self.avg_cost = 0
        self.highest_price = 0
        self.lowest_since_highest = 0
        self.consecutive_up_days = 0
        self.consecutive_down_days = 0
        self.trades = []
        self.daily_value = []

        # 获取并处理数据
        df = self.get_historical_data(symbol, start_date, end_date)
        df = self.calculate_indicators(df)
        df = self.generate_signals_aggressive(df)

        # 获取列名
        columns = df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
            date_col = '日期'
        else:
            close_col = 'Close'
            date_col = 'Date'

        # 执行回测
        print("[*] Executing backtest with dynamic stop loss...")
        prev_price = None
        for i, row in df.iterrows():
            current_price = row[close_col]

            # 检查动态止损止盈
            if self.position > 0 and prev_price is not None:
                stopped = self.check_dynamic_stop(row[date_col], current_price, prev_price)
                if stopped:
                    prev_price = current_price
                    continue

            # 处理交易信号
            if pd.notna(row['signal']) and row['signal'] != 0:
                self.execute_trade(
                    row[date_col],
                    current_price,
                    int(row['signal']),
                    row['signal_reason']
                )

            # 更新每日净值
            total_value = self.cash + self.position * current_price
            self.daily_value.append({
                'date': row[date_col],
                'total_value': total_value,
                'cash': self.cash,
                'position': self.position,
                'price': current_price,
                'highest_price': self.highest_price if self.position > 0 else 0
            })

            prev_price = current_price

        # 最后一天强制平仓
        last_row = df.iloc[-1]
        if self.position > 0:
            self.execute_trade(last_row[date_col], last_row[close_col], -1, "回测结束平仓")

        # 计算结果
        final_value = self.cash
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        buy_trades = [t for t in self.trades if t['action'] == 'BUY']
        sell_trades = [t for t in self.trades if t['action'] == 'SELL']
        profitable_trades = [t for t in sell_trades if t.get('profit', 0) > 0]
        win_rate = len(profitable_trades) / len(sell_trades) * 100 if sell_trades else 0

        # 最大回撤
        daily_values = [v['total_value'] for v in self.daily_value]
        peak = daily_values[0]
        max_drawdown = 0
        for value in daily_values:
            if value > peak:
                peak = value
            drawdown = (peak - value) / peak * 100
            if drawdown > max_drawdown:
                max_drawdown = drawdown

        # 夏普比率
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
        print(f"BACKTEST V2-OPTIMIZED REPORT - {result['symbol']}")
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
            print(f"{'Date':<12} {'Action':<6} {'Price':>8} {'Shares':>6} {'Amount':>12} {'P&L':>12} {'Reason'}")
            print("-" * 100)
            for trade in result['trades']:
                action = trade['action']
                profit_info = ""
                if action == 'SELL':
                    profit_info = f"{trade['profit']:+,.2f} ({trade['profit_pct']:+.2f}%)"
                reason = trade['reason'][:35] if len(trade['reason']) > 35 else trade['reason']
                print(f"{str(trade['date']):<12} {action:<6} {trade['price']:>7.2f} {trade['shares']:>6} {trade['amount']:>11,.2f} {profit_info:>12} {reason}")
            print()


def get_date_range(months: int = 3) -> Tuple[str, str]:
    """获取最近N个月的日期范围"""
    end = datetime.now()
    start = end - timedelta(days=30 * months)

    if end.weekday() == 5:
        end = end - timedelta(days=1)
    elif end.weekday() == 6:
        end = end - timedelta(days=2)

    return start.strftime('%Y%m%d'), end.strftime('%Y%m%d')


def main():
    """主函数"""
    SYMBOL = "002202"
    INITIAL_CAPITAL = 100000.0
    MONTHS = 3
    TRAILING_STOP = 0.06    # 6% 基础止损
    PROFIT_TAKE = 0.50      # 50% 止盈（让利润奔跑）

    start_date, end_date = get_date_range(MONTHS)
    print(f"\nDate Range: {start_date} ~ {end_date} (Recent {MONTHS} months)\n")

    engine = BacktestEngineV2Opt(
        initial_capital=INITIAL_CAPITAL,
        trailing_stop_pct=TRAILING_STOP,
        profit_take_pct=PROFIT_TAKE,
        use_dynamic_stop=True  # 启用动态止损
    )

    result = engine.run_backtest(SYMBOL, start_date, end_date)
    engine.print_report(result)

    # 保存结果
    if result['daily_value']:
        df_daily = pd.DataFrame(result['daily_value'])
        output_file = f"backtest_v2opt_{SYMBOL}_{start_date}_{end_date}.csv"
        df_daily.to_csv(output_file, index=False, encoding='utf-8-sig')
        print(f"Daily values saved to: {output_file}")


if __name__ == "__main__":
    main()
