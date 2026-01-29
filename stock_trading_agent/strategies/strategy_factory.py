# -*- coding: utf-8 -*-
"""
策略工厂 - 工厂模式
统一管理策略创建，支持配置化
"""

from typing import Dict, Type, Optional
from core.base_strategy import BaseStrategy
from strategies.v2_trend_following import V2TrendFollowing
from strategies.v2_opt_aggressive import V2OptAggressive
from strategies.v3_money_flow import V3MoneyFlow


class StrategyFactory:
    """
    策略工厂 - 工厂模式
    统一管理策略创建，支持配置化
    """

    _strategies: Dict[str, Type[BaseStrategy]] = {}

    @classmethod
    def register(cls, name: str, strategy_class: Type[BaseStrategy]):
        """
        注册新策略

        Args:
            name: 策略名称
            strategy_class: 策略类
        """
        cls._strategies[name] = strategy_class

    @classmethod
    def create(cls,
               strategy_name: str,
               initial_capital: float = 100000.0,
               trailing_stop_pct: float = 0.08,
               profit_take_pct: float = 0.30) -> Optional[BaseStrategy]:
        """
        创建策略实例

        Args:
            strategy_name: 策略名称
            initial_capital: 初始资金
            trailing_stop_pct: 移动止损百分比
            profit_take_pct: 止盈百分比

        Returns:
            策略实例
        """
        if strategy_name not in cls._strategies:
            raise ValueError(f"Unknown strategy: {strategy_name}. Available: {cls.list_strategies()}")

        strategy_class = cls._strategies[strategy_name]
        return strategy_class(
            initial_capital=initial_capital,
            trailing_stop_pct=trailing_stop_pct,
            profit_take_pct=profit_take_pct
        )

    @classmethod
    def list_strategies(cls) -> list:
        """
        列出所有可用策略

        Returns:
            策略名称列表
        """
        return list(cls._strategies.keys())

    @classmethod
    def get_strategy_info(cls, strategy_name: str) -> Dict[str, str]:
        """
        获取策略信息

        Args:
            strategy_name: 策略名称

        Returns:
            策略信息字典
        """
        if strategy_name not in cls._strategies:
            raise ValueError(f"Unknown strategy: {strategy_name}")

        strategy_class = cls._strategies[strategy_name]
        instance = strategy_class()

        return {
            'name': strategy_name,
            'display_name': instance.get_strategy_name(),
            'class': strategy_class.__name__,
            'module': strategy_class.__module__
        }


# 注册内置策略
StrategyFactory.register('v2', V2TrendFollowing)
StrategyFactory.register('v2_opt', V2OptAggressive)
StrategyFactory.register('v3', V3MoneyFlow)
