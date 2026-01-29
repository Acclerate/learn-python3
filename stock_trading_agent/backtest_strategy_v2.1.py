# -*- coding: utf-8 -*-
"""
股票交易策略 V2.1 - 精简优化版
多数据源自动切换 + 完整技术指标 + 智能止损止盈
"""

import os
import time
import random
import pandas as pd
import numpy as np
from datetime import datetime, timedelta
from typing import Dict, List, Tuple, Optional
import akshare as ak

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''


# ================= 多数据源获取器 =================
class MultiSourceFetcher:
    """轻量级多数据源获取器 - 只使用可靠的数据源"""

    def __init__(self):
        self.sources = []
        self.fail_counts = {}
        self._init_sources()

    def _init_sources(self):
        """初始化数据源 - 只保留已验证可靠的源"""
        try:
            import akshare
            self.sources.append({'name': 'AkShare', 'fetch': self._fetch_akshare})
            print("[INIT] AkShare 数据源已加载")
        except ImportError:
            print("[WARN] AkShare 未安装")

        try:
            import baostock
            self.sources.append({'name': 'baostock', 'fetch': self._fetch_baostock})
            print("[INIT] baostock 数据源已加载")
        except ImportError:
            print("[WARN] baostock 未安装: pip install baostock")

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
                print(f"[*] 使用 {name} 获取数据...")
                df = source['fetch'](symbol, period)
                if df is not None and not df.empty:
                    self.fail_counts[name] = 0
                    print(f"[OK] {name} 获取成功 ({len(df)} 条)")
                    return df
            except Exception as e:
                if 'Connection' in str(e) or 'Remote' in str(e) or 'aborted' in str(e):
                    self.fail_counts[name] = self.fail_counts.get(name, 0) + 1
                    print(f"[FAIL] {name} 连接失败")

        return None

    def _fetch_akshare(self, symbol: str, period: str) -> Optional[pd.DataFrame]:
        """AkShare数据源"""
        if period == "minute":
            df = ak.stock_zh_a_hist_min_em(symbol=symbol, period="1", adjust="qfq")
            return df.tail(200) if df is not None else None
        else:
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
            start_date='2025-10-01', end_date=end_date, frequency="d", adjustflag="3"
        )

        data_list = []
        while (rs.error_code == '0') and rs.next():
            data_list.append(rs.get_row_data())
        bs.logout()

        if data_list:
            df = pd.DataFrame(data_list, columns=rs.fields)
            df.columns = ['日期', '股票代码', '开盘', '最高', '最低', '收盘', '成交量', '成交额']
            for col in ['开盘', '最高', '最低', '收盘', '成交量', '成交额']:
                df[col] = pd.to_numeric(df[col], errors='coerce')
            return df
        return None


# ================= 交易引擎 =================
class TradingEngineV21:
    """V2.1交易引擎 - 精简版"""

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50,
                 check_interval: int = 60):
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.check_interval = check_interval
        self.multi_fetcher = MultiSourceFetcher()

        # 账户状态
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.lowest_since_highest = 0.0

        # 数据记录
        self.trades = []
        self.daily_value = []

        # 策略参数
        self.ma_periods = [5, 10, 20, 60]
        self.rsi_period = 14
        self.macd_fast, self.macd_slow, self.macd_signal = 12, 26, 9
        self.boll_period = 20
        self.atr_period = 14
        self.dmi_period = 14

    def get_realtime_data(self, symbol: str) -> Optional[pd.DataFrame]:
        """获取实时数据"""
        print(f"\n[*] 获取 {symbol} 实时行情...")
        df = self.multi_fetcher.fetch_data(symbol, "minute")
        if df is None or df.empty:
            print("[INFO] 分钟数据不可用，使用日线数据...")
            time.sleep(2)
            df = self.multi_fetcher.fetch_data(symbol, "daily")
        return df.tail(100) if df is not None else None

    def get_historical_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """获取历史数据"""
        print(f"[*] 获取历史数据: {symbol} ({start_date} ~ {end_date})...")
        df = self.multi_fetcher.fetch_data(symbol, "daily")
        if df is not None and not df.empty:
            date_col = '日期' if '日期' in df.columns else 'date'
            df[date_col] = pd.to_datetime(df[date_col], errors='coerce')
            start_dt = pd.to_datetime(start_date, format='%Y%m%d')
            end_dt = pd.to_datetime(end_date, format='%Y%m%d')
            df = df[(df[date_col] >= start_dt) & (df[date_col] <= end_dt)]
            df = df.sort_values(date_col).reset_index(drop=True)
            print(f"    [OK] 获取 {len(df)} 条记录")
            return df
        raise ValueError(f"无法获取 {symbol} 的数据")

    def get_date_range(self, months: int = 3) -> Tuple[str, str]:
        """获取日期范围"""
        end = datetime.now()
        start = end - timedelta(days=30 * months)
        if end.weekday() == 5:
            end = end - timedelta(days=1)
        elif end.weekday() == 6:
            end = end - timedelta(days=2)
        return start.strftime('%Y%m%d'), end.strftime('%Y%m%d')

    def calculate_indicators(self, df: pd.DataFrame) -> pd.DataFrame:
        """计算技术指标"""
        df = df.copy()

        # 获取列名
        close_col = '收盘' if '收盘' in df.columns else 'close'
        high_col = '最高' if '最高' in df.columns else 'high'
        low_col = '最低' if '最低' in df.columns else 'low'
        volume_col = '成交量' if '成交量' in df.columns else 'volume'

        # 移动平均线
        for p in self.ma_periods:
            df[f'MA{p}'] = df[close_col].rolling(p).mean()

        # RSI
        delta = df[close_col].diff()
        gain = delta.where(delta > 0, 0).rolling(self.rsi_period).mean()
        loss = -delta.where(delta < 0, 0).rolling(self.rsi_period).mean()
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
        df['BOLL_MID'] = df[close_col].rolling(self.boll_period).mean()
        df['BOLL_STD'] = df[close_col].rolling(self.boll_period).std()
        df['BOLL_UPPER'] = df['BOLL_MID'] + 2 * df['BOLL_STD']
        df['BOLL_LOWER'] = df['BOLL_MID'] - 2 * df['BOLL_STD']

        # ATR
        df['HL'] = df[high_col] - df[low_col]
        df['HC'] = abs(df[high_col] - df[close_col].shift(1))
        df['LC'] = abs(df[low_col] - df[close_col].shift(1))
        df['TR'] = df[['HL', 'HC', 'LC']].max(axis=1)
        df['ATR'] = df['TR'].rolling(self.atr_period).mean()

        # DMI
        df['PDM'] = np.where((df[high_col] - df[high_col].shift(1)) >
                             (df[low_col].shift(1) - df[low_col]),
                             np.maximum(df[high_col] - df[high_col].shift(1), 0), 0)
        df['MDM'] = np.where((df[low_col].shift(1) - df[low_col]) >
                             (df[high_col] - df[high_col].shift(1)),
                             np.maximum(df[low_col].shift(1) - df[low_col], 0), 0)
        df['TR_SMOOTH'] = df['TR'].ewm(span=self.dmi_period, adjust=False).mean()
        df['PDM_SMOOTH'] = df['PDM'].ewm(span=self.dmi_period, adjust=False).mean()
        df['MDM_SMOOTH'] = df['MDM'].ewm(span=self.dmi_period, adjust=False).mean()
        tr_safe = df['TR_SMOOTH'].replace(0, np.nan)
        df['PDI'] = 100 * df['PDM_SMOOTH'] / tr_safe
        df['MDI'] = 100 * df['MDM_SMOOTH'] / tr_safe
        df['PDI'] = df['PDI'].fillna(0)
        df['MDI'] = df['MDI'].fillna(0)
        df['DX'] = np.where(df['PDI'] + df['MDI'] > 0,
                           100 * abs(df['PDI'] - df['MDI']) / (df['PDI'] + df['MDI']), 0)
        df['ADX'] = df['DX'].ewm(span=self.dmi_period, adjust=False).mean()

        # KDJ
        low_min = df[low_col].rolling(9).min()
        high_max = df[high_col].rolling(9).max()
        rsv = (df[close_col] - low_min) / (high_max - low_min) * 100
        df['K'] = rsv.ewm(com=2, adjust=False).mean()
        df['D'] = df['K'].ewm(com=2, adjust=False).mean()
        df['J'] = 3 * df['K'] - 2 * df['D']

        # 成交量
        df['VOLUME_MA5'] = df[volume_col].rolling(5).mean()
        df['VOLUME_RATIO'] = df[volume_col] / df['VOLUME_MA5']

        return df

    def analyze_signals(self, df: pd.DataFrame) -> Dict:
        """分析交易信号"""
        if len(df) < 2:
            return {}

        latest = df.iloc[-1]
        prev = df.iloc[-2]

        analysis = {
            'date': latest.get('日期', latest.index),
            'price': latest['收盘'],
            'ma5': latest['MA5'], 'ma10': latest['MA10'], 'ma20': latest['MA20'],
            'rsi': latest['RSI'],
            'macd': latest['MACD'], 'macd_signal': latest['MACD_SIGNAL'],
            'macd_hist': latest['MACD_HIST'],
            'boll_upper': latest['BOLL_UPPER'], 'boll_lower': latest['BOLL_LOWER'],
            'atr': latest['ATR'],
            'pdi': latest['PDI'], 'mdi': latest['MDI'], 'adx': latest['ADX'],
            'k': latest['K'], 'd': latest['D'], 'j': latest['J'],
            'volume_ratio': latest['VOLUME_RATIO'],
        }

        # 买入信号
        buy_signals = []
        if latest['MA5'] > latest['MA10'] and prev['MA5'] <= prev['MA10']:
            buy_signals.append("MA金叉")
        if latest['MACD'] > latest['MACD_SIGNAL'] and prev['MACD'] <= prev['MACD_SIGNAL']:
            buy_signals.append("MACD金叉")
        if latest['RSI'] < 35:
            buy_signals.append(f"RSI超买({latest['RSI']:.1f})")
        if latest['收盘'] < latest['BOLL_LOWER']:
            buy_signals.append("跌破布林下轨")
        if latest['PDI'] > latest['MDI'] and latest['ADX'] > 25:
            buy_signals.append("DMI金叉")

        # 卖出信号
        sell_signals = []
        if latest['MA5'] < latest['MA10']:
            sell_signals.append("MA死叉")
        if latest['RSI'] > 75:
            sell_signals.append(f"RSI超买({latest['RSI']:.1f})")
        if latest['收盘'] > latest['BOLL_UPPER']:
            sell_signals.append("突破布林上轨")

        analysis['buy_signals'] = buy_signals
        analysis['sell_signals'] = sell_signals

        return analysis

    def check_stop_loss(self, current_price: float) -> Optional[str]:
        """检查止损止盈"""
        if self.position == 0:
            return None

        # 更新最高价
        if current_price > self.highest_price:
            self.highest_price = current_price
            self.lowest_since_highest = current_price

        # 记录从最高点的回撤
        if current_price < self.lowest_since_highest:
            self.lowest_since_highest = current_price

        # 计算收益率
        profit_pct = (current_price - self.avg_cost) / self.avg_cost

        # 计算回撤
        drawdown_pct = (self.highest_price - current_price) / self.highest_price

        # 止盈检查
        if profit_pct >= self.profit_take_pct:
            return f"止盈({profit_pct*100:.1f}%)"

        # 移动止盈
        if profit_pct > 0.15 and drawdown_pct > self.trailing_stop_pct:
            return f"移动止盈(回撤{drawdown_pct*100:.1f}%)"

        # 固定止损
        if profit_pct < -0.08:
            return f"止损({profit_pct*100:.1f}%)"

        return None

    def execute_trade(self, symbol: str, price: float, signal: int, reason: str) -> bool:
        """执行交易"""
        if signal == 1:  # 买入
            if self.cash > price * 100:  # 至少买100股
                shares = int(self.cash / price)
                cost = shares * price
                self.cash -= cost
                self.position = shares
                self.avg_cost = price
                self.highest_price = price
                self.lowest_since_highest = price
                self.trades.append({
                    'date': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                    'action': 'BUY', 'price': price, 'shares': shares,
                    'amount': cost, 'reason': reason
                })
                print(f"    [买入] {shares}股 @ {price:.2f}元 - {reason}")
                return True

        elif signal == -1:  # 卖出
            if self.position > 0:
                amount = self.position * price
                profit = amount - self.position * self.avg_cost
                profit_pct = profit / (self.position * self.avg_cost) * 100
                self.cash += amount
                self.trades.append({
                    'date': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                    'action': 'SELL', 'price': price, 'shares': self.position,
                    'amount': amount, 'profit': profit, 'profit_pct': profit_pct,
                    'reason': reason
                })
                print(f"    [卖出] {self.position}股 @ {price:.2f}元 - {reason} | 盈亏: {profit_pct:+.2f}%")
                self.position = 0
                self.avg_cost = 0
                self.highest_price = 0
                self.lowest_since_highest = 0
                return True

        return False

    def run_backtest(self, symbol: str, start_date: str, end_date: str) -> Dict:
        """运行回测"""
        df = self.get_historical_data(symbol, start_date, end_date)
        df = self.calculate_indicators(df)

        print(f"[*] 生成交易信号...")
        print(f"[*] 执行回测...")

        cash = self.cash
        position = 0
        avg_cost = 0
        trades = []
        daily_value = []
        highest_price = 0
        lowest_since_highest = 0

        for idx, row in df.iterrows():
            date = row['日期']
            price = row['收盘']
            close_col = '收盘'

            # 记录每日净值
            if position > 0:
                total_value = cash + position * price
            else:
                total_value = cash
            daily_value.append({'date': date, 'value': total_value})

            # 检查卖出（止损止盈优先）
            if position > 0:
                if price > highest_price:
                    highest_price = price
                    lowest_since_highest = price
                if price < lowest_since_highest:
                    lowest_since_highest = price

                profit_pct = (price - avg_cost) / avg_cost
                drawdown_pct = (highest_price - price) / highest_price

                sell = False
                reason = ""

                # 止盈
                if profit_pct >= self.profit_take_pct:
                    sell = True
                    reason = f"止盈({profit_pct*100:.1f}%)"
                # 移动止盈
                elif profit_pct > 0.15 and drawdown_pct > self.trailing_stop_pct:
                    sell = True
                    reason = f"移动止盈(回撤{drawdown_pct*100:.1f}%)"
                # 止损
                elif profit_pct < -0.08:
                    sell = True
                    reason = f"止损({profit_pct*100:.1f}%)"

                if sell:
                    amount = position * price
                    profit = amount - position * avg_cost
                    profit_pct = profit / (position * avg_cost) * 100
                    trades.append({
                        'date': date, 'action': 'SELL', 'price': price,
                        'shares': position, 'amount': amount, 'profit': profit,
                        'profit_pct': profit_pct, 'reason': reason
                    })
                    cash = amount
                    position = 0
                    avg_cost = 0
                    highest_price = 0
                    lowest_since_highest = 0
                    continue

            # 分析买入信号
            if idx < 20:  # 前20天不交易
                continue

            prev_row = df.iloc[idx - 1]

            buy_conditions = []
            if row['MA5'] > row['MA10'] and prev_row['MA5'] <= prev_row['MA10']:
                buy_conditions.append("MA金叉")
            if row['MACD'] > row['MACD_SIGNAL'] and prev_row['MACD'] <= prev_row['MACD_SIGNAL']:
                buy_conditions.append("MACD金叉")
            if row['PDI'] > row['MDI'] and row['ADX'] > 25:
                buy_conditions.append("DMI金叉")

            # 突破检查
            high_20 = df.iloc[idx-20:idx][close_col].max()
            if price > high_20:
                momentum = (price - df.iloc[idx-5][close_col]) / df.iloc[idx-5][close_col]
                if momentum > 0.05:
                    buy_conditions.append(f"突破20日新高(涨幅{momentum*100:.1f}%)")

            # 买入
            if position == 0 and buy_conditions and cash > price * 100:
                reason = ", ".join(buy_conditions[:3])
                shares = int(cash / price)
                cost = shares * price
                trades.append({
                    'date': date, 'action': 'BUY', 'price': price,
                    'shares': shares, 'amount': cost, 'reason': reason
                })
                cash -= cost
                position = shares
                avg_cost = price
                highest_price = price
                lowest_since_highest = price

        # 最后强制平仓
        if position > 0:
            price = df.iloc[-1]['收盘']
            amount = position * price
            profit = amount - position * avg_cost
            profit_pct = profit / (position * avg_cost) * 100
            trades.append({
                'date': df.iloc[-1]['日期'], 'action': 'SELL', 'price': price,
                'shares': position, 'amount': amount, 'profit': profit,
                'profit_pct': profit_pct, 'reason': '回测结束强制平仓'
            })
            cash = amount

        # 计算统计数据
        final_value = cash
        total_return = (final_value - self.initial_capital) / self.initial_capital * 100

        buy_trades = [t for t in trades if t['action'] == 'BUY']
        sell_trades = [t for t in trades if t['action'] == 'SELL']

        profitable_trades = [t for t in sell_trades if t.get('profit', 0) > 0]
        win_rate = len(profitable_trades) / len(sell_trades) * 100 if sell_trades else 0

        # 计算最大回撤
        values = [d['value'] for d in daily_value]
        peak = values[0]
        max_drawdown = 0
        for v in values:
            if v > peak:
                peak = v
            drawdown = (peak - v) / peak
            if drawdown > max_drawdown:
                max_drawdown = drawdown

        # 计算夏普比率
        returns = []
        for i in range(1, len(daily_value)):
            ret = (daily_value[i]['value'] - daily_value[i-1]['value']) / daily_value[i-1]['value']
            returns.append(ret)
        if returns:
            sharpe = np.mean(returns) / np.std(returns) * np.sqrt(252) if np.std(returns) > 0 else 0
        else:
            sharpe = 0

        return {
            'start_date': start_date,
            'end_date': end_date,
            'initial_value': self.initial_capital,
            'final_value': final_value,
            'total_return': total_return,
            'trades': trades,
            'buy_trades': len(buy_trades),
            'sell_trades': len(sell_trades),
            'total_trades': len(trades),
            'win_rate': win_rate,
            'max_drawdown': max_drawdown * 100,
            'sharpe_ratio': sharpe,
            'daily_value': daily_value
        }

    def print_backtest_report(self, result: Dict):
        """打印回测报告"""
        print(f"\n{'='*60}")
        print(f"回测报告 V2.1 - {result.get('symbol', '')}")
        print(f"{'='*60}")
        print(f"期间:      {result['start_date']} ~ {result['end_date']}")
        print(f"初始资金: {result['initial_value']:,.2f} CNY")
        print(f"最终资产: {result['final_value']:,.2f} CNY")
        print(f"总收益率: {result['total_return']:+.2f}%")
        print(f"{'-'*60}")
        print(f"总交易:   {result['total_trades']}")
        print(f"买入:     {result['buy_trades']}")
        print(f"卖出:     {result['sell_trades']}")
        print(f"胜率:     {result['win_rate']:.2f}%")
        print(f"最大回撤: {result['max_drawdown']:.2f}%")
        print(f"夏普比率: {result['sharpe_ratio']:.4f}")
        print(f"{'='*60}\n")

        print("交易明细:")
        print(f"{'日期':<12} {'操作':<6} {'价格':>8} {'数量':>6} {'金额':>12} {'盈亏':>12}  原因")
        print("-" * 90)
        for t in result['trades']:
            profit_str = ""
            if 'profit' in t:
                profit_str = f"{t['profit']:+,.2f} ({t['profit_pct']:+.2f}%)"
            print(f"{t['date']:<12} {t['action']:<6} {t['price']:>8.2f} {t['shares']:>6} "
                  f"{t['amount']:>12,.2f} {profit_str:>12}  {t['reason'][:30]}")

    def run_realtime_monitoring(self, symbol: str):
        """实时监控"""
        print(f"\n开始实时监控 {symbol} (按Ctrl+C停止)...\n")

        try:
            while True:
                df = self.get_realtime_data(symbol)
                if df is None or df.empty:
                    print("[ERROR] 无法获取数据，等待重试...")
                    time.sleep(self.check_interval)
                    continue

                df = self.calculate_indicators(df)
                analysis = self.analyze_signals(df)

                current_price = analysis['price']

                # 打印市场状态
                print(f"\n{'='*60}")
                print(f"时间: {analysis['date']} | 价格: {current_price:.2f}")
                print(f"{'='*60}")

                print(f"\n[技术指标]")
                print(f"  MA5/10/20: {analysis['ma5']:.2f} / {analysis['ma10']:.2f} / {analysis['ma20']:.2f}")
                print(f"  RSI: {analysis['rsi']:.1f} | MACD: {analysis['macd']:.2f} ({analysis['macd_hist']:+.2f})")
                print(f"  布林带: {analysis['boll_lower']:.2f} ~ {analysis['boll_upper']:.2f}")
                print(f"  DMI: PDI={analysis['pdi']:.1f} MDI={analysis['mdi']:.1f} ADX={analysis['adx']:.1f}")

                # 检查止损止盈
                stop_reason = self.check_stop_loss(current_price)
                if stop_reason:
                    print(f"\n[触发] {stop_reason}")
                    self.execute_trade(symbol, current_price, -1, stop_reason)
                    continue

                # 买入信号
                if self.position == 0 and analysis['buy_signals']:
                    print(f"\n[买入信号] {', '.join(analysis['buy_signals'][:3])}")
                    self.execute_trade(symbol, current_price, 1, ", ".join(analysis['buy_signals'][:2]))

                # 卖出信号
                elif self.position > 0 and analysis['sell_signals']:
                    print(f"\n[卖出信号] {', '.join(analysis['sell_signals'][:3])}")
                    self.execute_trade(symbol, current_price, -1, ", ".join(analysis['sell_signals'][:2]))

                # 持仓状态
                if self.position > 0:
                    profit_pct = (current_price - self.avg_cost) / self.avg_cost * 100
                    print(f"\n[持仓] {self.position}股 | 成本: {self.avg_cost:.2f} | 盈亏: {profit_pct:+.2f}%")
                else:
                    print(f"\n[现金] {self.cash:,.2f} 元")

                print(f"\n等待 {self.check_interval} 秒...")
                time.sleep(self.check_interval)

        except KeyboardInterrupt:
            print(f"\n\n监控已停止")
            self.print_final_summary(symbol)

    def print_final_summary(self, symbol: str):
        """打印最终总结"""
        print(f"\n{'='*60}")
        print(f"交易总结 - {symbol}")
        print(f"{'='*60}")

        if self.trades:
            print(f"\n交易记录 ({len(self.trades)}笔):")
            for t in self.trades:
                profit_str = ""
                if 'profit' in t:
                    profit_str = f" | 盈亏: {t['profit']:+.2f} ({t['profit_pct']:+.2f}%)"
                print(f"  {t['date']} {t['action']:4} {t['price']:.2f}元 {t['shares']}股{profit_str}")

        total_value = self.cash
        if self.position > 0:
            total_value += self.position * self.highest_price

        profit = total_value - self.initial_capital
        profit_pct = profit / self.initial_capital * 100

        print(f"\n初始资金: {self.initial_capital:,.2f} 元")
        print(f"当前资产: {total_value:,.2f} 元")
        print(f"总盈亏: {profit:+,.2f} 元 ({profit_pct:+.2f}%)")
        print(f"{'='*60}\n")


# ================= 主程序 =================
def main():
    import sys

    SYMBOL = "002202"
    INITIAL_CAPITAL = 100000.0
    CHECK_INTERVAL = 60
    TRAILING_STOP = 0.06
    PROFIT_TAKE = 0.50
    MONTHS = 3

    MODE = "realtime"
    if len(sys.argv) > 1:
        MODE = sys.argv[1].lower()

    engine = TradingEngineV21(
        initial_capital=INITIAL_CAPITAL,
        trailing_stop_pct=TRAILING_STOP,
        profit_take_pct=PROFIT_TAKE,
        check_interval=CHECK_INTERVAL
    )

    if MODE in ("backtest", "bt"):
        start_date, end_date = engine.get_date_range(MONTHS)
        print(f"\n日期范围: {start_date} ~ {end_date} (最近 {MONTHS} 个月)\n")

        result = engine.run_backtest(SYMBOL, start_date, end_date)
        engine.print_backtest_report(result)

        if result['daily_value']:
            df_daily = pd.DataFrame(result['daily_value'])
            output_file = f"backtest_v21_{SYMBOL}_{start_date}_{end_date}.csv"
            df_daily.to_csv(output_file, index=False, encoding='utf-8-sig')
            print(f"每日净值已保存到: {output_file}")

    elif MODE in ("realtime", "rt"):
        print(f"\n{'='*60}")
        print(f"实时监控模式")
        print(f"股票: {SYMBOL} | 检查间隔: {CHECK_INTERVAL}秒")
        print(f"初始资金: {INITIAL_CAPITAL:,.2f} 元")
        print(f"止损: {TRAILING_STOP*100}% | 止盈: {PROFIT_TAKE*100}%")
        print(f"{'='*60}\n")
        engine.run_realtime_monitoring(SYMBOL)

    else:
        print(f"未知模式: {MODE}")
        print("使用方法:")
        print("  python backtest_strategy_v2.1.py realtime  # 实时监控")
        print("  python backtest_strategy_v2.1.py rt         # 实时监控（简写）")
        print("  python backtest_strategy_v2.1.py backtest  # 回测")
        print("  python backtest_strategy_v2.1.py bt         # 回测（简写）")


if __name__ == "__main__":
    main()
