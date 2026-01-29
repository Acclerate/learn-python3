# -*- coding: utf-8 -*-
"""
重构后策略测试脚本
验证各策略功能正常，对比重构前后结果
"""

import sys
import os

# 添加路径
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from strategies.strategy_factory import StrategyFactory
from strategies.v2_trend_following import V2TrendFollowing
from strategies.v2_opt_aggressive import V2OptAggressive
from strategies.v3_money_flow import V3MoneyFlow


def test_strategy_factory():
    """测试策略工厂"""
    print("\n" + "="*50)
    print("测试策略工厂")
    print("="*50)

    # 列出所有策略
    strategies = StrategyFactory.list_strategies()
    print(f"可用策略: {strategies}")

    # 创建策略
    for name in strategies:
        info = StrategyFactory.get_strategy_info(name)
        print(f"\n策略: {info['name']}")
        print(f"显示名: {info['display_name']}")
        print(f"类名: {info['class']}")

        strategy = StrategyFactory.create(name)
        print(f"实例化成功: {strategy.get_strategy_name()}")


def test_v2_strategy():
    """测试V2策略"""
    print("\n" + "="*50)
    print("测试V2趋势跟踪策略")
    print("="*50)

    strategy = V2TrendFollowing(
        initial_capital=100000.0,
        trailing_stop_pct=0.08,
        profit_take_pct=0.25
    )

    print(f"策略名称: {strategy.get_strategy_name()}")

    # 测试回测
    result = strategy.run_backtest(
        symbol="000001",
        start_date="2023-01-01",
        end_date="2023-12-31"
    )

    strategy.print_report(result)


def test_v2_opt_strategy():
    """测试V2-Opt策略"""
    print("\n" + "="*50)
    print("测试V2-Opt激进策略")
    print("="*50)

    strategy = V2OptAggressive(
        initial_capital=100000.0,
        trailing_stop_pct=0.06,
        profit_take_pct=0.50
    )

    print(f"策略名称: {strategy.get_strategy_name()}")

    # 测试回测
    result = strategy.run_backtest(
        symbol="000001",
        start_date="2023-01-01",
        end_date="2023-12-31"
    )

    strategy.print_report(result)


def test_v3_strategy():
    """测试V3策略"""
    print("\n" + "="*50)
    print("测试V3资金流向策略")
    print("="*50)

    strategy = V3MoneyFlow(
        initial_capital=100000.0,
        trailing_stop_pct=0.08,
        profit_take_pct=0.30
    )

    print(f"策略名称: {strategy.get_strategy_name()}")

    # 测试回测
    result = strategy.run_backtest(
        symbol="000001",
        start_date="2023-01-01",
        end_date="2023-12-31"
    )

    strategy.print_report(result)


def test_legacy_wrapper():
    """测试兼容层"""
    print("\n" + "="*50)
    print("测试Legacy兼容层")
    print("="*50)

    from legacy.v2_wrapper import BacktestEngineV2
    from legacy.v2_opt_wrapper import BacktestEngineV2Opt
    from legacy.v3_wrapper import BacktestEngineV3

    # V2兼容测试
    print("\nV2兼容包装器:")
    v2 = BacktestEngineV2()
    print(f"策略名称: {v2._strategy.get_strategy_name()}")

    # V2-Opt兼容测试
    print("\nV2-Opt兼容包装器:")
    v2_opt = BacktestEngineV2Opt()
    print(f"策略名称: {v2_opt._strategy.get_strategy_name()}")

    # V3兼容测试
    print("\nV3兼容包装器:")
    v3 = BacktestEngineV3()
    print(f"策略名称: {v3._strategy.get_strategy_name()}")


def compare_code_size():
    """对比代码大小"""
    print("\n" + "="*50)
    print("代码大小对比")
    print("="*50)

    import os

    # 原始文件
    original_files = [
        'backtest_strategy_v2.py',
        'backtest_strategy_v2_opt.py',
        'backtest_strategy_v3.py'
    ]

    # 新文件
    new_files = [
        'strategies/v2_trend_following.py',
        'strategies/v2_opt_aggressive.py',
        'strategies/v3_money_flow.py'
    ]

    # 核心框架文件
    core_files = [
        'data/multi_source_fetcher.py',
        'core/indicator_calculator.py',
        'core/base_strategy.py',
        'strategies/strategy_factory.py'
    ]

    original_lines = 0
    for file in original_files:
        if os.path.exists(file):
            with open(file, 'r', encoding='utf-8') as f:
                lines = len(f.readlines())
                original_lines += lines
                print(f"{file}: {lines} 行")

    print(f"\n原始代码总计: {original_lines} 行")

    new_lines = 0
    for file in new_files:
        if os.path.exists(file):
            with open(file, 'r', encoding='utf-8') as f:
                lines = len(f.readlines())
                new_lines += lines
                print(f"{file}: {lines} 行")

    core_lines = 0
    for file in core_files:
        if os.path.exists(file):
            with open(file, 'r', encoding='utf-8') as f:
                lines = len(f.readlines())
                core_lines += lines
                print(f"{file}: {lines} 行")

    print(f"\n新策略代码: {new_lines} 行")
    print(f"核心框架代码: {core_lines} 行")
    print(f"新代码总计: {new_lines + core_lines} 行")

    reduction = (original_lines - (new_lines + core_lines)) / original_lines * 100
    print(f"\n代码减少: {reduction:.1f}%")


if __name__ == "__main__":
    print("\n" + "="*60)
    print("重构后策略系统测试")
    print("="*60)

    try:
        # 测试策略工厂
        test_strategy_factory()

        # 测试各策略
        test_v2_strategy()
        test_v2_opt_strategy()
        test_v3_strategy()

        # 测试兼容层
        test_legacy_wrapper()

        # 对比代码大小
        compare_code_size()

        print("\n" + "="*60)
        print("所有测试完成!")
        print("="*60)

    except Exception as e:
        print(f"\n测试失败: {e}")
        import traceback
        traceback.print_exc()
