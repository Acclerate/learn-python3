# -*- coding: utf-8 -*-
"""
V2趋势跟踪策略
重构后约80行，继承BaseStrategy
"""

import pandas as pd
from core.base_strategy import BaseStrategy


class V2TrendFollowing(BaseStrategy):
    """
    V2趋势跟踪策略

    买入策略:
    1. MA金叉 (MA5上穿MA10)
    2. MACD金叉
    3. 价格站稳MA20之上
    4. RSI超卖反弹

    卖出策略:
    1. 移动止损由基类处理
    2. MA死叉 (MA5下穿MA10)
    3. 跌破MA20且RSI>50
    """

    def __init__(self,
                 initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.25):
        super().__init__(initial_capital, trailing_stop_pct, profit_take_pct)

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成V2趋势跟踪交易信号

        Args:
            df: 包含技术指标的数据

        Returns:
            添加了signal列的DataFrame
        """
        df = df.copy()
        df['signal'] = 0
        df['signal_reason'] = ''

        # 获取收盘价列名
        columns = df.columns.tolist()
        close_col = '收盘' if '收盘' in columns else 'Close'

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
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and
                current['MACD'] > current['MACD_SIGNAL']):
                signals_buy.append("MACD金叉")

            # 3. 价格站稳MA20
            if (current[close_col] > current['MA20'] and
                current['MA5'] > current['MA20']):
                signals_buy.append("站稳MA20")

            # 4. RSI超卖反弹
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
            if (prev['MACD'] >= prev['MACD_SIGNAL'] and
                current['MACD'] < current['MACD_SIGNAL'] and
                current['RSI'] > 55):
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

    def get_strategy_name(self) -> str:
        """返回策略名称"""
        return "V2趋势跟踪策略"
