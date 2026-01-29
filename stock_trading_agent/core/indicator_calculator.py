# -*- coding: utf-8 -*-
"""
技术指标计算器
统一计算各类技术指标，消除重复代码
"""

import pandas as pd
import numpy as np
from typing import Dict, List, Optional


class IndicatorCalculator:
    """
    技术指标计算器
    提供统一接口计算各类技术指标
    """

    def __init__(self):
        self._close_col = None

    def _detect_close_column(self, df: pd.DataFrame) -> str:
        """自动检测收盘价列名"""
        columns = df.columns.tolist()
        if 'close' in columns:
            return 'close'
        elif '收盘' in columns:
            return '收盘'
        elif 'Close' in columns:
            return 'Close'
        else:
            raise ValueError(f"无法找到收盘价列，当前列: {columns}")

    def _detect_volume_column(self, df: pd.DataFrame) -> Optional[str]:
        """自动检测成交量列名"""
        columns = df.columns.tolist()
        if 'volume' in columns:
            return 'volume'
        elif '成交量' in columns:
            return '成交量'
        elif 'Volume' in columns:
            return 'Volume'
        else:
            return None

    def calculate_ma(self, df: pd.DataFrame, periods: List[int] = None) -> pd.DataFrame:
        """
        计算移动平均线

        Args:
            df: 原始数据
            periods: 周期列表，默认[5, 10, 20, 60]

        Returns:
            添加了MA列的DataFrame
        """
        if periods is None:
            periods = [5, 10, 20, 60]

        df = df.copy()
        close_col = self._detect_close_column(df)

        for period in periods:
            df[f'MA{period}'] = df[close_col].rolling(window=period).mean()

        return df

    def calculate_rsi(self, df: pd.DataFrame, period: int = 14) -> pd.DataFrame:
        """
        计算RSI指标

        Args:
            df: 原始数据
            period: 周期，默认14

        Returns:
            添加了RSI列的DataFrame
        """
        df = df.copy()
        close_col = self._detect_close_column(df)

        delta = df[close_col].diff()
        gain = (delta.where(delta > 0, 0)).rolling(window=period).mean()
        loss = (-delta.where(delta < 0, 0)).rolling(window=period).mean()
        rs = gain / loss
        df['RSI'] = 100 - (100 / (1 + rs))

        return df

    def calculate_macd(self, df: pd.DataFrame, fast: int = 12, slow: int = 26, signal: int = 9) -> pd.DataFrame:
        """
        计算MACD指标

        Args:
            df: 原始数据
            fast: 快线周期，默认12
            slow: 慢线周期，默认26
            signal: 信号线周期，默认9

        Returns:
            添加了MACD相关列的DataFrame
        """
        df = df.copy()
        close_col = self._detect_close_column(df)

        exp_fast = df[close_col].ewm(span=fast, adjust=False).mean()
        exp_slow = df[close_col].ewm(span=slow, adjust=False).mean()
        df['MACD'] = exp_fast - exp_slow
        df['MACD_SIGNAL'] = df['MACD'].ewm(span=signal, adjust=False).mean()
        df['MACD_HIST'] = df['MACD'] - df['MACD_SIGNAL']

        # DIF和DEA别名（与原有代码兼容）
        df['DIF'] = df['MACD']
        df['DEA'] = df['MACD_SIGNAL']

        return df

    def calculate_bollinger_bands(self, df: pd.DataFrame, period: int = 20, std_dev: float = 2) -> pd.DataFrame:
        """
        计算布林带

        Args:
            df: 原始数据
            period: 周期，默认20
            std_dev: 标准差倍数，默认2

        Returns:
            添加了BOLL相关列的DataFrame
        """
        df = df.copy()
        close_col = self._detect_close_column(df)

        df['BOLL_MID'] = df[close_col].rolling(window=period).mean()
        df['BOLL_STD'] = df[close_col].rolling(window=period).std()
        df['BOLL_UPPER'] = df['BOLL_MID'] + std_dev * df['BOLL_STD']
        df['BOLL_LOWER'] = df['BOLL_MID'] - std_dev * df['BOLL_STD']

        return df

    def calculate_atr(self, df: pd.DataFrame, period: int = 14) -> pd.DataFrame:
        """
        计算ATR (Average True Range)

        Args:
            df: 原始数据
            period: 周期，默认14

        Returns:
            添加了ATR列的DataFrame
        """
        df = df.copy()
        close_col = self._detect_close_column(df)

        # 获取高低价列名
        columns = df.columns.tolist()
        if 'high' in columns and 'low' in columns:
            high_col, low_col = 'high', 'low'
        elif '最高' in columns and '最低' in columns:
            high_col, low_col = '最高', '最低'
        elif 'High' in columns and 'Low' in columns:
            high_col, low_col = 'High', 'Low'
        else:
            high_col = low_col = close_col

        df['HL'] = df[high_col] - df[low_col]
        df['HC'] = abs(df[high_col] - df[close_col].shift(1))
        df['LC'] = abs(df[low_col] - df[close_col].shift(1))
        df['TR'] = df[['HL', 'HC', 'LC']].max(axis=1)
        df['ATR'] = df['TR'].rolling(window=period).mean()

        # 清理临时列
        df.drop(['HL', 'HC', 'LC', 'TR'], axis=1, inplace=True)

        return df

    def calculate_volume_ma(self, df: pd.DataFrame, periods: List[int] = None) -> pd.DataFrame:
        """
        计算成交量均线

        Args:
            df: 原始数据
            periods: 周期列表，默认[5]

        Returns:
            添加了VOL_MA列的DataFrame
        """
        if periods is None:
            periods = [5]

        df = df.copy()
        vol_col = self._detect_volume_column(df)

        if vol_col:
            for period in periods:
                df[f'VOL_MA{period}'] = df[vol_col].rolling(window=period).mean()

        return df

    def calculate_all(self, df: pd.DataFrame, indicator_list: List[str] = None) -> pd.DataFrame:
        """
        批量计算指标

        Args:
            df: 原始数据
            indicator_list: 指标列表，默认计算全部

        Returns:
            添加了所有指标的DataFrame
        """
        if indicator_list is None:
            indicator_list = ['ma', 'rsi', 'macd', 'boll', 'atr', 'volume_ma']

        result = df.copy()

        for indicator in indicator_list:
            if indicator.lower() == 'ma':
                result = self.calculate_ma(result)
            elif indicator.lower() == 'rsi':
                result = self.calculate_rsi(result)
            elif indicator.lower() == 'macd':
                result = self.calculate_macd(result)
            elif indicator.lower() == 'boll' or indicator.lower() == 'bollinger':
                result = self.calculate_bollinger_bands(result)
            elif indicator.lower() == 'atr':
                result = self.calculate_atr(result)
            elif indicator.lower() == 'volume_ma':
                result = self.calculate_volume_ma(result)

        return result
