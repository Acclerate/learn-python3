# -*- coding: utf-8 -*-
"""
V3策略兼容包装器
保持原有接口，内部委托给新架构
"""

from core.indicator_calculator import IndicatorCalculator
from data.multi_source_fetcher import MultiSourceFetcher


class BacktestEngineV3:
    """
    V3策略兼容包装器
    保持原有接口，内部使用新架构
    """

    def __init__(self, initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.30):
        from strategies.v3_money_flow import V3MoneyFlow

        self._strategy = V3MoneyFlow(
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
        self.fund_flow_data = None

    def calculate_indicators(self, df):
        """计算技术指标 - 委托给新架构"""
        calc = IndicatorCalculator()
        return calc.calculate_all(df)

    def get_historical_data(self, symbol: str, start_date: str, end_date: str):
        """获取历史数据 - 委托给新架构"""
        return self._strategy.get_historical_data(symbol, start_date, end_date)

    def get_fund_flow_data(self, symbol: str, start_date: str, end_date: str):
        """获取资金流向数据 - 委托给新架构"""
        self._strategy.get_fund_flow_data(symbol, start_date, end_date)
        self.fund_flow_data = self._strategy.fund_flow_data
        return self.fund_flow_data

    def merge_fund_flow_to_price(self, price_df, fund_df):
        """合并资金流向数据 - 委托给新架构"""
        # 新架构在run_backtest中自动处理
        return price_df

    def generate_signals_v3(self, df):
        """生成V3信号 - 委托给新架构"""
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


# 便捷函数
def create_v3_strategy(initial_capital=100000.0, trailing_stop_pct=0.08,
                      profit_take_pct=0.30):
    """创建V3策略实例"""
    return BacktestEngineV3(initial_capital, trailing_stop_pct, profit_take_pct)
