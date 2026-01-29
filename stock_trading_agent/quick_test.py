# -*- coding: utf-8 -*-
"""
快速测试脚本 - 验证重构后的核心功能
"""

print("\n" + "="*50)
print("重构后策略系统快速测试")
print("="*50)

# 测试1: 导入测试
print("\n1. 测试模块导入...")
try:
    import sys
    import os
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

    from data.multi_source_fetcher import MultiSourceFetcher
    from core.indicator_calculator import IndicatorCalculator
    from core.base_strategy import BaseStrategy
    from strategies.v2_trend_following import V2TrendFollowing
    from strategies.v2_opt_aggressive import V2OptAggressive
    from strategies.v3_money_flow import V3MoneyFlow
    from strategies.strategy_factory import StrategyFactory

    print("   ✓ 所有模块导入成功")
except Exception as e:
    print(f"   ✗ 导入失败: {e}")
    sys.exit(1)

# 测试2: 策略工厂
print("\n2. 测试策略工厂...")
try:
    strategies = StrategyFactory.list_strategies()
    print(f"   可用策略: {strategies}")

    for name in strategies:
        strategy = StrategyFactory.create(name)
        print(f"   ✓ {name}: {strategy.get_strategy_name()}")
except Exception as e:
    print(f"   ✗ 策略工厂测试失败: {e}")

# 测试3: 技术指标计算
print("\n3. 测试技术指标计算...")
try:
    import pandas as pd
    import numpy as np

    # 创建测试数据
    dates = pd.date_range('2023-01-01', periods=100, freq='D')
    data = {
        '日期': dates,
        '开盘': np.random.uniform(10, 20, 100),
        '最高': np.random.uniform(10, 20, 100),
        '最低': np.random.uniform(10, 20, 100),
        '收盘': np.random.uniform(10, 20, 100),
        '成交量': np.random.uniform(1000000, 10000000, 100)
    }
    df = pd.DataFrame(data)

    calc = IndicatorCalculator()
    df_result = calc.calculate_all(df)

    indicators = ['MA5', 'MA10', 'MA20', 'MA60', 'RSI', 'MACD',
                  'MACD_SIGNAL', 'BOLL_MID', 'BOLL_UPPER', 'BOLL_LOWER']

    missing = [ind for ind in indicators if ind not in df_result.columns]
    if missing:
        print(f"   ✗ 缺少指标: {missing}")
    else:
        print(f"   ✓ 所有技术指标计算成功 ({len(indicators)} 个)")
except Exception as e:
    print(f"   ✗ 技术指标计算失败: {e}")

# 测试4: 策略实例化
print("\n4. 测试策略实例化...")
try:
    v2 = V2TrendFollowing()
    print(f"   ✓ V2策略: {v2.get_strategy_name()}")

    v2_opt = V2OptAggressive()
    print(f"   ✓ V2-Opt策略: {v2_opt.get_strategy_name()}")

    v3 = V3MoneyFlow()
    print(f"   ✓ V3策略: {v3.get_strategy_name()}")
except Exception as e:
    print(f"   ✗ 策略实例化失败: {e}")

# 测试5: 代码大小统计
print("\n5. 代码大小统计...")
try:
    original_files = [
        ('backtest_strategy_v2.py', 'v2'),
        ('backtest_strategy_v2_opt.py', 'v2_opt'),
        ('backtest_strategy_v3.py', 'v3')
    ]

    new_files = [
        ('strategies/v2_trend_following.py', 'v2'),
        ('strategies/v2_opt_aggressive.py', 'v2_opt'),
        ('strategies/v3_money_flow.py', 'v3')
    ]

    core_files = [
        'data/multi_source_fetcher.py',
        'core/indicator_calculator.py',
        'core/base_strategy.py',
        'strategies/strategy_factory.py'
    ]

    original_total = 0
    new_total = 0
    core_total = 0

    print("   原始策略文件:")
    for file, name in original_files:
        if os.path.exists(file):
            with open(file, 'r', encoding='utf-8') as f:
                lines = len(f.readlines())
                original_total += lines
                print(f"     {file}: {lines} 行")

    print("\n   新策略文件:")
    for file, name in new_files:
        if os.path.exists(file):
            with open(file, 'r', encoding='utf-8') as f:
                lines = len(f.readlines())
                new_total += lines
                print(f"     {file}: {lines} 行")

    print("\n   核心框架文件:")
    for file in core_files:
        if os.path.exists(file):
            with open(file, 'r', encoding='utf-8') as f:
                lines = len(f.readlines())
                core_total += lines
                print(f"     {file}: {lines} 行")

    print(f"\n   原始代码总计: {original_total} 行")
    print(f"   新策略代码: {new_total} 行")
    print(f"   核心框架代码: {core_total} 行")
    print(f"   新代码总计: {new_total + core_total} 行")

    if original_total > 0:
        reduction = (original_total - (new_total + core_total)) / original_total * 100
        print(f"   代码减少: {reduction:.1f}%")

except Exception as e:
    print(f"   ✗ 代码统计失败: {e}")

print("\n" + "="*50)
print("快速测试完成!")
print("="*50)
