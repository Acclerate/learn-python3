# -*- coding: utf-8 -*-
"""
V3资金流向策略
整合资金流向分析，约100行
"""

import pandas as pd
import akshare as ak
from core.base_strategy import BaseStrategy


class V3MoneyFlow(BaseStrategy):
    """
    V3资金流向策略

    买入策略:
    1. MA金叉
    2. MACD金叉
    3. 价格站稳MA20
    4. RSI超卖

    资金流向作为加分项:
    - 资金流入时，买入信号优先级更高
    - 资金流出时，买入信号需要更强的技术面确认

    卖出策略:
    1. MA死叉
    2. 跌破MA20
    3. MACD死叉 + RSI偏高
    4. RSI极度超买
    5. 资金大幅流出(>-15%)
    """

    def __init__(self,
                 initial_capital: float = 100000.0,
                 trailing_stop_pct: float = 0.08,
                 profit_take_pct: float = 0.30):
        super().__init__(initial_capital, trailing_stop_pct, profit_take_pct)
        self.fund_flow_data = None

    def get_fund_flow_data(self, symbol: str, start_date: str, end_date: str):
        """
        获取资金流向数据

        Args:
            symbol: 股票代码
            start_date: 开始日期
            end_date: 结束日期
        """
        print(f"[*] Fetching fund flow data for {symbol}...")

        try:
            # 判断市场
            market = "sh" if symbol.startswith("6") or symbol.startswith("5") else "sz"

            # 获取资金流向数据
            fund_df = ak.stock_individual_fund_flow(stock=symbol, market=market)

            if fund_df is None or fund_df.empty:
                print("    [SKIP] No fund flow data available")
                self.fund_flow_data = None
                return

            # 转换日期格式
            fund_df['日期'] = pd.to_datetime(fund_df['日期'])

            # 过滤日期范围
            start_dt = pd.to_datetime(start_date)
            end_dt = pd.to_datetime(end_date)
            fund_df = fund_df[(fund_df['日期'] >= start_dt) & (fund_df['日期'] <= end_dt)]

            if fund_df.empty:
                print("    [SKIP] No fund flow data in date range")
                self.fund_flow_data = None
                return

            # 计算资金净流入比例
            if '净流入-主力' in fund_df.columns:
                fund_df['net_inflow_ratio'] = fund_df['净流入-主力']

            # 计算资金趋势（3日累计）
            if 'net_inflow_ratio' in fund_df.columns:
                fund_df['fund_trend'] = fund_df['net_inflow_ratio'].rolling(window=3).sum()

            print(f"    [OK] Got {len(fund_df)} fund flow records")
            self.fund_flow_data = fund_df

        except Exception as e:
            print(f"    [SKIP] Fund flow fetch failed: {str(e)[:40]}...")
            self.fund_flow_data = None

    def merge_fund_flow(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        将资金流向数据合并到价格数据

        Args:
            df: 价格数据

        Returns:
            合并后的数据
        """
        if self.fund_flow_data is None or self.fund_flow_data.empty:
            # 添加空列
            df['net_inflow_ratio'] = 0
            df['fund_trend'] = 0
            return df

        # 合并数据
        df_merged = pd.merge(
            df,
            self.fund_flow_data[['日期', 'net_inflow_ratio', 'fund_trend']],
            on='日期',
            how='left'
        )

        # 填充NaN值
        df_merged['net_inflow_ratio'] = df_merged['net_inflow_ratio'].fillna(0)
        df_merged['fund_trend'] = df_merged['fund_trend'].fillna(0)

        return df_merged

    def generate_signals(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        生成V3资金流向交易信号

        Args:
            df: 包含技术指标的数据

        Returns:
            添加了signal列的DataFrame
        """
        df = df.copy()
        df['signal'] = 0
        df['signal_reason'] = ''

        # 获取收盘价列名
        columns = df.columns.tolist()
        close_col = '收盘' if '收盘' in columns else 'Close'

        for i in range(30, len(df)):
            current = df.iloc[i]
            prev = df.iloc[i - 1]

            signals_buy = []
            signals_sell = []

            # 获取资金流向状态
            fund_trend = current.get('fund_trend', 0)
            net_ratio = current.get('net_inflow_ratio', 0)

            # 资金状态描述
            fund_status = ""
            if net_ratio > 5:
                fund_status = f"[资金大流入+{net_ratio:.0f}%]"
            elif net_ratio > 0:
                fund_status = "[资金流入+]"
            elif net_ratio < -10:
                fund_status = f"[资金大流出{net_ratio:.0f}%]"
            elif net_ratio < 0:
                fund_status = "[资金流出-]"

            # === 买入信号 ===
            # 1. MA金叉
            if prev['MA5'] <= prev['MA10'] and current['MA5'] > current['MA10']:
                signals_buy.append(f"MA金叉{fund_status}")

            # 2. MACD金叉
            if (prev['MACD'] <= prev['MACD_SIGNAL'] and
                current['MACD'] > current['MACD_SIGNAL']):
                # 资金流出时需要RSI确认
                if fund_trend < 0:
                    if current['RSI'] < 50:
                        signals_buy.append(f"MACD金叉{fund_status}")
                else:
                    signals_buy.append(f"MACD金叉{fund_status}")

            # 3. 价格站稳MA20
            if (current[close_col] > current['MA20'] and
                current['MA5'] > current['MA20']):
                # 检查是否刚突破
                if prev[close_col] <= prev['MA20']:
                    signals_buy.append(f"突破MA20{fund_status}")
                else:
                    # 已站稳，结合资金趋势
                    if fund_trend >= 0:
                        signals_buy.append(f"站稳MA20{fund_status}")

            # 4. RSI超卖
            if current['RSI'] < 35:
                signals_buy.append(f"RSI超卖({current['RSI']:.1f}){fund_status}")

            # === 卖出信号 ===
            # 1. MA死叉
            if prev['MA5'] >= prev['MA10'] and current['MA5'] < current['MA10']:
                signals_sell.append(f"MA死叉{fund_status}")

            # 2. 跌破MA20
            if current[close_col] < current['MA20']:
                if fund_trend <= 0 or current['RSI'] > 50:
                    signals_sell.append(f"跌破MA20{fund_status}")

            # 3. MACD死叉 + RSI偏高
            if (prev['MACD'] >= prev['MACD_SIGNAL'] and
                current['MACD'] < current['MACD_SIGNAL'] and
                current['RSI'] > 55):
                signals_sell.append(f"MACD死叉RSI({current['RSI']:.1f}){fund_status}")

            # 4. RSI极度超买
            if current['RSI'] > 80:
                signals_sell.append(f"RSI超买({current['RSI']:.1f}){fund_status}")

            # 5. 资金大幅流出（单日<-15%）- 强制卖出
            if net_ratio < -15:
                signals_sell.append(f"资金恐慌流出({net_ratio:.0f}%)")

            # 综合判断
            buy_score = len(signals_buy)
            sell_score = len(signals_sell)

            # 买入：至少1个信号且无强卖出信号
            if buy_score >= 1 and sell_score == 0:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)
            # 卖出：至少1个信号且无买入信号
            elif sell_score >= 1 and buy_score == 0:
                df.loc[i, 'signal'] = -1
                df.loc[i, 'signal_reason'] = ','.join(signals_sell)
            # 多个买入信号覆盖单个卖出
            elif buy_score >= 2:
                df.loc[i, 'signal'] = 1
                df.loc[i, 'signal_reason'] = ','.join(signals_buy)

        return df

    def run_backtest(self, symbol: str, start_date: str, end_date: str):
        """
        运行回测 - 重写以包含资金流向数据

        Args:
            symbol: 股票代码
            start_date: 开始日期
            end_date: 结束日期

        Returns:
            回测结果字典
        """
        # 1. 获取价格数据
        df = self.get_historical_data(symbol, start_date, end_date)

        # 2. 获取资金流向数据
        self.get_fund_flow_data(symbol, start_date, end_date)

        # 3. 合并数据
        df = self.merge_fund_flow(df)

        # 4. 计算技术指标
        df = self.prepare_data(df)

        # 5. 生成交易信号
        df = self.generate_signals(df)

        # 6. 执行回测
        result = self.run(df)

        return result

    def get_strategy_name(self) -> str:
        """返回策略名称"""
        return "V3资金流向策略"
