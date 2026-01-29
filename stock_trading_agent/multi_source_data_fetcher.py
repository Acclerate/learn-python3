# -*- coding: utf-8 -*-
"""
多数据源股票行情获取器 V1.0
解决IP限流问题，支持多个数据源自动切换

数据源列表：
1. akshare - 东方财富（主源，高频限制）
2. tushare - 腾讯/新浪（备用，限流较松）
3. baostock - 百度金融（备用，稳定性好）
4. yfinance - Yahoo Finance（国外源，无限制）
"""

import os
import time
import random
import pandas as pd
from datetime import datetime
from typing import Optional, Dict, List
import logging

# 配置日志
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# 禁用代理
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''


class MultiSourceDataFetcher:
    """多数据源行情获取器"""

    def __init__(self):
        self.current_source = None
        self.source_stats = {}  # 记录每个数据源的成功/失败次数
        self.last_request_time = {}  # 记录每个数据源的最后请求时间
        self.min_request_interval = {}  # 每个数据源的最小请求间隔

        # 初始化数据源配置
        self.sources = {
            'akshare_em': {
                'name': '东方财富(akshare)',
                'priority': 1,
                'min_interval': 5,  # 最小5秒请求间隔
                'weight': 0.4,  # 权重（优先使用）
            },
            'baostock': {
                'name': '百度金融',
                'priority': 2,
                'min_interval': 2,  # 百度金融限流较松
                'weight': 0.3,
            },
            'tushare_sina': {
                'name': '新浪财经(Tushare)',
                'priority': 3,
                'min_interval': 3,
                'weight': 0.2,
            },
            'yfinance': {
                'name': 'Yahoo Finance',
                'priority': 4,
                'min_interval': 1,  # 国外源无限制
                'weight': 0.1,
            },
        }

        # 初始化统计
        for source_id in self.sources:
            self.source_stats[source_id] = {'success': 0, 'fail': 0, 'last_status': None}
            self.last_request_time[source_id] = 0
            self.min_request_interval[source_id] = self.sources[source_id]['min_interval']

        # 冷却中的数据源
        self.cooled_sources = set()

    def _check_rate_limit(self, source_id: str) -> bool:
        """检查是否触发改数据源的限流"""
        current_time = time.time()
        last_time = self.last_request_time.get(source_id, 0)
        min_interval = self.min_request_interval.get(source_id, 1)

        if current_time - last_time < min_interval:
            wait_time = min_interval - (current_time - last_time)
            logger.debug(f"数据源 {source_id} 限流中，等待 {wait_time:.1f} 秒")
            time.sleep(wait_time)

        return True

    def _update_source_stats(self, source_id: str, success: bool):
        """更新数据源统计"""
        if source_id in self.source_stats:
            if success:
                self.source_stats[source_id]['success'] += 1
                self.source_stats[source_id]['last_status'] = 'success'
                # 移除冷却
                if source_id in self.cooled_sources:
                    self.cooled_sources.discard(source_id)
            else:
                self.source_stats[source_id]['fail'] += 1
                self.source_stats[source_id]['last_status'] = 'fail'

            # 连续失败3次则进入冷却
            if self.source_stats[source_id]['fail'] >= 3:
                self.cooled_sources.add(source_id)
                logger.warning(f"数据源 {source_id} 连续失败3次，进入冷却状态")

        self.last_request_time[source_id] = time.time()

    def get_available_sources(self) -> List[str]:
        """获取可用的数据源列表（按优先级排序）"""
        available = []

        for source_id in sorted(self.sources.keys(), key=lambda x: self.sources[x]['priority']):
            if source_id in self.cooled_sources:
                continue
            available.append(source_id)

        return available

    def get_best_source(self) -> Optional[str]:
        """获取最佳数据源（考虑权重和成功率）"""
        available = self.get_available_sources()
        if not available:
            logger.warning("所有数据源都在冷却中，强制使用主数据源")
            return 'akshare_em'

        # 计算加权得分
        scores = {}
        for source_id in available:
            stats = self.source_stats[source_id]
            total = stats['success'] + stats['fail']

            if total == 0:
                # 初次使用，使用权重
                score = self.sources[source_id]['weight'] * 100
            else:
                # 成功率
                success_rate = stats['success'] / total
                # 基础权重
                base_score = self.sources[source_id]['weight'] * 100
                # 综合得分
                score = base_score * (0.5 + 0.5 * success_rate)

            scores[source_id] = score

        # 返回得分最高的数据源
        best_source = max(scores.keys(), key=lambda x: scores[x])
        logger.info(f"选择最佳数据源: {self.sources[best_source]['name']} (得分: {scores[best_source]:.1f})")

        return best_source

    def fetch_stock_data(self, symbol: str, period: str = "daily",
                         start_date: Optional[str] = None,
                         end_date: Optional[str] = None,
                         max_retries: int = 3) -> Optional[pd.DataFrame]:
        """
        获取股票数据（多数据源自动切换）

        Args:
            symbol: 股票代码
            period: 数据周期 ('daily', 'minute')
            start_date: 开始日期
            end_date: 结束日期
            max_retries: 最大重试次数

        Returns:
            DataFrame or None
        """
        symbol = str(symbol).zfill(6)  # 补全6位代码

        # 尝试所有数据源
        tried_sources = []

        for attempt in range(max_retries):
            # 获取最佳可用数据源
            source_id = self.get_best_source()

            if source_id in tried_sources:
                # 所有可用数据源都已尝试，强制尝试冷却中的数据源
                logger.warning("所有可用数据源都已尝试，尝试冷却中的数据源...")
                available = list(self.sources.keys())
                for s in available:
                    if s not in tried_sources:
                        source_id = s
                        break
                else:
                    # 等待一段时间后重试
                    wait_time = 60 * (attempt + 1)
                    logger.info(f"等待 {wait_time} 秒后重试...")
                    time.sleep(wait_time)
                    tried_sources = []
                    continue

            tried_sources.append(source_id)

            # 检查限流
            self._check_rate_limit(source_id)

            logger.info(f"尝试数据源: {self.sources[source_id]['name']} (第{attempt+1}次尝试)")

            # 根据数据源调用对应的获取方法
            fetchers = {
                'akshare_em': self._fetch_akshare,
                'baostock': self._fetch_baostock,
                'tushare_sina': self._fetch_tushare_sina,
                'yfinance': self._fetch_yfinance,
            }

            fetcher = fetchers.get(source_id)
            if fetcher:
                try:
                    df = fetcher(symbol, period, start_date, end_date)

                    if df is not None and not df.empty:
                        self._update_source_stats(source_id, True)
                        logger.info(f"✓ 成功从 {self.sources[source_id]['name']} 获取数据 ({len(df)} 条)")
                        self.current_source = source_id
                        return df
                    else:
                        self._update_source_stats(source_id, False)

                except Exception as e:
                    logger.error(f"数据源 {source_id} 获取失败: {str(e)[:50]}...")
                    self._update_source_stats(source_id, False)

            # 失败后等待一段时间再试
            wait_time = random.uniform(2, 5) * (attempt + 1)
            logger.info(f"等待 {wait_time:.1f} 秒后尝试其他数据源...")
            time.sleep(wait_time)

        logger.error(f"所有数据源均失败，股票代码: {symbol}")
        return None

    def _fetch_akshare(self, symbol: str, period: str,
                       start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """使用akshare获取数据"""
        try:
            import akshare as ak

            if period == "minute":
                # 分钟级数据
                df = ak.stock_zh_a_hist_min_em(
                    symbol=symbol,
                    period="1",
                    adjust="qfq"
                )
            else:
                # 日线数据
                if start_date and end_date:
                    df = ak.stock_zh_a_hist(
                        symbol=symbol,
                        period="daily",
                        start_date=start_date,
                        end_date=end_date,
                        adjust="qfq"
                    )
                else:
                    df = ak.stock_zh_a_hist(
                        symbol=symbol,
                        period="daily",
                        adjust="qfq"
                    )

            if df is not None and not df.empty:
                # 标准化列名
                df = self._standardize_columns(df)
                return df.tail(100)

        except Exception as e:
            logger.debug(f"akshare获取失败: {e}")
            raise e

        return None

    def _fetch_baostock(self, symbol: str, period: str,
                        start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """使用百度金融获取数据"""
        try:
            import baostock as bs

            # 登录
            lg = bs.login()
            if lg.error_code != '0':
                raise Exception(f"百度金融登录失败: {lg.error_msg}")

            # 转换日期格式
            if start_date:
                start = f"{start_date[:4]}-{start_date[4:6]}-{start_date[6:8]}"
            else:
                start = '2020-01-01'

            if end_date:
                end = f"{end_date[:4]}-{end_date[4:6]}-{end_date[6:8]}"
            else:
                end = datetime.now().strftime('%Y-%m-%d')

            # 获取数据
            rs = bs.query_history_k_data_plus(
                f"sh.{symbol}" if symbol.startswith('6') else f"sz.{symbol}",
                "date,code,open,high,low,close,volume,amount",
                start_date=start,
                end_date=end,
                frequency=period if period == "daily" else "5",  # 百度不支持1分钟，使用5分钟
                adjustflag="3"  # 前复权
            )

            data_list = []
            while (rs.error_code == '0') and rs.next():
                data_list.append(rs.get_row_data())

            # 登出
            bs.logout()

            if data_list:
                df = pd.DataFrame(data_list, columns=rs.fields)
                df = self._standardize_baostock(df)
                return df

        except ImportError:
            logger.warning("baostock未安装，请运行: pip install baostock")
        except Exception as e:
            logger.debug(f"百度金融获取失败: {e}")
            raise e

        return None

    def _fetch_tushare_sina(self, symbol: str, period: str,
                            start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """使用Tushare新浪接口获取数据"""
        try:
            import tushare as ts

            # 设置token（需要用户自己配置）
            # ts.set_token('your_token_here')

            if period == "minute":
                # 分钟数据
                df = ts.get_k_data(symbol, start=start_date[:4]+'-'+start_date[4:6]+'-'+start_date[6:8] if start_date else None,
                                   end=end_date[:4]+'-'+end_date[4:6]+'-'+end_date[6:8] if end_date else None,
                                   ktype='1')
            else:
                # 日线数据
                df = ts.get_k_data(symbol, start=start_date[:4]+'-'+start_date[4:6]+'-'+start_date[6:8] if start_date else None,
                                   end=end_date[:4]+'-'+end_date[4:6]+'-'+end_date[6:8] if end_date else None,
                                   ktype='D')

            if df is not None and not df.empty:
                df = self._standardize_tushare(df)
                return df

        except ImportError:
            logger.warning("tushare未安装，请运行: pip install tushare")
        except Exception as e:
            logger.debug(f"Tushare获取失败: {e}")
            raise e

        return None

    def _fetch_yfinance(self, symbol: str, period: str,
                        start_date: Optional[str], end_date: Optional[str]) -> Optional[pd.DataFrame]:
        """使用Yahoo Finance获取数据"""
        try:
            import yfinance as yf

            # 转换代码格式
            ticker = f"{symbol}.SZ" if not symbol.startswith('6') else f"{symbol}.SS"

            # 创建Ticker对象
            stock = yf.Ticker(ticker)

            # 获取历史数据
            if start_date and end_date:
                df = stock.history(start=start_date[:4]+'-'+start_date[4:6]+'-'+start_date[6:8],
                                   end=end_date[:4]+'-'+end_date[4:6]+'-'+end_date[6:8])
            else:
                df = stock.history(period="3mo")  # 默认3个月

            if df is not None and not df.empty:
                df = self._standardize_yfinance(df)
                return df

        except ImportError:
            logger.warning("yfinance未安装，请运行: pip install yfinance")
        except Exception as e:
            logger.debug(f"Yahoo Finance获取失败: {e}")
            raise e

        return None

    def _standardize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        """标准化列名"""
        # 列名映射
        column_mapping = {
            '日期': 'date',
            '开盘': 'open',
            '最高': 'high',
            '最低': 'low',
            '收盘': 'close',
            '成交量': 'volume',
            '成交额': 'amount',
            '振幅': 'amplitude',
            '涨跌幅': 'change_pct',
            '涨跌额': 'change',
        }

        df = df.rename(columns=column_mapping)
        return df

    def _standardize_baostock(self, df: pd.DataFrame) -> pd.DataFrame:
        """标准化百度金融数据"""
        df = df.rename(columns={
            'date': 'date',
            'code': 'code',
            'open': 'open',
            'high': 'high',
            'low': 'low',
            'close': 'close',
            'volume': 'volume',
            'amount': 'amount'
        })

        # 转换数据类型
        for col in ['open', 'high', 'low', 'close', 'volume', 'amount']:
            if col in df.columns:
                df[col] = pd.to_numeric(df[col], errors='coerce')

        return df

    def _standardize_tushare(self, df: pd.DataFrame) -> pd.DataFrame:
        """标准化Tushare数据"""
        df = df.rename(columns={
            'date': 'date',
            'open': 'open',
            'close': 'close',
            'high': 'high',
            'low': 'low',
            'volume': 'volume'
        })

        return df

    def _standardize_yfinance(self, df: pd.DataFrame) -> pd.DataFrame:
        """标准化Yahoo Finance数据"""
        df = df.reset_index()
        df['date'] = df['Date'].dt.strftime('%Y-%m-%d')

        df = df.rename(columns={
            'Open': 'open',
            'High': 'high',
            'Low': 'low',
            'Close': 'close',
            'Volume': 'volume',
            'Dividends': 'dividends',
            'Stock Splits': 'splits'
        })

        return df

    def get_current_price(self, symbol: str) -> Optional[float]:
        """获取当前价格（使用最简单的接口）"""
        try:
            import akshare as ak

            df = ak.stock_zh_a_spot_em()
            stock_data = df[df['代码'] == symbol]

            if not stock_data.empty:
                return float(stock_data.iloc[0]['最新价'])

        except Exception as e:
            logger.warning(f"获取当前价格失败: {e}")

        return None

    def print_source_stats(self):
        """打印数据源统计信息"""
        print("\n" + "="*60)
        print("数据源使用统计")
        print("="*60)

        for source_id, stats in self.source_stats.items():
            total = stats['success'] + stats['fail']
            success_rate = (stats['success'] / total * 100) if total > 0 else 0
            status = "冷却中" if source_id in self.cooled_sources else "正常"

            print(f"\n{self.sources[source_id]['name']}:")
            print(f"  状态: {status}")
            print(f"  成功: {stats['success']} 次")
            print(f"  失败: {stats['fail']} 次")
            print(f"  成功率: {success_rate:.1f}%")
            print(f"  最小间隔: {self.min_request_interval[source_id]} 秒")

        print("\n" + "="*60)


def demo():
    """演示多数据源获取"""
    fetcher = MultiSourceDataFetcher()

    # 测试获取日线数据
    print("\n" + "="*60)
    print("测试多数据源获取")
    print("="*60)

    symbol = "002202"

    print(f"\n获取股票 {symbol} 的日线数据...")
    df = fetcher.fetch_stock_data(symbol, period="daily")

    if df is not None and not df.empty:
        print(f"\n✓ 成功获取 {len(df)} 条数据")
        print(f"数据源: {fetcher.sources[fetcher.current_source]['name']}")
        print(f"\n最新5条数据:")
        print(df.tail(5).to_string())
    else:
        print("\n✗ 获取数据失败")

    # 打印统计
    fetcher.print_source_stats()


if __name__ == "__main__":
    demo()
