# -*- coding: utf-8 -*-
"""
V2-Opt策略兼容包装器
保持原有接口，内部委托给新架构
"""

from core.indicator_calculator import IndicatorCalculator
from data.multi_source_fetcher import MultiSourceFetcher


class BacktestEngineV2Opt:
    """
    V2-Opt策略兼容包装器
    保持原有接口，内部使用新架构
    """

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.06,
                 profit_take_pct: float = 0.50,
                 use_dynamic_stop: bool = True):
        from strategies.v2_opt_aggressive import V2OptAggressive

        self._strategy = V2OptAggressive(
            initial_capital=initial_capital,
            trailing_stop_pct=trailing_stop_pct,
            profit_take_pct=profit_take_pct
        )
        self.use_dynamic_stop = use_dynamic_stop

        # 保持原有属性访问
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.lowest_since_highest = 0.0
        self.trades = []
        self.daily_value = []
        self.consecutive_up_days = 0
        self.consecutive_down_days = 0

    def calculate_indicators(self, df):
        """计算技术指标 - 委托给新架构"""
        calc = IndicatorCalculator()
        return calc.calculate_all(df)

    def get_historical_data(self, symbol: str, start_date: str, end_date: str):
        """获取历史数据 - 委托给新架构"""
        return self._strategy.get_historical_data(symbol, start_date, end_date)

    def generate_signals_aggressive(self, df):
        """生成激进信号 - 委托给新架构"""
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

    def get_dynamic_stop_loss(self, current_price):
        """动态止损 - 委托给新架构"""
        return self._strategy.check_dynamic_stop(self.avg_cost, current_price)


# 便捷函数
def create_v2_opt_strategy(initial_capital=100000.0, trailing_stop_pct=0.06,
                          profit_take_pct=0.50, use_dynamic_stop=True):
    """创建V2-Opt策略实例"""
    return BacktestEngineV2Opt(initial_capital, trailing_stop_pct,
                              profit_take_pct, use_dynamic_stop)
