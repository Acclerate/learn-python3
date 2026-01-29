# -*- coding: utf-8 -*-
"""
统一回测运行器
支持批量回测多个策略，对比分析
"""

import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from core.backtest_engine import BacktestEngine
from strategies.strategy_v1 import StrategyV1
from strategies.strategy_v2_opt import StrategyV2Opt
from strategies.strategy_v21 import StrategyV21


def run_single_backtest(strategy_name: str, symbol: str = "002202",
                        start_date: str = None, end_date: str = None,
                        months: int = 3, **params):
    """
    运行单个策略的回测

    Args:
        strategy_name: 策略名称 ('v1', 'v2_opt', 'v21')
        symbol: 股票代码
        start_date: 开始日期 (YYYYMMDD)
        end_date: 结束日期 (YYYYMMDD)
        months: 回测月数（当未指定日期时）
        **params: 策略参数

    Returns:
        回测结果字典
    """
    # 创建策略实例
    strategy_map = {
        'v1': StrategyV1,
        'v2_opt': StrategyV2Opt,
        'v2.1': StrategyV21,
        'v21': StrategyV21,
    }

    strategy_class = strategy_map.get(strategy_name.lower())
    if strategy_class is None:
        raise ValueError(f"未知策略: {strategy_name}，可选: {list(strategy_map.keys())}")

    # 初始化策略
    strategy = strategy_class(initial_capital=100000.0)
    strategy.initialize(**params)

    # 创建回测引擎并运行
    engine = BacktestEngine(strategy)
    result = engine.run(symbol, start_date, end_date, months)

    return result


def run_comparison_backtest(symbols: list = None, strategies: list = None,
                            months: int = 3):
    """
    运行对比回测（多个策略对多个股票）

    Args:
        symbols: 股票代码列表
        strategies: 策略名称列表
        months: 回测月数

    Returns:
        对比结果字典
    """
    if symbols is None:
        symbols = ["002202"]

    if strategies is None:
        strategies = ['v1', 'v2_opt', 'v21']

    results = {}

    for symbol in symbols:
        results[symbol] = {}

        for strategy_name in strategies:
            print(f"\n\n{'#'*60}")
            print(f"# 回测: {strategy_name.upper()} - {symbol}")
            print(f"{'#'*60}")

            try:
                result = run_single_backtest(strategy_name, symbol, months=months)
                results[symbol][strategy_name] = result

                # 打印报告
                BacktestEngine.print_report(result)

                # 保存结果
                BacktestEngine.save_results(
                    result,
                    symbol,
                    result.get('start_date', ''),
                    result.get('end_date', '')
                )

            except Exception as e:
                print(f"[ERROR] {strategy_name} - {symbol}: {e}")
                results[symbol][strategy_name] = {'error': str(e)}

    # 打印对比总结
    print_comparison_summary(results)

    return results


def print_comparison_summary(results: dict):
    """打印对比总结"""
    print(f"\n\n{'='*80}")
    print(f"回测对比总结")
    print(f"{'='*80}")

    for symbol, strategy_results in results.items():
        print(f"\n股票: {symbol}")
        print(f"{'策略':<15} {'收益率':>10} {'最终资产':>15} {'胜率':>8} {'最大回撤':>10} {'夏普比率':>10}")
        print("-" * 80)

        for strategy_name, result in strategy_results.items():
            if 'error' in result:
                print(f"{strategy_name:<15} {'ERROR':>10}")
            else:
                print(f"{strategy_name:<15} {result['total_return']:>+9.2f}% "
                      f"{result['final_value']:>14,.2f} "
                      f"{result['win_rate']:>7.2f}% "
                      f"{result['max_drawdown']:>9.2f}% "
                      f"{result['sharpe_ratio']:>9.4f}")

    print(f"{'='*80}\n")


def main():
    """主函数"""
    import argparse

    parser = argparse.ArgumentParser(description='统一回测运行器')
    parser.add_argument('--strategy', '-s', type=str, default='all',
                       help='策略名称 (v1, v2_opt, v21, all)')
    parser.add_argument('--symbol', '-c', type=str, default='002202',
                       help='股票代码')
    parser.add_argument('--months', '-m', type=int, default=3,
                       help='回测月数')
    parser.add_argument('--compare', action='store_true',
                       help='运行对比回测（所有策略）')

    args = parser.parse_args()

    if args.compare:
        # 对比回测模式
        symbols = [args.symbol]
        run_comparison_backtest(symbols=symbols, strategies=['v1', 'v2_opt', 'v21'], months=args.months)
    else:
        # 单策略回测模式
        strategy_name = args.strategy
        if strategy_name == 'all':
            strategies = ['v1', 'v2_opt', 'v21']
            for s in strategies:
                print(f"\n\n{'='*60}")
                print(f"运行回测: {s}")
                print(f"{'='*60}")
                try:
                    result = run_single_backtest(s, args.symbol, months=args.months)
                    BacktestEngine.print_report(result)
                    BacktestEngine.save_results(result, args.symbol, '', '')
                except Exception as e:
                    print(f"[ERROR] {s}: {e}")
        else:
            result = run_single_backtest(strategy_name, args.symbol, months=args.months)
            BacktestEngine.print_report(result)
            BacktestEngine.save_results(result, args.symbol, '', '')


if __name__ == "__main__":
    main()
