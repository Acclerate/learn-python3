# -*- coding: utf-8 -*-
"""
V2-Opt激进策略
继承V2策略，添加动态止损，约50行
"""

import pandas as pd
from strategies.v2_trend_following import V2TrendFollowing


class V2OptAggressive(V2TrendFollowing):
    """
    V2-Opt激进策略

    基于V2策略，更激进的参数和动态止损：
    - 更大的止盈目标（50% vs 25%）
    - 更宽的止损（6% vs 8%）
    - 降低信号门槛
    """

    def __init__(self,
                 initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50):
        super().__init__(initial_capital, trailing_stop_pct, profit_take_pct)
        self.use_dynamic_stop = True

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成激进型交易信号

        相比V2，降低买入门槛，增加信号频率
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

            # === 买入信号（更激进）===
            # 1. MA金叉（降低条件）
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append("MA金叉")

            # 2. MACD金叉（DIF<0也接受）
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and
                current['MACD'] > current['MACD_SIGNAL']):
                signals_buy.append("MACD金叉")

            # 3. 价格站稳MA5（降低门槛）
            if current[close_col] > current['MA5']:
                signals_buy.append("站稳MA5")

            # 4. RSI超卖反弹
            if current['RSI'] < 40:  # V2是35，这里放宽到40
                signals_buy.append(f"RSI超卖({current['RSI']:.1f})")

            # 5. 双金叉强信号
            ma_cross = (prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10'])
            macd_cross = (prev['MACD'] <= prev['MACD_SIGNAL'] and
                          current['MACD'] > current['MACD_SIGNAL'])
            if ma_cross and macd_cross:
                signals_buy.append("双金叉")

            # === 卖出信号（保守，主要由止损处理）===
            # 只在极端情况下主动卖出
            if current['RSI'] > 85:
                signals_sell.append(f"RSI极度超买({current['RSI']:.1f})")

            # 综合判断
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            # 买入：至少1个信号且无卖出信号
            if buy_score >= 1 and sell_score == 0:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)
            # 卖出：强卖出信号
            elif sell_score >= 1:
                df.loc[i, 'signal'] = -1
                df.loc[i, 'signal_reason'] = ','.join(signals_sell)

        return df

    def check_dynamic_stop(self, entry_price: float, current_price: float) -> bool:
        """
        动态止损检查

        Args:
            entry_price: 入场价格
            current_price: 当前价格

        Returns:
            是否触发止损
        """
        profit_pct = (current_price - entry_price) / entry_price

        # 盈利>50%：动态50%回撤止损
        if profit_pct > 0.5:
            return (current_price - entry_price) / entry_price < profit_pct * 0.5

        # 盈利>30%：动态40%回撤止损
        if profit_pct > 0.3:
            return (current_price - entry_price) / entry_price < profit_pct * 0.4

        # 盈利>10%：动态30%回撤止损
        if profit_pct > 0.1:
            return (current_price - entry_price) / entry_price < profit_pct * 0.3

        return False

    def get_strategy_name(self) -> str:
        """返回策略名称"""
        return "V2-Opt激进策略"
