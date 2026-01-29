# -*- coding: utf-8 -*-
"""
多源数据获取器
支持AkShare和baostock自动切换，单例模式
"""

import time
import random
import pandas as pd
from typing import Optional, Dict, List
from datetime import datetime
import akshare as ak


class MultiSourceFetcher:
    """
    轻量级多数据源获取器 - 单例模式
    支持AkShare和baostock自动故障转移
    """

    _instance = None
    _initialized = False

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance

    def __init__(self):
        if not self._initialized:
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

            self._initialized = True

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
        """
        自动切换数据源获取数据

        Args:
            symbol: 股票代码
            period: 数据周期，默认daily

        Returns:
            DataFrame or None
        """
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

    def fetch_multiple(self, symbols: List[str], period: str = "daily") -> Dict[str, pd.DataFrame]:
        """
        批量获取多个股票数据

        Args:
            symbols: 股票代码列表
            period: 数据周期

        Returns:
            {symbol: DataFrame} 字典
        """
        result = {}
        for symbol in symbols:
            df = self.fetch_data(symbol, period)
            if df is not None:
                result[symbol] = df
        return result


# 全局单例实例
_fetcher_instance = None

def get_fetcher() -> MultiSourceFetcher:
    """获取全局单例数据获取器"""
    global _fetcher_instance
    if _fetcher_instance is None:
        _fetcher_instance = MultiSourceFetcher()
    return _fetcher_instance
