# -*- coding: utf-8 -*-
"""
股票交易策略回测模块 V2
增强版：添加趋势跟踪和移动止损机制 + 多数据源自动切换
"""

import os
import time
import random
import pandas as pd
import numpy as np
import akshare as ak
from datetime import datetime, timedelta
from typing import Dict, List, Tuple, Optional

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''


# ================= 多数据源获取器 =================
class MultiSourceFetcher:
    """轻量级多数据源获取器"""

    def __init__(self):
        self.sources = []
        self.fail_counts = {}
        self._init_sources()

    def _init_sources(self):
        """初始化数据源"""
        try:
            import akshare
            self.sources.append({'name': 'AkShare', 'fetch': self._fetch_akshare})
        except ImportError:
            pass

        try:
            import baostock
            self.sources.append({'name': 'baostock', 'fetch': self._fetch_baostock})
        except ImportError:
            pass

        for source in self.sources:
            self.fail_counts[source['name']] = 0

    def fetch_data(self, symbol: str, period: str = "daily") -> Optional[pd.DataFrame]:
        """获取数据 - 自动切换"""
        time.sleep(random.uniform(0.5, 1.5))

        for source in self.sources:
            name = source['name']
            if self.fail_counts.get(name, 0) >= 3:
                continue

            try:
                df = source['fetch'](symbol, period)
                if df is not None and not df.empty:
                    self.fail_counts[name] = 0
                    return df
            except Exception as e:
                if 'Connection' in str(e) or 'Remote' in str(e) or 'aborted' in str(e):
                    self.fail_counts[name] = self.fail_counts.get(name, 0) + 1

        return None

    def _fetch_akshare(self, symbol: str, period: str) -> Optional[pd.DataFrame]:
        """AkShare数据源"""
        return ak.stock_zh_a_hist(symbol=symbol, period="daily", adjust="qfq")

    def _fetch_baostock(self, symbol: str, period: str) -> Optional[pd.DataFrame]:
        """baostock数据源"""
        import baostock as bs
        lg = bs.login()
        if lg.error_code != '0':
            raise Exception(f"登录失败: {lg.error_msg}")

        bs_symbol = f"sh.{symbol}" if symbol.startswith('6') else f"sz.{symbol}"
        end_date = datetime.now().strftime('%Y-%m-%d')

        rs = bs.query_history_k_data_plus(
            bs_symbol, "date,code,open,high,low,close,volume,amount",
            start_date='2020-01-01', end_date=end_date, frequency="d", adjustflag="3"
        )

        data_list = []
        while (rs.error_code == '0') and rs.next():
            data_list.append(rs.get_row_data())
        bs.logout()

        if data_list:
            df = pd.DataFrame(data_list, columns=rs.fields)
            df.columns = ['date', 'code', 'open', 'high', 'low', 'close', 'volume', 'amount']
            for col in ['open', 'high', 'low', 'close', 'volume', 'amount']:
                df[col] = pd.to_numeric(df[col], errors='coerce')
            return df
        return None


class BacktestEngineV2:
    """回测引擎 V2 - 增强版"""

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.25):
        """
        初始化回测引擎

        Args:
            initial_capital: 初始资金，默认 10 万
            trailing_stop_pct: 移动止损百分比，默认 8%
            profit_take_pct: 止盈百分比，默认 25%
        """
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0  # 持仓期间最高价
        self.trades = []
        self.daily_value = []
        self.multi_fetcher = MultiSourceFetcher()  # 多数据源获取器

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

        # 成交量均线
        if '成交量' in columns:
            vol_col = '成交量'
        elif 'volume' in columns:
            vol_col = 'volume'
        elif 'Volume' in columns:
            vol_col = 'Volume'
        else:
            vol_col = None

        if vol_col:
            df['VOL_MA5'] = df[vol_col].rolling(window=5).mean()

        # 趋势强度指标
        df['TREND_UP'] = (df['MA5'] > df['MA10']) & (df['MA10'] > df['MA20'])
        df['TREND_STRONG'] = df['MA5'] > df['MA20']
        df['PRICE_ABOVE_MA20'] = df[close_col] > df['MA20']

        return df

    def get_historical_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """获取历史数据 - 使用多数据源自动切换"""
        print(f"[*] Fetching historical data for {symbol} ({start_date} ~ {end_date})...")

        df = self.multi_fetcher.fetch_data(symbol, period="daily")

        if df is None or df.empty:
            raise ValueError(f"Failed to fetch data for {symbol}")

        # 列名标准化（baostock返回的是英文小写列名）
        if 'date' in df.columns and '日期' not in df.columns:
            df.rename(columns={'date': '日期', 'open': '开盘', 'high': '最高',
                               'low': '最低', 'close': '收盘', 'volume': '成交量'}, inplace=True)

        # 日期过滤
        if '日期' in df.columns:
            df['日期'] = pd.to_datetime(df['日期'])
            df = df[(df['日期'] >= start_date) & (df['日期'] <= end_date)]

        print(f"    [OK] Got {len(df)} records")
        return df

    def generate_signals_v2(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成交易信号 V2 - 趋势跟踪版

        买入策略:
        1. MA金叉 (MA5上穿MA10)
        2. MACD金叉
        3. 价格站稳MA20之上
        4. RSI不超买(<70)

        卖出策略:
        1. 移动止损由主循环处理
        2. MA死叉 (MA5下穿MA10)
        3. 跌破MA20且RSI>50
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

            # === 买入信号 ===
            # 1. MA金叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append("MA金叉")

            # 2. MACD金叉
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']):
                signals_buy.append("MACD金叉")

            # 3. 价格站稳MA20
            if current[close_col] > current['MA20'] and current['MA5'] > current['MA20']:
                signals_buy.append("站稳MA20")

            # 4. 超卖反弹
            if current['RSI'] < 35:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f})")

            # === 卖出信号 ===
            # 1. MA死叉
            if prev['MA5'] >= prev['MA10'] and current['MA5'] < current['MA10']:
                signals_sell.append("MA死叉")

            # 2. 跌破MA20且RSI不低
            if current[close_col] < current['MA20'] and current['RSI'] > 50:
                signals_sell.append("跌破MA20")

            # 3. MACD死叉 + RSI偏高
            if (prev['MACD'] >= prev['MACD_SIGNAL'] and current['MACD'] < current['MACD_SIGNAL']):
                if current['RSI'] > 55:
                    signals_sell.append(f"MACD死叉RSI({current['RSI']:.1f})")

            # 4. RSI极度超买
            if current['RSI'] > 80:
                signals_sell.append(f"RSI超买({current['RSI']:.1f})")

            # 综合判断 - 放宽条件
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            # 买入：至少1个信号且无强卖出信号
            if buy_score >= 1 and sell_score == 0:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)
            # 卖出：至少1个信号且无买入信号
            elif sell_score >= 1 and buy_score == 0:
                df.loc[i, 'signal'] = -1
                df.loc[i, 'signal_reason'] = ','.join(signals_sell)
            # 多个买入信号覆盖单个卖出
            elif buy_score >= 2:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)

        return df

    def execute_trade(self, date, price: float, signal: int, reason: str,
                     current_price: float = None, in_position: bool = False):
        """执行交易"""
        if signal == 1:  # 买入信号
            if self.cash > 0 and self.position == 0:  # 只在空仓时买入
                shares = int(self.cash / price)
                if shares > 0:
                    cost = shares * price
                    self.cash -= cost
                    self.position = shares
                    self.avg_cost = price
                    self.highest_price = price

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
                    print(f"    [BUY] {date} @ {price:.2f} x{shares} shares, reason: {reason}")
                    return True
            return False

        elif signal == -1:  # 卖出信号
            if self.position > 0:  # 只在持仓时卖出
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

                # 重置持仓
                self.position = 0
                self.avg_cost = 0
                self.highest_price = 0
                return True
            return False

        return False

    def check_trailing_stop(self, date, price: float) -> bool:
        """
        检查移动止损

        Args:
            date: 当前日期
            price: 当前价格

        Returns:
            True if should sell, False otherwise
        """
        if self.position == 0:
            return False

        # 更新最高价
        if price > self.highest_price:
            self.highest_price = price

        # 计算回撤
        drawdown_pct = (self.highest_price - price) / self.highest_price

        # 计算盈利
        profit_pct = (price - self.avg_cost) / self.avg_cost

        # 移动止损触发
        if drawdown_pct >= self.trailing_stop_pct:
            reason = f"移动止损 回撤{drawdown_pct*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        # 止盈触发
        if profit_pct >= self.profit_take_pct:
            reason = f"止盈 盈利{profit_pct*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        return False

    def run_backtest(self, symbol: str, start_date: str, end_date: str) -> Dict:
        """运行回测"""
        print(f"\n{'='*60}")
        print(f"BACKTEST V2: {symbol}")
        print(f"Period: {start_date} ~ {end_date}")
        print(f"Initial Capital: {self.initial_capital:,.2f} CNY")
        print(f"Trailing Stop: {self.trailing_stop_pct*100}% | Profit Take: {self.profit_take_pct*100}%")
        print(f"{'='*60}\n")

        # 重置状态
        self.cash = self.initial_capital
        self.position = 0
        self.avg_cost = 0
        self.highest_price = 0
        self.trades = []
        self.daily_value = []

        # 获取并处理数据
        df = self.get_historical_data(symbol, start_date, end_date)
        df = self.calculate_indicators(df)
        df = self.generate_signals_v2(df)

        # 获取列名
        columns = df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
            date_col = '日期'
        else:
            close_col = 'Close'
            date_col = 'Date'

        # 执行回测
        print("[*] Executing backtest with trailing stop...")
        for i, row in df.iterrows():
            current_price = row[close_col]
            in_position = self.position > 0

            # 首先检查移动止损（如果持仓中）
            if in_position:
                stopped = self.check_trailing_stop(row[date_col], current_price)
                if stopped:
                    in_position = False

            # 如果没有信号或者已经处理了移动止损
            if pd.isna(row['signal']) or row['signal'] == 0:
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
                continue

            # 执行信号交易
            self.execute_trade(
                row[date_col],
                current_price,
                int(row['signal']),
                row['signal_reason'],
                current_price,
                in_position
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
        print(f"BACKTEST V2 REPORT - {result['symbol']}")
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
            print(f"{'Date':<12} {'Action':<6} {'Price':>8} {'Shares':>6} {'Amount':>12} {'P&L':>12} {'Reason':<25}")
            print("-" * 85)
            for trade in result['trades']:
                action = trade['action']
                profit_info = ""
                if action == 'SELL':
                    profit_info = f"{trade['profit']:+,.2f} ({trade['profit_pct']:+.2f}%)"
                print(f"{str(trade['date']):<12} {action:<6} {trade['price']:>7.2f} {trade['shares']:>6} {trade['amount']:>11,.2f} {profit_info:>12} {trade['reason']:<25}")
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
    # 配置参数
    SYMBOL = "002202"
    INITIAL_CAPITAL = 100000.0
    MONTHS = 3
    TRAILING_STOP = 0.08  # 8% 移动止损
    PROFIT_TAKE = 0.30    # 30% 止盈

    start_date, end_date = get_date_range(MONTHS)
    print(f"\nDate Range: {start_date} ~ {end_date} (Recent {MONTHS} months)\n")

    engine = BacktestEngineV2(
        initial_capital=INITIAL_CAPITAL,
        trailing_stop_pct=TRAILING_STOP,
        profit_take_pct=PROFIT_TAKE
    )

    result = engine.run_backtest(SYMBOL, start_date, end_date)
    engine.print_report(result)

    # 保存结果
    if result['daily_value']:
        df_daily = pd.DataFrame(result['daily_value'])
        output_file = f"backtest_v2_{SYMBOL}_{start_date}_{end_date}.csv"
        df_daily.to_csv(output_file, index=False, encoding='utf-8-sig')
        print(f"Daily values saved to: {output_file}")


if __name__ == "__main__":
    main()
