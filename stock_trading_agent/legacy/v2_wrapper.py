# -*- coding: utf-8 -*-
"""
V2策略兼容包装器
保持原有接口，内部委托给新架构
"""

from core.indicator_calculator import IndicatorCalculator
from data.multi_source_fetcher import MultiSourceFetcher


class BacktestEngineV2:
    """
    V2策略兼容包装器
    保持原有接口，内部使用新架构
    """

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.25):
        from strategies.v2_trend_following import V2TrendFollowing

        self._strategy = V2TrendFollowing(
            initial_capital=initial_capital,
            trailing_stop_pct=trailing_stop_pct,
            profit_take_pct=profit_take_pct
        )

        # 保持原有属性访问
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.trades = []
        self.daily_value = []

    def calculate_indicators(self, df):
        """计算技术指标 - 委托给新架构"""
        calc = IndicatorCalculator()
        return calc.calculate_all(df)

    def get_historical_data(self, symbol: str, start_date: str, end_date: str):
        """获取历史数据 - 委托给新架构"""
        return self._strategy.get_historical_data(symbol, start_date, end_date)

    def generate_signals_v2(self, df):
        """生成V2信号 - 委托给新架构"""
        return self._strategy.generate_signals(df)

    def run(self, df):
        """执行回测 - 委托给新架构"""
        result = self._strategy.run(df)

        # 同步状态（保持兼容性）
        self.cash = self._strategy.cash
        self.position = self._strategy.position
        self.avg_cost = self._strategy.avg_cost
        self.highest_price = self._strategy.highest_price
        self.trades = self._strategy.trades
        self.daily_value = self._strategy.daily_value

        return result

    def print_report(self, result):
        """打印报告 - 委托给新架构"""
        self._strategy.print_report(result)

    def execute_trade(self, date, price: float, signal: int, reason: str,
                     current_price: float = None, in_position: bool = False):
        """执行交易 - 保留原有接口"""
        # 已在新架构中处理
        pass

    def check_trailing_stop(self, date, price):
        """检查移动止损 - 保留原有接口"""
        # 已在新架构中处理
        pass


# 便捷函数
def create_v2_strategy(initial_capital=100000.0, trailing_stop_pct=0.08, profit_take_pct=0.25):
    """创建V2策略实例"""
    return BacktestEngineV2(initial_capital, trailing_stop_pct, profit_take_pct)
