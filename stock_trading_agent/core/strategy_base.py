# -*- coding: utf-8 -*-
"""
策略基类 - 定义策略接口
所有策略必须继承此类并实现相应方法
"""

from abc import ABC, abstractmethod
from typing import Dict, Optional
import pandas as pd


class StrategyBase(ABC):
    """
    策略基类（抽象基类）

    所有实时策略必须继承此类并实现以下方法：
    - get_name(): 返回策略名称
    - get_version(): 返回策略版本
    - initialize(): 初始化策略参数
    - generate_signals(): 生成交易信号
    - get_trading_params(): 获取交易参数（止损、止盈等）
    """

    def __init__(self, initial_capital: float = 100000.0):
        """
        初始化策略基类

        Args:
            initial_capital: 初始资金
        """
        self.initial_capital = initial_capital
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.lowest_since_highest = 0.0
        self.consecutive_up = 0
        self.consecutive_down = 0
        self.trades = []
        self.records = []

    @abstractmethod
    def get_name(self) -> str:
        """返回策略名称"""
        pass

    @abstractmethod
    def get_version(self) -> str:
        """返回策略版本"""
        pass

    @abstractmethod
    def initialize(self, **params):
        """初始化策略参数"""
        pass

    @abstractmethod
    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成交易信号

        Args:
            df: 包含OHLCV和技术指标的DataFrame

        Returns:
            添加了signal和signal_reason列的DataFrame
        """
        pass

    def get_trading_params(self) -> Dict:
        """
        获取交易参数

        Returns:
            包含止损、止盈等参数的字典
        """
        return {
            'trailing_stop_pct': getattr(self, 'trailing_stop_pct', 0.06),
            'profit_take_pct': getattr(self, 'profit_take_pct', 0.50),
            'hard_stop_pct': getattr(self, 'hard_stop_pct', 0.15),
            'use_dynamic_stop': getattr(self, 'use_dynamic_stop', True),
        }

    def check_stop_loss(self, current_price: float) -> Optional[str]:
        """
        检查止损止盈（可被子类覆盖）

        Args:
            current_price: 当前价格

        Returns:
            触发原因，None表示未触发
        """
        params = self.get_trading_params()
        trailing_stop = params['trailing_stop_pct']
        profit_take = params['profit_take_pct']
        use_dynamic = params['use_dynamic_stop']

        if self.position == 0:
            return None

        # 更新最高价
        if current_price > self.highest_price:
            self.highest_price = current_price
            self.lowest_since_highest = current_price
            self.consecutive_up += 1
            self.consecutive_down = 0
        elif current_price < self.lowest_since_highest:
            self.lowest_since_highest = current_price
            self.consecutive_up = 0
            self.consecutive_down += 1

        # 计算盈利
        profit_pct = (current_price - self.avg_cost) / self.avg_cost

        # 硬止损
        hard_stop = params.get('hard_stop_pct', 0.15)
        if profit_pct < -hard_stop:
            return f"硬止损(亏损{profit_pct*100:.1f}%)"

        if use_dynamic:
            # 分阶段动态止损
            if profit_pct < 0.08:
                return None
            elif profit_pct < 0.15:
                stop_loss_pct = 0.15
                take_profit_pct = 0.40
            elif profit_pct < 0.25:
                stop_loss_pct = 0.12
                take_profit_pct = 0.50
            elif profit_pct < 0.40:
                stop_loss_pct = 0.08
                take_profit_pct = 0.70
            else:
                stop_loss_pct = 0.06
                take_profit_pct = 1.00
        else:
            stop_loss_pct = trailing_stop
            take_profit_pct = profit_take

        # 计算回撤
        drawdown = (self.highest_price - current_price) / self.highest_price

        # 止盈检查
        if profit_pct >= take_profit_pct:
            if self.consecutive_up >= 3:
                return None
            return f"止盈(盈利{profit_pct*100:.1f}%)"

        # 移动止损
        if drawdown >= stop_loss_pct:
            if self.consecutive_down < 2:
                return None
            return f"移动止损(回撤{drawdown*100:.1f}%)"

        return None

    def reset_state(self):
        """重置策略状态"""
        self.cash = self.initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.lowest_since_highest = 0.0
        self.consecutive_up = 0
        self.consecutive_down = 0
        self.trades = []
        self.records = []

    def __repr__(self) -> str:
        return f"{self.get_name()} v{self.get_version()}"
