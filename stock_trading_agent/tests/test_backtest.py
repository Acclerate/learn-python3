# -*- coding: utf-8 -*-
"""
测试脚本 - 验证新架构功能
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from strategies import StrategyV1, StrategyV2Opt, StrategyV21
from core.backtest_engine import BacktestEngine


def test_v21_backtest():
    """测试V2.1策略回测"""
    print("=" * 60)
    print("测试: V2.1策略回测")
    print("=" * 60)

    strategy = StrategyV21(initial_capital=100000)
    engine = BacktestEngine(strategy)

    result = engine.run(symbol='002202', months=3)

    BacktestEngine.print_report(result)

    # 验证结果（V2.1有额外的辅助指标，可能产生更多交易）
    actual_return = result['total_return']
    min_expected_return = 70.0  # 最低期望收益率

    if actual_return >= min_expected_return:
        print(f"\n[PASS] 测试通过: V2.1回测收益率 = {actual_return:.2f}% (预期>={min_expected_return:.2f}%)")
        return True
    else:
        print(f"\n[FAIL] 测试失败: 预期 >={min_expected_return:.2f}%, 实际 {actual_return:.2f}%")
        return False


def test_v2_opt_backtest():
    """测试V2-Opt策略回测"""
    print("\n" + "=" * 60)
    print("测试: V2-Opt策略回测")
    print("=" * 60)

    strategy = StrategyV2Opt(initial_capital=100000)
    engine = BacktestEngine(strategy)

    result = engine.run(symbol='002202', months=3)

    BacktestEngine.print_report(result)

    # 验证结果
    expected_return = 76.91
    actual_return = result['total_return']

    if abs(actual_return - expected_return) < 0.01:
        print(f"\n[PASS] 测试通过: V2-Opt回测收益率 = {actual_return:.2f}% (预期: {expected_return:.2f}%)")
        return True
    else:
        print(f"\n[FAIL] 测试失败: 预期 {expected_return:.2f}%, 实际 {actual_return:.2f}%")
        return False


def test_v1_backtest():
    """测试V1策略回测"""
    print("\n" + "=" * 60)
    print("测试: V1策略回测")
    print("=" * 60)

    strategy = StrategyV1(initial_capital=100000)
    engine = BacktestEngine(strategy)

    result = engine.run(symbol='002202', months=3)

    BacktestEngine.print_report(result)

    print(f"\n[OK] V1回测完成，收益率 = {result['total_return']:.2f}%")
    return True


def test_comparison():
    """测试对比回测"""
    print("\n" + "=" * 60)
    print("测试: 多策略对比回测")
    print("=" * 60)

    strategies_to_test = [
        ('V1', StrategyV1(initial_capital=100000)),
        ('V2-Opt', StrategyV2Opt(initial_capital=100000)),
        ('V2.1', StrategyV21(initial_capital=100000)),
    ]

    results = {}

    for name, strategy in strategies_to_test:
        print(f"\n--- {name} ---")
        engine = BacktestEngine(strategy)
        result = engine.run(symbol='002202', months=3)
        results[name] = result

    # 打印对比表
    print("\n" + "=" * 80)
    print("策略对比总结")
    print("=" * 80)
    print(f"{'策略':<15} {'收益率':>10} {'最终资产':>15} {'胜率':>8} {'最大回撤':>10} {'夏普比率':>10}")
    print("-" * 80)

    for name, result in results.items():
        print(f"{name:<15} {result['total_return']:>+9.2f}% "
              f"{result['final_value']:>14,.2f} "
              f"{result['win_rate']:>7.2f}% "
              f"{result['max_drawdown']:>9.2f}% "
              f"{result['sharpe_ratio']:>9.4f}")

    print("=" * 80)

    # 验证所有策略都取得正收益
    all_profitable = all(r['total_return'] > 0 for r in results.values())

    if all_profitable:
        print(f"\n[PASS] 测试通过: 所有策略都取得了正收益")
        return True
    else:
        print(f"\n[FAIL] 测试失败: 部分策略未能取得正收益")
        return False


def main():
    """运行所有测试"""
    print("\n" + "#" * 60)
    print("# 新架构功能测试")
    print("#" * 60 + "\n")

    all_passed = True

    # 测试各个策略
    all_passed &= test_v21_backtest()
    all_passed &= test_v2_opt_backtest()
    all_passed &= test_v1_backtest()

    # 测试对比功能
    all_passed &= test_comparison()

    # 总结
    print("\n" + "#" * 60)
    if all_passed:
        print("# [SUCCESS] 所有测试通过！")
    else:
        print("# [FAILURE] 部分测试失败，请检查")
    print("#" * 60 + "\n")


if __name__ == "__main__":
    main()
