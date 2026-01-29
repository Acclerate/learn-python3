# -*- coding: utf-8 -*-
"""
股票交易策略 V2.2 - 多数据源增强版
解决IP限流问题，支持多个数据源自动切换

核心改进：
1. 多数据源轮询机制（akshare、百度金融、tushare、yfinance）
2. 智能数据源选择（按成功率和权重自动选择最佳源）
3. 请求频率控制（每个数据源独立限流管理）
4. 自动冷却恢复（连续失败后自动恢复）
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


class MultiSourceDataFetcher:
    """多数据源行情获取器"""

    def __init__(self):
        self.current_source = None
        self.source_stats = {}
        self.last_request_time = {}
        self.cooled_sources = set()

        # 数据源配置
        self.sources = {
            'akshare_em': {
                'name': '东方财富(akshare)',
                'priority': 1,
                'min_interval': 5,
                'weight': 0.4,
            },
            'baostock': {
                'name': '百度金融',
                'priority': 2,
                'min_interval': 2,
                'weight': 0.3,
            },
            'tushare_sina': {
                'name': '新浪财经',
                'priority': 3,
                'min_interval': 3,
                'weight': 0.2,
            },
            'yfinance': {
                'name': 'Yahoo Finance',
                'priority': 4,
                'min_interval': 1,
                'weight': 0.1,
            },
        }

        for source_id in self.sources:
            self.source_stats[source_id] = {'success': 0, 'fail': 0}
            self.last_request_time[source_id] = 0

    def _check_interval(self, source_id: str):
        """检查并等待请求间隔"""
        current_time = time.time()
        last_time = self.last_request_time.get(source_id, 0)
        min_interval = self.sources[source_id]['min_interval']

        if current_time - last_time < min_interval:
            wait_time = min_interval - (current_time - last_time)
            time.sleep(wait_time)

    def _update_stats(self, source_id: str, success: bool):
        """更新数据源统计"""
        if source_id in self.source_stats:
            if success:
                self.source_stats[source_id]['success'] += 1
                self.cooled_sources.discard(source_id)
            else:
                self.source_stats[source_id]['fail'] += 1
                if self.source_stats[source_id]['fail'] >= 3:
                    self.cooled_sources.add(source_id)
                    print(f"[COOLDOWN] 数据源 {self.sources[source_id]['name']} 连续失败3次，进入冷却")

        self.last_request_time[source_id] = time.time()

    def get_available_sources(self) -> List[str]:
        """获取可用数据源列表"""
        return [s for s in self.sources.keys() if s not in self.cooled_sources]

    def fetch_stock_data(self, symbol: str, period: str = "daily",
                         start_date: Optional[str] = None,
                         end_date: Optional[str] = None,
                         max_retries: int = 3) -> Optional[pd.DataFrame]:
        """
        获取股票数据（多数据源自动切换）

        Args:
            symbol: 股票代码
            period: 数据周期 ('daily', 'minute')
            start_date: 开始日期 (YYYYMMDD)
            end_date: 结束日期 (YYYYMMDD)
            max_retries: 最大重试次数

        Returns:
            DataFrame or None
        """
        symbol = str(symbol).zfill(6)
        tried_sources = set()

        for attempt in range(max_retries):
            available = self.get_available_sources()

            if not available:
                print(f"[WARNING] 所有数据源都在冷却中，等待60秒...")
                time.sleep(60)
                available = list(self.sources.keys())
                self.cooled_sources.clear()  # 强制重置冷却

            # 选择最佳数据源
            source_id = available[0] if attempt == 0 else available[random.randint(0, len(available)-1)]
            source_id = max(available, key=lambda x: self.source_stats[x]['success'] / max(1, sum(self.source_stats[x].values())))

            if source_id in tried_sources:
                source_id = available[random.randint(0, len(available)-1)]

            tried_sources.add(source_id)
            self._check_interval(source_id)

            print(f"[*] 尝试 {self.sources[source_id]['name']} (第{attempt+1}次尝试)")

            try:
                df = self._fetch_from_source(source_id, symbol, period, start_date, end_date)

                if df is not None and not df.empty:
                    self._update_stats(source_id, True)
                    self.current_source = source_id
                    print(f"[OK] 从 {self.sources[source_id]['name']} 获取 {len(df)} 条数据")
                    return df

                self._update_stats(source_id, False)

            except Exception as e:
                print(f"[ERROR] {self.sources[source_id]['name']}: {str(e)[:50]}")
                self._update_stats(source_id, False)

            wait_time = 5 + random.uniform(1, 3) * (attempt + 1)
            print(f"[*] 等待 {wait_time:.1f} 秒后重试...")
            time.sleep(wait_time)

        return None

    def _fetch_from_source(self, source_id: str, symbol: str, period: str,
                           start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """从指定数据源获取数据"""
        fetchers = {
            'akshare_em': self._fetch_akshare,
            'baostock': self._fetch_baostock,
            'tushare_sina': self._fetch_tushare,
            'yfinance': self._fetch_yfinance,
        }

        fetcher = fetchers.get(source_id)
        if fetcher:
            return fetcher(symbol, period, start_date, end_date)
        return None

    def _fetch_akshare(self, symbol: str, period: str,
                       start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """akshare获取"""
        try:
            if period == "minute":
                df = ak.stock_zh_a_hist_min_em(symbol=symbol, period="1", adjust="qfq")
            else:
                if start_date and end_date:
                    df = ak.stock_zh_a_hist(symbol=symbol, period="daily",
                                           start_date=start_date, end_date=end_date, adjust="qfq")
                else:
                    df = ak.stock_zh_a_hist(symbol=symbol, period="daily", adjust="qfq")

            if df is not None and not df.empty:
                return self._standardize_columns(df).tail(100)
        except:
            raise

        return None

    def _fetch_baostock(self, symbol: str, period: str,
                        start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """百度金融获取"""
        try:
            import baostock as bs

            lg = bs.login()
            if lg.error_code != '0':
                return None

            start = f"{start_date[:4]}-{start_date[4:6]}-{start_date[6:8]}" if start_date else '2020-01-01'
            end = f"{end_date[:4]}-{end_date[4:6]}-{end_date[6:8]}" if end_date else datetime.now().strftime('%Y-%m-%d')

            rs = bs.query_history_k_data_plus(
                f"sh.{symbol}" if symbol.startswith('6') else f"sz.{symbol}",
                "date,code,open,high,low,close,volume",
                start_date=start, end_date=end,
                frequency="daily" if period == "daily" else "5",
                adjustflag="3"
            )

            data_list = []
            while rs.error_code == '0' and rs.next():
                data_list.append(rs.get_row_data())

            bs.logout()

            if data_list:
                df = pd.DataFrame(data_list, columns=rs.fields)
                for col in ['open', 'high', 'low', 'close', 'volume']:
                    df[col] = pd.to_numeric(df[col], errors='coerce')
                return df

        except ImportError:
            print("[WARNING] baostock未安装")
        except:
            raise

        return None

    def _fetch_tushare(self, symbol: str, period: str,
                       start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """Tushare获取"""
        try:
            import tushare as ts

            if period == "minute":
                df = ts.get_k_data(symbol, ktype='1')
            else:
                df = ts.get_k_data(symbol, ktype='D')

            if df is not None and not df.empty:
                return df

        except ImportError:
            print("[WARNING] tushare未安装")
        except:
            raise

        return None

    def _fetch_yfinance(self, symbol: str, period: str,
                        start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """Yahoo Finance获取"""
        try:
            import yfinance as yf

            ticker = f"{symbol}.SZ" if not symbol.startswith('6') else f"{symbol}.SS"
            stock = yf.Ticker(ticker)

            if start_date and end_date:
                df = stock.history(start=f"{start_date[:4]}-{start_date[4:6]}-{start_date[6:8]}",
                                   end=f"{end_date[:4]}-{end_date[4:6]}-{end_date[6:8]}")
            else:
                df = stock.history(period="3mo")

            if df is not None and not df.empty:
                df = df.reset_index()
                df['date'] = df['Date'].dt.strftime('%Y-%m-%d')
                return df[['date', 'Open', 'High', 'Low', 'Close', 'Volume']]

        except ImportError:
            print("[WARNING] yfinance未安装")
        except:
            raise

        return None

    def _standardize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        """标准化列名"""
        column_mapping = {
            '日期': 'date', '开盘': 'open', '最高': 'high',
            '最低': 'low', '收盘': 'close', '成交量': 'volume'
        }
        return df.rename(columns=column_mapping)


class TradingEngineV22:
    """交易引擎 V2.2（多数据源增强版）"""

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50,
                 check_interval: int = 60):
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.check_interval = check_interval

        # 账户状态
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.lowest_since_highest = 0.0
        self.consecutive_up_mins = 0
        self.consecutive_down_mins = 0

        # 数据存储
        self.trades = []
        self.minute_records = []

        # 初始化多数据源获取器
        self.data_fetcher = MultiSourceDataFetcher()

        # 策略参数
        self.ma_periods = [5, 10, 20, 60]
        self.rsi_period = 14
        self.macd_fast = 12
        self.macd_slow = 26
        self.macd_signal = 9
        self.boll_period = 20
        self.atr_period = 14

    def get_realtime_data(self, symbol: str) -> Optional[pd.DataFrame]:
        """
        获取实时行情数据（多数据源自动切换）

        Returns:
            行情DataFrame
        """
        # 优先尝试分钟级数据
        for period in ["minute", "daily"]:
            print(f"[*] 尝试获取 {symbol} {period}级数据...")
            df = self.data_fetcher.fetch_stock_data(symbol, period=period)
            if df is not None and not df.empty:
                return df

        return None

    def calculate_indicators(self, df: pd.DataFrame) -> pd.DataFrame:
        """计算技术指标"""
        df = df.copy()

        columns = df.columns.tolist()
        close_col = 'close' if 'close' in columns else '收盘'
        high_col = 'high' if 'high' in columns else '最高'
        low_col = 'low' if 'low' in columns else '最低'
        volume_col = 'volume' if 'volume' in columns else '成交量'

        # 移动平均线
        for period in self.ma_periods:
            df[f'MA{period}'] = df[close_col].rolling(window=period).mean()

        # RSI
        delta = df[close_col].diff()
        gain = delta.where(delta > 0, 0).rolling(window=self.rsi_period).mean()
        loss = (-delta.where(delta < 0, 0)).rolling(window=self.rsi_period).mean()
        rs = gain / loss.replace(0, np.nan)
        df['RSI'] = 100 - (100 / (1 + rs))
        df['RSI'] = df['RSI'].fillna(50)

        # MACD
        exp_fast = df[close_col].ewm(span=self.macd_fast, adjust=False).mean()
        exp_slow = df[close_col].ewm(span=self.macd_slow, adjust=False).mean()
        df['MACD'] = exp_fast - exp_slow
        df['MACD_SIGNAL'] = df['MACD'].ewm(span=self.macd_signal, adjust=False).mean()
        df['MACD_HIST'] = df['MACD'] - df['MACD_SIGNAL']

        # 布林带
        df['BOLL_MID'] = df[close_col].rolling(window=self.boll_period).mean()
        df['BOLL_STD'] = df[close_col].rolling(window=self.boll_period).std()
        df['BOLL_UPPER'] = df['BOLL_MID'] + 2 * df['BOLL_STD']
        df['BOLL_LOWER'] = df['BOLL_MID'] - 2 * df['BOLL_STD']

        # ATR
        df['HL'] = df[high_col] - df[low_col]
        df['HC'] = abs(df[high_col] - df[close_col].shift(1))
        df['LC'] = abs(df[low_col] - df[close_col].shift(1))
        df['TR'] = df[['HL', 'HC', 'LC']].max(axis=1)
        df['ATR'] = df['TR'].rolling(window=self.atr_period).mean()

        # 动量
        df['MOMENTUM_5'] = df[close_col] / df[close_col].shift(5) - 1

        # KDJ
        low_min = df[low_col].rolling(window=9).min()
        high_max = df[high_col].rolling(window=9).max()
        rsv = (df[close_col] - low_min) / (high_max - low_min) * 100
        df['K'] = rsv.ewm(com=2, adjust=False).mean()
        df['D'] = df['K'].ewm(com=2, adjust=False).mean()
        df['J'] = 3 * df['K'] - 2 * df['D']

        # 成交量
        df['VOLUME_MA5'] = df[volume_col].rolling(window=5).mean()
        df['VOLUME_RATIO'] = df[volume_col] / df['VOLUME_MA5']

        return df

    def analyze_signals(self, df: pd.DataFrame) -> Dict:
        """分析交易信号"""
        if len(df) < 20:
            return {'signal': 0, 'reason': '数据不足'}

        current = df.iloc[-1]
        prev = df.iloc[-2]

        close_col = 'close' if 'close' in df.columns else '收盘'

        signals_buy = []
        signals_sell = []
        buy_strength = 0
        sell_strength = 0

        # 买入信号
        if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
            signals_buy.append("MA5/10金叉")
            buy_strength += 3

        if prev['MACD'] <= prev['MACD_SIGNAL'] and current['MACD'] > current['MACD_SIGNAL']:
            signals_buy.append("MACD金叉")
            buy_strength += 3

        if current[close_col] > current['MA5'] and current['MA5'] > current['MA10']:
            if prev[close_col] <= prev['MA5']:
                signals_buy.append("突破MA5")
                buy_strength += 3

        if current['RSI'] < 30:
            signals_buy.append(f"RSI超卖({current['RSI']:.1f})")
            buy_strength += 4

        if current[close_col] < current['BOLL_LOWER'] * 1.02:
            signals_buy.append("接近布林下轨")
            buy_strength += 2

        if prev['K'] <= prev['D'] and current['K'] > current['D'] and current['K'] < 30:
            signals_buy.append("KDJ低位金叉")
            buy_strength += 3

        # 卖出信号
        if current['RSI'] > 85:
            signals_sell.append(f"RSI极度超买({current['RSI']:.1f})")
            sell_strength += 4

        # 综合判断
        signal = 0
        reason = ''

        if buy_strength >= 1 and sell_strength == 0:
            signal = 1
            reason = ','.join(signals_buy[:3])
        elif sell_strength >= 1 and buy_strength == 0:
            signal = -1
            reason = ','.join(signals_sell[:3])
        elif buy_strength >= 3 and sell_strength < buy_strength:
            signal = 1
            reason = ','.join(signals_buy[:3])

        return {
            'signal': signal,
            'reason': reason,
            'strength': min(buy_strength, 10),
            'buy_signals': signals_buy,
            'sell_signals': signals_sell,
            'buy_strength': buy_strength,
            'sell_strength': sell_strength,
            'current_price': current[close_col],
            'rsi': current['RSI'],
            'macd': current['MACD'],
            'macd_signal': current['MACD_SIGNAL'],
            'ma5': current['MA5'],
            'ma10': current['MA10'],
            'ma20': current['MA20'],
            'boll_upper': current['BOLL_UPPER'],
            'boll_lower': current['BOLL_LOWER'],
            'boll_mid': current['BOLL_MID'],
        }

    def check_stop_loss(self, current_price: float) -> Optional[str]:
        """检查止损止盈"""
        if self.position == 0:
            return None

        if current_price > self.highest_price:
            self.highest_price = current_price
            self.lowest_since_highest = current_price
            self.consecutive_up_mins += 1
            self.consecutive_down_mins = 0
        elif current_price < self.lowest_since_highest:
            self.lowest_since_highest = current_price
            self.consecutive_up_mins = 0
            self.consecutive_down_mins += 1

        profit_pct = (current_price - self.avg_cost) / self.avg_cost

        if profit_pct < -0.15:
            return f"硬止损(亏损{profit_pct*100:.1f}%)"

        if profit_pct < 0.08:
            return None

        stop_loss_pct = 0.15
        take_profit_pct = 0.40

        if profit_pct >= 0.40:
            stop_loss_pct = 0.06
            take_profit_pct = 1.00
        elif profit_pct >= 0.25:
            stop_loss_pct = 0.08
            take_profit_pct = 0.70
        elif profit_pct >= 0.15:
            stop_loss_pct = 0.12
            take_profit_pct = 0.50

        drawdown_from_highest = (self.highest_price - current_price) / self.highest_price

        if profit_pct >= take_profit_pct:
            if self.consecutive_up_mins >= 5:
                return None
            return f"止盈(盈利{profit_pct*100:.1f}%)"

        if drawdown_from_highest >= stop_loss_pct:
            if self.consecutive_down_mins < 3:
                return None
            return f"移动止损(回撤{drawdown_from_highest*100:.1f}%)"

        return None

    def execute_trade(self, symbol: str, price: float, signal: int, reason: str) -> bool:
        """执行交易"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        if signal == 1 and self.position == 0:
            shares = int(self.cash / price)
            if shares > 0:
                cost = shares * price
                self.cash -= cost
                self.position = shares
                self.avg_cost = price
                self.highest_price = price
                self.lowest_since_highest = price

                self.trades.append({
                    'timestamp': timestamp,
                    'action': 'BUY',
                    'price': price,
                    'shares': shares,
                    'reason': reason,
                })

                print(f"\n{'='*60}")
                print(f"[买入信号] {timestamp}")
                print(f"代码: {symbol} | 价格: {price:.2f} | 数量: {shares}股")
                print(f"原因: {reason}")
                print(f"现金: {self.cash:,.2f}元 | 持仓: {self.position}股")
                print(f"{'='*60}\n")
                return True

        elif signal == -1 and self.position > 0:
            amount = self.position * price
            profit = amount - self.position * self.avg_cost
            profit_pct = (profit / (self.position * self.avg_cost)) * 100 if self.position > 0 else 0

            self.cash += amount

            self.trades.append({
                'timestamp': timestamp,
                'action': 'SELL',
                'price': price,
                'shares': self.position,
                'profit': profit,
                'profit_pct': profit_pct,
                'reason': reason,
            })

            print(f"\n{'='*60}")
            print(f"[卖出信号] {timestamp}")
            print(f"代码: {symbol} | 价格: {price:.2f} | 数量: {self.position}股")
            print(f"原因: {reason}")
            print(f"盈亏: {profit:+.2f}元 ({profit_pct:+.2f}%)")
            print(f"现金: {self.cash:,.2f}元")
            print(f"{'='*60}\n")

            self.position = 0
            self.avg_cost = 0
            return True

        return False

    def run_realtime_monitoring(self, symbol: str):
        """运行实时监控"""
        print(f"\n{'='*60}")
        print(f"启动实时交易监控 V2.2 (多数据源增强版)")
        print(f"股票代码: {symbol}")
        print(f"初始资金: {self.initial_capital:,.2f} 元")
        print(f"检查间隔: {self.check_interval} 秒")
        print(f"数据源: 多数据源自动切换")
        print(f"{'='*60}\n")

        try:
            while True:
                df = self.get_realtime_data(symbol)

                if df is None or df.empty:
                    print(f"[ERROR] 数据获取失败，等待60秒...")
                    time.sleep(60)
                    continue

                df = self.calculate_indicators(df)
                analysis = self.analyze_signals(df)
                current_price = analysis['current_price']

                print(f"\n[{datetime.now().strftime('%H:%M:%S')}] 价格: {current_price:.2f} | "
                      f"信号: {'买入' if analysis['signal']==1 else ('卖出' if analysis['signal']==-1 else '观望')} "
                      f"(强度:{analysis['strength']}/10)")

                if self.position > 0:
                    stop_reason = self.check_stop_loss(current_price)
                    if stop_reason:
                        self.execute_trade(symbol, current_price, -1, stop_reason)
                        continue

                if analysis['signal'] != 0:
                    self.execute_trade(symbol, current_price, analysis['signal'], analysis['reason'])

                self.minute_records.append({
                    'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                    'price': current_price,
                    'total_value': self.cash + self.position * current_price
                })

                time.sleep(self.check_interval)

        except KeyboardInterrupt:
            print("\n监控已停止")
            self.print_summary()

    def print_summary(self):
        """打印统计"""
        if not self.minute_records:
            return

        final_value = self.minute_records[-1]['total_value']
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        print(f"\n{'='*60}")
        print("最终统计报告")
        print(f"{'='*60}")
        print(f"初始资金: {self.initial_capital:,.2f} 元")
        print(f"最终资产: {final_value:,.2f} 元")
        print(f"总收益率: {total_return:+.2f}%")
        print(f"交易次数: {len(self.trades)}")
        print(f"数据源切换次数: {self.data_fetcher.source_stats}")
        print(f"{'='*60}\n")


def main():
    """主函数"""
    import sys

    SYMBOL = "002202"
    INITIAL_CAPITAL = 100000.0
    CHECK_INTERVAL = 60
    TRAILING_STOP = 0.06
    PROFIT_TAKE = 0.50

    engine = TradingEngineV22(
        initial_capital=INITIAL_CAPITAL,
        trailing_stop_pct=TRAILING_STOP,
        profit_take_pct=PROFIT_TAKE,
        check_interval=CHECK_INTERVAL
    )

    engine.run_realtime_monitoring(SYMBOL)


if __name__ == "__main__":
    main()
