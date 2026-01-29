# -*- coding: utf-8 -*-
"""
股票交易策略回测模块 V3
整合资金流向分析的增强版
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


class MultiSourceFetcher:
    """轻量级多数据源获取器"""

    def __init__(self):
        self.sources = []
        self.fail_counts = {}
        self.cooldown_until = {}

        # 优先级顺序：AkShare > baostock
        self.sources.append({'name': 'AkShare', 'priority': 1, 'fetch': self._fetch_akshare})
        self.sources.append({'name': 'baostock', 'priority': 2, 'fetch': self._fetch_baostock})

        for source in self.sources:
            name = source['name']
            self.fail_counts[name] = 0
            self.cooldown_until[name] = 0

    def _fetch_akshare(self, symbol: str, period: str) -> Optional[pd.DataFrame]:
        """使用AkShare获取数据"""
        try:
            df = ak.stock_zh_a_hist(
                symbol=symbol,
                period="daily",
                adjust="qfq"
            )
            if df is not None and not df.empty:
                return df
        except Exception as e:
            print(f"    [AkShare Error] {str(e)[:50]}...")
        return None

    def _fetch_baostock(self, symbol: str, period: str) -> Optional[pd.DataFrame]:
        """使用baostock获取数据"""
        try:
            import baostock as bs
            lg = bs.login()

            # 转换股票代码格式 (000001 -> sz.000001, 600000 -> sh.600000)
            if symbol.startswith('6'):
                bs_symbol = f"sh.{symbol}"
            else:
                bs_symbol = f"sz.{symbol}"

            rs = bs.query_history_k_data_plus(
                bs_symbol,
                "date,open,high,low,close,volume,amount",
                start_date='1990-01-01',
                end_date=datetime.now().strftime('%Y-%m-%d'),
                frequency="d",
                adjustflag="2"
            )

            data_list = []
            while (rs.error_code == '0') & rs.next():
                data_list.append(rs.get_row_data())

            bs.logout()

            if data_list:
                df = pd.DataFrame(data_list, columns=['date', 'open', 'high', 'low', 'close', 'volume', 'amount'])
                df['date'] = pd.to_datetime(df['date'])
                df['open'] = df['open'].astype(float)
                df['high'] = df['high'].astype(float)
                df['low'] = df['low'].astype(float)
                df['close'] = df['close'].astype(float)
                df['volume'] = df['volume'].astype(float)
                return df
        except Exception as e:
            print(f"    [baostock Error] {str(e)[:50]}...")
        return None

    def fetch_data(self, symbol: str, period: str = "daily") -> Optional[pd.DataFrame]:
        """自动切换数据源获取数据"""
        now = time.time()

        for source in sorted(self.sources, key=lambda x: x['priority']):
            name = source['name']

            if self.fail_counts.get(name, 0) >= 3 and now < self.cooldown_until.get(name, 0):
                continue

            print(f"    [Trying {name}] {symbol}...", end=' ')
            time.sleep(random.uniform(0.5, 1.5))

            df = source['fetch'](symbol, period)

            if df is not None and not df.empty:
                self.fail_counts[name] = 0
                print(f"OK ({len(df)} records) [Source: {name}]")
                return df
            else:
                self.fail_counts[name] = self.fail_counts.get(name, 0) + 1
                print(f"Failed (fail_count={self.fail_counts[name]})")

                if self.fail_counts[name] >= 3:
                    cooldown = 300
                    self.cooldown_until[name] = now + cooldown
                    print(f"    [{name} 进入冷却 {cooldown}s]")

        print("    [All sources failed]")
        return None


class BacktestEngineV3:
    """回测引擎 V3 - 整合资金流向分析"""

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.30):
        """
        初始化回测引擎

        Args:
            initial_capital: 初始资金，默认 10 万
            trailing_stop_pct: 移动止损百分比，默认 8%
            profit_take_pct: 止盈百分比，默认 30%
        """
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.trades = []
        self.daily_value = []
        self.fund_flow_data = None  # 资金流向数据
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

        # 趋势指标
        df['TREND_UP'] = (df['MA5'] > df['MA10']) & (df['MA10'] > df['MA20'])
        df['PRICE_ABOVE_MA20'] = df[close_col] > df['MA20']

        return df

    def get_fund_flow_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """
        获取资金流向数据

        Args:
            symbol: 股票代码
            start_date: 开始日期 (YYYYMMDD)
            end_date: 结束日期 (YYYYMMDD)

        Returns:
            资金流向数据
        """
        print(f"[*] Fetching fund flow data for {symbol}...")

        try:
            # 判断市场
            market = "sh" if symbol.startswith("6") or symbol.startswith("5") else "sz"

            # 获取资金流向数据
            fund_df = ak.stock_individual_fund_flow(stock=symbol, market=market)

            if fund_df is None or fund_df.empty:
                print("    [SKIP] No fund flow data available")
                return None

            # 转换日期格式
            fund_df['日期'] = pd.to_datetime(fund_df['日期']).dt.strftime('%Y%m%d')

            # 过滤日期范围
            fund_df = fund_df[(fund_df['日期'] >= start_date) & (fund_df['日期'] <= end_date)]

            if fund_df.empty:
                print("    [SKIP] No fund flow data in date range")
                return None

            print(f"    [OK] Got {len(fund_df)} fund flow records")
            return fund_df

        except Exception as e:
            print(f"    [SKIP] Fund flow fetch failed: {str(e)[:40]}...")
            return None

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

    def merge_fund_flow_to_price(self, price_df: pd.DataFrame, fund_df: pd.DataFrame) -> pd.DataFrame:
        """
        将资金流向数据合并到价格数据

        Args:
            price_df: 价格数据
            fund_df: 资金流向数据

        Returns:
            合并后的数据
        """
        if fund_df is None or fund_df.empty:
            price_df['net_inflow_main'] = 0
            price_df['net_inflow_ratio'] = 0
            price_df['fund_trend'] = 0
            return price_df

        # 获取日期列名
        columns = price_df.columns.tolist()
        if '日期' in columns:
            date_col = '日期'
        else:
            date_col = 'Date'

        # 转换价格数据的日期格式
        price_df['_date_key'] = pd.to_datetime(price_df[date_col]).dt.strftime('%Y%m%d')
        fund_df['_date_key'] = fund_df['日期']

        # 提取关键字段（兼容不同版本的列名）
        fund_cols = fund_df.columns.tolist()

        # 主力净流入
        if '大单净流入-净额' in fund_cols:
            net_col = '大单净流入-净额'
            ratio_col = '大单净流入-净占比'
        elif '主力净流入-净额' in fund_cols:
            net_col = '主力净流入-净额'
            ratio_col = '主力净流入-净占比'
        elif '超大单净流入-净额' in fund_cols:
            # 使用超大单+大单作为主力
            fund_df['_主力净额'] = fund_df.get('超大单净流入-净额', 0) + fund_df.get('大单净流入-净额', 0)
            fund_df['_主力占比'] = fund_df.get('超大单净流入-净占比', 0) + fund_df.get('大单净流入-净占比', 0)
            net_col = '_主力净额'
            ratio_col = '_主力占比'
        else:
            price_df['net_inflow_main'] = 0
            price_df['net_inflow_ratio'] = 0
            price_df['fund_trend'] = 0
            return price_df

        # 合并数据
        merged = price_df.merge(
            fund_df[['_date_key', net_col, ratio_col]],
            on='_date_key',
            how='left'
        )

        # 填充缺失值
        merged[net_col] = merged[net_col].fillna(0)
        merged[ratio_col] = merged[ratio_col].fillna(0)

        # 重命名列
        merged['net_inflow_main'] = merged[net_col]
        merged['net_inflow_ratio'] = merged[ratio_col]

        # 计算资金趋势（3日累计净流入）
        merged['fund_trend_3d'] = merged['net_inflow_main'].rolling(window=3).sum()

        # 判断资金趋势状态
        merged['fund_trend'] = 0  # 0: 中性, 1: 流入, -1: 流出
        merged.loc[merged['fund_trend_3d'] > 0, 'fund_trend'] = 1
        merged.loc[merged['fund_trend_3d'] < 0, 'fund_trend'] = -1

        # 删除临时列
        merged = merged.drop(columns=['_date_key'])

        return merged

    def generate_signals_v3(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成交易信号 V3 - 整合资金流向

        买入策略:
        1. MA金叉
        2. MACD金叉
        3. 价格站稳MA20
        4. RSI超卖

        资金流向作为加分项:
        - 资金流入时，买入信号优先级更高
        - 资金流出时，买入信号需要更强的技术面确认

        卖出策略:
        1. MA死叉
        2. 跌破MA20
        3. MACD死叉 + RSI偏高
        4. RSI极度超买
        5. 资金大幅流出(>-15%)
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

            # 获取资金流向状态
            fund_trend = current.get('fund_trend', 0)
            net_inflow = current.get('net_inflow_main', 0)
            net_ratio = current.get('net_inflow_ratio', 0)

            # 资金状态描述
            fund_status = ""
            if net_ratio > 5:
                fund_status = f"[资金大流入+{net_ratio:.0f}%]"
            elif net_ratio > 0:
                fund_status = "[资金流入+]"
            elif net_ratio < -10:
                fund_status = f"[资金大流出{net_ratio:.0f}%]"
            elif net_ratio < 0:
                fund_status = "[资金流出-]"

            # === 买入信号 ===
            # 1. MA金叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                reason = f"MA金叉{fund_status}"
                signals_buy.append(reason)

            # 2. MACD金叉
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']):
                # 资金流出时需要RSI确认
                if fund_trend < 0:
                    if current['RSI'] < 50:
                        signals_buy.append(f"MACD金叉{fund_status}")
                else:
                    signals_buy.append(f"MACD金叉{fund_status}")

            # 3. 价格站稳MA20
            if current[close_col] > current['MA20'] and current['MA5'] > current['MA20']:
                # 检查是否刚突破
                if prev[close_col] <= prev['MA20']:
                    signals_buy.append(f"突破MA20{fund_status}")
                else:
                    # 已站稳，结合资金趋势
                    if fund_trend >= 0:
                        signals_buy.append(f"站稳MA20{fund_status}")

            # 4. 超卖反弹
            if current['RSI'] < 35:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f}){fund_status}")

            # === 卖出信号 ===
            # 1. MA死叉
            if prev['MA5'] >= prev['MA10'] and current['MA5'] < current['MA10']:
                signals_sell.append(f"MA死叉{fund_status}")

            # 2. 跌破MA20 (配合资金流出)
            if current[close_col] < current['MA20']:
                if fund_trend <= 0 or current['RSI'] > 50:
                    signals_sell.append(f"跌破MA20{fund_status}")

            # 3. MACD死叉 + RSI偏高
            if (prev['MACD'] >= prev['MACD_SIGNAL'] and current['MACD'] < current['MACD_SIGNAL']):
                if current['RSI'] > 55:
                    signals_sell.append(f"MACD死叉RSI({current['RSI']:.1f}){fund_status}")

            # 4. RSI极度超买
            if current['RSI'] > 80:
                signals_sell.append(f"RSI超买({current['RSI']:.1f}){fund_status}")

            # 5. 资金大幅流出（单日<-15%）- 强制卖出
            if net_ratio < -15:
                signals_sell.append(f"资金恐慌流出({net_ratio:.0f}%)")

            # 综合判断
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
                return True
            return False

        return False

    def check_trailing_stop(self, date, price: float) -> bool:
        """检查移动止损"""
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
            reason = f"移动止损回撤{drawdown_pct*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        # 止盈触发
        if profit_pct >= self.profit_take_pct:
            reason = f"止盈盈利{profit_pct*100:.1f}%"
            self.execute_trade(date, price, -1, reason)
            return True

        return False

    def run_backtest(self, symbol: str, start_date: str, end_date: str) -> Dict:
        """运行回测"""
        print(f"\n{'='*60}")
        print(f"BACKTEST V3: {symbol} (整合资金流向分析)")
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

        # 获取数据
        price_df = self.get_historical_data(symbol, start_date, end_date)
        fund_df = self.get_fund_flow_data(symbol, start_date, end_date)

        # 计算指标
        price_df = self.calculate_indicators(price_df)

        # 合并资金流向数据
        price_df = self.merge_fund_flow_to_price(price_df, fund_df)

        # 生成信号
        price_df = self.generate_signals_v3(price_df)

        # 获取列名
        columns = price_df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
            date_col = '日期'
        else:
            close_col = 'Close'
            date_col = 'Date'

        # 执行回测
        print("[*] Executing backtest...")
        for i, row in price_df.iterrows():
            current_price = row[close_col]

            # 检查移动止损
            if self.position > 0:
                stopped = self.check_trailing_stop(row[date_col], current_price)
                if stopped:
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
                'net_inflow': row.get('net_inflow_main', 0),
                'fund_trend': row.get('fund_trend', 0)
            })

        # 最后一天强制平仓
        last_row = price_df.iloc[-1]
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
        print(f"BACKTEST V3 REPORT - {result['symbol']}")
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
                reason = trade['reason'][:30] if len(trade['reason']) > 30 else trade['reason']
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
    TRAILING_STOP = 0.08
    PROFIT_TAKE = 0.30

    start_date, end_date = get_date_range(MONTHS)
    print(f"\nDate Range: {start_date} ~ {end_date} (Recent {MONTHS} months)\n")

    engine = BacktestEngineV3(
        initial_capital=INITIAL_CAPITAL,
        trailing_stop_pct=TRAILING_STOP,
        profit_take_pct=PROFIT_TAKE
    )

    result = engine.run_backtest(SYMBOL, start_date, end_date)
    engine.print_report(result)

    # 保存结果
    if result['daily_value']:
        df_daily = pd.DataFrame(result['daily_value'])
        output_file = f"backtest_v3_{SYMBOL}_{start_date}_{end_date}.csv"
        df_daily.to_csv(output_file, index=False, encoding='utf-8-sig')
        print(f"Daily values saved to: {output_file}")


if __name__ == "__main__":
    main()
