# -*- coding: utf-8 -*-
"""
通用技术指标计算模块
所有策略共享的技术指标计算
"""

import pandas as pd
import numpy as np
from typing import Dict, Optional


class IndicatorCalculator:
    """技术指标计算器"""

    @staticmethod
    def add_ma(df: pd.DataFrame, close_col: str = '收盘', periods: list = None) -> pd.DataFrame:
        """
        添加移动平均线

        Args:
            df: DataFrame
            close_col: 收盘价列名
            periods: 周期列表

        Returns:
            添加了MA列的DataFrame
        """
        df = df.copy()
        if periods is None:
            periods = [5, 10, 20, 60]

        for period in periods:
            df[f'MA{period}'] = df[close_col].rolling(window=period).mean()

        return df

    @staticmethod
    def add_rsi(df: pd.DataFrame, close_col: str = '收盘', period: int = 14) -> pd.DataFrame:
        """添加RSI指标"""
        df = df.copy()
        delta = df[close_col].diff()
        gain = (delta.where(delta > 0, 0)).rolling(window=period).mean()
        loss = (-delta.where(delta < 0, 0)).rolling(window=period).mean()
        rs = gain / loss.replace(0, np.nan)
        df['RSI'] = 100 - (100 / (1 + rs))
        df['RSI'] = df['RSI'].fillna(50)
        return df

    @staticmethod
    def add_macd(df: pd.DataFrame, close_col: str = '收盘',
                 fast: int = 12, slow: int = 26, signal: int = 9) -> pd.DataFrame:
        """添加MACD指标"""
        df = df.copy()
        exp_fast = df[close_col].ewm(span=fast, adjust=False).mean()
        exp_slow = df[close_col].ewm(span=slow, adjust=False).mean()
        df['MACD'] = exp_fast - exp_slow
        df['MACD_SIGNAL'] = df['MACD'].ewm(span=signal, adjust=False).mean()
        df['MACD_HIST'] = df['MACD'] - df['MACD_SIGNAL']
        return df

    @staticmethod
    def add_boll(df: pd.DataFrame, close_col: str = '收盘', period: int = 20, std_mult: float = 2) -> pd.DataFrame:
        """添加布林带"""
        df = df.copy()
        df['BOLL_MID'] = df[close_col].rolling(window=period).mean()
        df['BOLL_STD'] = df[close_col].rolling(window=period).std()
        df['BOLL_UPPER'] = df['BOLL_MID'] + std_mult * df['BOLL_STD']
        df['BOLL_LOWER'] = df['BOLL_MID'] - std_mult * df['BOLL_STD']
        return df

    @staticmethod
    def add_atr(df: pd.DataFrame, high_col: str = '最高', low_col: str = '最低',
                close_col: str = '收盘', period: int = 14) -> pd.DataFrame:
        """添加ATR（波动率）"""
        df = df.copy()
        df['HL'] = df[high_col] - df[low_col]
        df['HC'] = abs(df[high_col] - df[close_col].shift(1))
        df['LC'] = abs(df[low_col] - df[close_col].shift(1))
        df['TR'] = df[['HL', 'HC', 'LC']].max(axis=1)
        df['ATR'] = df['TR'].rolling(window=period).mean()
        return df

    @staticmethod
    def add_kdj(df: pd.DataFrame, high_col: str = '最高', low_col: str = '最低',
                close_col: str = '收盘', period: int = 9) -> pd.DataFrame:
        """添加KDJ指标"""
        df = df.copy()
        low_min = df[low_col].rolling(window=period).min()
        high_max = df[high_col].rolling(window=period).max()
        rsv = (df[close_col] - low_min) / (high_max - low_min) * 100
        df['K'] = rsv.ewm(com=2, adjust=False).mean()
        df['D'] = df['K'].ewm(com=2, adjust=False).mean()
        df['J'] = 3 * df['K'] - 2 * df['D']
        return df

    @staticmethod
    def add_momentum(df: pd.DataFrame, close_col: str = '收盘', periods: list = None) -> pd.DataFrame:
        """添加动量指标"""
        df = df.copy()
        if periods is None:
            periods = [5, 10]

        for period in periods:
            df[f'MOMENTUM_{period}'] = df[close_col] / df[close_col].shift(period) - 1

        return df

    @staticmethod
    def add_volume(df: pd.DataFrame, volume_col: str = '成交量', period: int = 5) -> pd.DataFrame:
        """添加成交量指标"""
        df = df.copy()
        df['VOLUME_MA'] = df[volume_col].rolling(window=period).mean()
        df['VOLUME_RATIO'] = df[volume_col] / df['VOLUME_MA']
        return df

    @staticmethod
    def add_breakout(df: pd.DataFrame, close_col: str = '收盘', period: int = 20) -> pd.DataFrame:
        """添加突破指标"""
        df = df.copy()
        df[f'BREAKOUT_{period}'] = df[close_col] > df[close_col].shift(1).rolling(period).max().shift(1)
        return df

    @staticmethod
    def calculate_all(df: pd.DataFrame,
                     close_col: str = '收盘',
                     high_col: str = '最高',
                     low_col: str = '最低',
                     volume_col: str = '成交量') -> pd.DataFrame:
        """
        计算所有常用技术指标

        Args:
            df: 包含OHLCV的DataFrame
            close_col: 收盘价列名
            high_col: 最高价列名
            low_col: 最低价列名
            volume_col: 成交量列名

        Returns:
            添加了所有技术指标的DataFrame
        """
        df = df.copy()

        # 依次添加各类指标
        df = IndicatorCalculator.add_ma(df, close_col)
        df = IndicatorCalculator.add_rsi(df, close_col)
        df = IndicatorCalculator.add_macd(df, close_col)
        df = IndicatorCalculator.add_boll(df, close_col)
        df = IndicatorCalculator.add_atr(df, high_col, low_col, close_col)
        df = IndicatorCalculator.add_kdj(df, high_col, low_col, close_col)
        df = IndicatorCalculator.add_momentum(df, close_col)
        df = IndicatorCalculator.add_volume(df, volume_col)
        df = IndicatorCalculator.add_breakout(df, close_col)

        return df

    @staticmethod
    def get_column_names(df: pd.DataFrame) -> Dict[str, str]:
        """
        获取标准化的列名映射

        Args:
            df: DataFrame

        Returns:
            列名映射字典 {close_col, high_col, low_col, volume_col, date_col}
        """
        columns = df.columns.tolist()

        # 收盘价
        if '收盘' in columns:
            close_col = '收盘'
        elif 'close' in columns:
            close_col = 'close'
        elif 'Close' in columns:
            close_col = 'Close'
        else:
            raise ValueError(f"无法找到收盘价列，当前列: {columns}")

        # 最高价
        if '最高' in columns:
            high_col = '最高'
        elif 'high' in columns:
            high_col = 'high'
        elif 'High' in columns:
            high_col = 'High'
        else:
            high_col = close_col

        # 最低价
        if '最低' in columns:
            low_col = '最低'
        elif 'low' in columns:
            low_col = 'low'
        elif 'Low' in columns:
            low_col = 'Low'
        else:
            low_col = close_col

        # 成交量
        if '成交量' in columns:
            volume_col = '成交量'
        elif 'volume' in columns:
            volume_col = 'volume'
        elif 'Volume' in columns:
            volume_col = 'Volume'
        else:
            volume_col = 'volume'

        # 日期
        if '日期' in columns:
            date_col = '日期'
        elif 'date' in columns:
            date_col = 'date'
        elif 'Date' in columns:
            date_col = 'Date'
        else:
            date_col = 'date'

        return {
            'close_col': close_col,
            'high_col': high_col,
            'low_col': low_col,
            'volume_col': volume_col,
            'date_col': date_col
        }
