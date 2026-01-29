# -*- coding: utf-8 -*-
"""
策略基类 - 模板方法模式
定义策略执行的标准流程，子类只需实现特有逻辑
"""

import os
import pandas as pd
import numpy as np
from abc import ABC, abstractmethod
from typing import Dict, List, Optional, Any
from datetime import datetime

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''

from data.multi_source_fetcher import MultiSourceFetcher
from core.indicator_calculator import IndicatorCalculator


class BaseStrategy(ABC, BaseBacktestEngine):
    """
    策略基类 - 使用模板方法模式
    定义策略执行的标准流程，子类只需实现特有逻辑
    """

    def __init__(self,
                 initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.30):
        """
        初始化策略

        Args:
            initial_capital: 初始资金
            trailing_stop_pct: 移动止损百分比
            profit_take_pct: 止盈百分比
        """
        # 初始化回测引擎
        super().__init__(initial_capital, trailing_stop_pct, profit_take_pct)

        # 策略特有配置
        self.config = {
            'initial_capital': initial_capital,
            'trailing_stop_pct': trailing_stop_pct,
            'profit_take_pct': profit_take_pct
        }

        # 注入依赖
        self.data_fetcher = MultiSourceFetcher()
        self.indicator_calc = IndicatorCalculator()

    @abstractmethod
    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成交易信号 - 子类必须实现

        Args:
            df: 包含技术指标的数据

        Returns:
            添加了signal列的DataFrame
        """
        pass

    def get_historical_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """
        获取历史数据 - 使用多数据源

        Args:
            symbol: 股票代码
            start_date: 开始日期
            end_date: 结束日期

        Returns:
            标准化后的数据
        """
        print(f"[*] Fetching historical data for {symbol} ({start_date} ~ {end_date})...")

        df = self.data_fetcher.fetch_data(symbol, period="daily")

        if df is None or df.empty:
            raise ValueError(f"Failed to fetch data for {symbol}")

        # 列名标准化（baostock返回的是英文小写列名）
        if 'date' in df.columns and '日期' not in df.columns:
            df.rename(columns={'date': '日期', 'open': '开盘', 'high': '最高',
                               'low': '最低', 'close': '收盘', 'volume': '成交量'}, inplace=True)

        # 日期过滤
        if '日期' in df.columns:
            df['日期'] = pd.to_datetime(df['日期'])
            df = df[(df['日期'] >= start_date) & (df['日期'] <= end_date)]

        print(f"    [OK] Got {len(df)} records")
        return df

    def prepare_data(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        数据准备 - 计算技术指标

        Args:
            df: 原始数据

        Returns:
            添加了技术指标的数据
        """
        # 计算技术指标
        df = self.indicator_calc.calculate_all(df)
        return df

    def run_backtest(self, symbol: str, start_date: str, end_date: str) -> Dict[str, Any]:
        """
        运行回测 - 模板方法

        Args:
            symbol: 股票代码
            start_date: 开始日期
            end_date: 结束日期

        Returns:
            回测结果字典
        """
        # 1. 获取数据
        df = self.get_historical_data(symbol, start_date, end_date)

        # 2. 计算技术指标
        df = self.prepare_data(df)

        # 3. 生成交易信号
        df = self.generate_signals(df)

        # 4. 执行回测
        result = self.run(df)

        return result

    @abstractmethod
    def get_strategy_name(self) -> str:
        """返回策略名称"""
        pass


class BaseBacktestEngine:
    """
    回测引擎基类
    包含通用的回测逻辑
    """

    def __init__(self,
                 initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.30):
        """
        初始化回测引擎

        Args:
            initial_capital: 初始资金
            trailing_stop_pct: 移动止损百分比
            profit_take_pct: 止盈百分比
        """
        self.initial_capital = initial_capital
        self.trailing_stop_pct = trailing_stop_pct
        self.profit_take_pct = profit_take_pct
        self.cash = initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.trades = []
        self.daily_value = []

    def run(self, df: pd.DataFrame) -> Dict[str, Any]:
        """
        执行回测

        Args:
            df: 包含信号的数据

        Returns:
            回测结果
        """
        # 重置状态
        self.cash = self.initial_capital
        self.position = 0
        self.avg_cost = 0.0
        self.highest_price = 0.0
        self.trades = []
        self.daily_value = []

        # 获取列名
        columns = df.columns.tolist()
        if '收盘' in columns:
            close_col = '收盘'
        else:
            close_col = 'Close'

        if '日期' in columns:
            date_col = '日期'
        else:
            date_col = df.index.name or 'index'

        # 主循环
        for i in range(len(df)):
            date = df.iloc[i][date_col]
            price = df.iloc[i][close_col]
            signal = df.iloc[i].get('signal', 0)

            # 更新每日资产
            if self.position > 0:
                total_value = self.cash + self.position * price
            else:
                total_value = self.cash

            self.daily_value.append({
                'date': date,
                'cash': self.cash,
                'position': self.position,
                'price': price,
                'total_value': total_value
            })

            # 处理交易信号
            if signal == 1 and self.position == 0:
                # 买入信号
                self.execute_buy(date, price)
            elif signal == -1 and self.position > 0:
                # 卖出信号
                self.execute_sell(date, price)

            # 移动止损检查
            if self.position > 0:
                self.check_trailing_stop(date, price)

        # 最终平仓
        if self.position > 0 and len(df) > 0:
            last_date = df.iloc[-1][date_col]
            last_price = df.iloc[-1][close_col]
            self.execute_sell(last_date, last_price, reason="期末平仓")

        return self.calculate_result()

    def execute_buy(self, date, price):
        """执行买入"""
        shares = int(self.cash / price)
        if shares > 0:
            cost = shares * price
            self.cash -= cost
            self.position = shares
            self.avg_cost = price
            self.highest_price = price
            self.trades.append({
                'date': date,
                'action': 'buy',
                'price': price,
                'shares': shares,
                'reason': 'signal'
            })

    def execute_sell(self, date, price, reason="signal"):
        """执行卖出"""
        if self.position > 0:
            proceeds = self.position * price
            self.cash += proceeds
            profit = proceeds - self.position * self.avg_cost
            profit_pct = profit / (self.position * self.avg_cost)

            self.trades.append({
                'date': date,
                'action': 'sell',
                'price': price,
                'shares': self.position,
                'reason': reason,
                'profit': profit,
                'profit_pct': profit_pct
            })

            self.position = 0
            self.avg_cost = 0.0
            self.highest_price = 0.0

    def check_trailing_stop(self, date, price):
        """检查移动止损"""
        if price > self.highest_price:
            self.highest_price = price

        stop_loss_price = self.highest_price * (1 - self.trailing_stop_pct)

        if price <= stop_loss_price:
            self.execute_sell(date, price, reason="移动止损")

    def calculate_result(self) -> Dict[str, Any]:
        """计算回测结果"""
        if not self.daily_value:
            return {
                'total_return': 0,
                'final_value': self.initial_capital,
                'trades': [],
                'win_rate': 0
            }

        final_value = self.daily_value[-1]['total_value']
        total_return = (final_value - self.initial_capital) / self.initial_capital

        sell_trades = [t for t in self.trades if t['action'] == 'sell']
        win_trades = [t for t in sell_trades if t.get('profit', 0) > 0]
        win_rate = len(win_trades) / len(sell_trades) if sell_trades else 0

        return {
            'initial_capital': self.initial_capital,
            'final_value': final_value,
            'total_return': total_return,
            'total_return_pct': total_return * 100,
            'trades': self.trades,
            'trade_count': len(sell_trades),
            'win_count': len(win_trades),
            'win_rate': win_rate,
            'win_rate_pct': win_rate * 100,
            'daily_value': self.daily_value
        }

    def print_report(self, result: Dict[str, Any]):
        """打印回测报告"""
        print(f"\n{'='*50}")
        print(f"回测结果: {self.get_strategy_name()}")
        print(f"{'='*50}")
        print(f"初始资金: ¥{result['initial_capital']:,.2f}")
        print(f"最终权益: ¥{result['final_value']:,.2f}")
        print(f"总收益率: {result['total_return_pct']:.2f}%")
        print(f"交易次数: {result['trade_count']}")
        print(f"盈利次数: {result['win_count']}")
        print(f"胜率: {result['win_rate_pct']:.2f}%")
        print(f"{'='*50}\n")

    def get_strategy_name(self) -> str:
        """返回策略名称"""
        return "BaseStrategy"
