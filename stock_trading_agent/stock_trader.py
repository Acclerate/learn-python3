import os
import datetime
import json
import time
import pandas as pd
import akshare as ak
from openai import OpenAI

# 禁用代理，避免连接问题
os.environ['HTTP_PROXY'] = ''
os.environ['HTTPS_PROXY'] = ''
os.environ['http_proxy'] = ''
os.environ['https_proxy'] = ''

# ================= 配置区域 =================
# 从系统环境变量获取 API Key
# 你的环境变量名必须是: SiliconFlow_API_KEY
# Windows: set SiliconFlow_API_KEY=sk-xxxxx
# Linux/Mac: export SiliconFlow_API_KEY=sk-xxxxx
API_KEY = os.getenv("SiliconFlow_API_KEY")

if not API_KEY:
    raise ValueError("❌ 错误: 未找到环境变量 SiliconFlow_API_KEY\n"
                     "请先设置环境变量，例如:\n"
                     "  Windows: set SiliconFlow_API_KEY=sk-xxxxx\n"
                     "  Linux/Mac: export SiliconFlow_API_KEY=sk-xxxxx")

BASE_URL = "https://api.siliconflow.cn/v1"
MODEL_NAME = "deepseek-ai/DeepSeek-V3.2"  # 确保模型名称与平台一致


class StockTradingAgent:
    def __init__(self, api_key, base_url, model_name):
        self.client = OpenAI(api_key=api_key, base_url=base_url)
        self.model_name = model_name

    def calculate_indicators(self, df):
        """简单计算技术指标 (RSI, MA) 辅助LLM判断"""
        if df is None or len(df) < 15:
            return df

        # 兼容不同的列名格式（中文或英文）
        columns = df.columns.tolist()
        if 'close' in columns:
            close_col = 'close'
        elif '收盘' in columns:
            close_col = '收盘'
        elif 'Close' in columns:
            close_col = 'Close'
        else:
            print(f"  ⚠️ 未找到收盘价列，当前列: {columns}")
            return df

        # 计算 MA (移动平均线)
        df['MA5'] = df[close_col].rolling(window=5).mean()
        df['MA10'] = df[close_col].rolling(window=10).mean()

        # 计算 RSI (相对强弱指标) - 简化版 14周期
        delta = df[close_col].diff()
        gain = (delta.where(delta > 0, 0)).rolling(window=14).mean()
        loss = (-delta.where(delta < 0, 0)).rolling(window=14).mean()
        rs = gain / loss
        df['RSI'] = 100 - (100 / (1 + rs))

        return df

    def _retry_request(self, func, max_retries=3, delay=1):
        """重试装饰器"""
        for attempt in range(max_retries):
            try:
                return func()
            except Exception as e:
                if attempt < max_retries - 1:
                    print(f"  ⚠️ 连接失败，{delay}秒后重试... (尝试 {attempt + 1}/{max_retries})")
                    time.sleep(delay)
                else:
                    raise e
        return None

    def get_market_data(self, symbol, minute_period='15'):
        """获取全维度市场数据"""
        print(f"[*] Fetching data for {symbol}...")
        data_summary = {}

        try:
            # 1. 先获取日线数据 (更稳定，包含基本信息)
            print("  [1/3] Fetching daily data...")
            def get_daily_data():
                return ak.stock_zh_a_hist(symbol=symbol, period="daily", adjust="qfq")

            daily_df = self._retry_request(get_daily_data, max_retries=5, delay=2)
            if daily_df is None or daily_df.empty:
                return None, f"Cannot get data for stock {symbol}"

            # 从日线数据提取基本信息
            latest = daily_df.iloc[-1]
            previous = daily_df.iloc[-2] if len(daily_df) > 1 else latest

            # 适配不同的列名格式
            columns = daily_df.columns.tolist()
            if '收盘' in columns:
                close_col = '收盘'
                date_col = '日期'
                name = f"Stock_{symbol}"  # 从日线无法获取名称，使用默认
            elif 'Close' in columns:
                close_col = 'Close'
                date_col = 'Date'
                name = f"Stock_{symbol}"
            else:
                close_col = columns[2]  # 通常第三列是收盘价
                date_col = columns[0]
                name = f"Stock_{symbol}"

            current_price = float(latest[close_col])
            prev_price = float(previous[close_col])
            change_percent = round((current_price - prev_price) / prev_price * 100, 2)

            data_summary['name'] = name
            data_summary['current_price'] = current_price
            data_summary['change_percent'] = change_percent

            print(f"  [OK] {name} - Price: {current_price}, Change: {change_percent}%")

            # 计算技术指标
            daily_df = self.calculate_indicators(daily_df)
            # 适配列名后提取数据
            daily_df_renamed = daily_df.copy()
            if close_col != '收盘':
                daily_df_renamed = daily_df.rename(columns={close_col: '收盘', date_col: '日期'})

            # 转换日期为字符串，避免 JSON 序列化错误
            daily_df_renamed['日期'] = daily_df_renamed['日期'].astype(str)

            # 将 NaN 值替换为 None（更友好的 JSON 表示）
            daily_df_renamed = daily_df_renamed.fillna(value='')

            data_summary['daily_data'] = daily_df_renamed.tail(5)[['日期', '收盘', 'MA5', 'MA10']].to_dict(orient='records')

            time.sleep(1)  # 增加延迟

            # 2. 尝试获取分钟级数据 (非关键)
            print("  [2/3] Fetching minute data (optional)...")
            try:
                def get_minute_data():
                    return ak.stock_zh_a_hist_min_em(symbol=symbol, period=minute_period, adjust='qfq')

                min_df = self._retry_request(get_minute_data, max_retries=2, delay=1)
                if min_df is not None and not min_df.empty:
                    min_df = self.calculate_indicators(min_df)
                    # 统一列名格式
                    min_columns = min_df.columns.tolist()
                    if '时间' in min_columns:
                        if 'open' in min_columns:
                            pass  # 已经是小写
                        else:
                            min_df = min_df.rename(columns={'Open': 'open', 'Close': 'close', 'High': 'high', 'Low': 'low'})
                    else:
                        min_df = min_df.rename(columns={'时间': 'Time'})
                        if 'Open' in min_columns:
                            min_df = min_df.rename(columns={'Open': 'open', 'Close': 'close', 'High': 'high', 'Low': 'low'})

                    # 转换时间为字符串
                    time_col = '时间' if '时间' in min_df.columns else 'Time'
                    min_df[time_col] = min_df[time_col].astype(str)
                    min_df = min_df.fillna(value='')

                    # 确保有 '时间' 列
                    if time_col != '时间':
                        min_df['时间'] = min_df[time_col]

                    data_summary['minute_data'] = min_df.tail(5)[['时间', 'open', 'close', 'high', 'low', 'MA5', 'RSI']].to_dict(orient='records')
                    print("  [OK] Minute data fetched")
                else:
                    data_summary['minute_data'] = []
                    print("  [SKIP] Minute data unavailable")
            except Exception as e:
                print(f"  [SKIP] Minute data failed: {str(e)[:40]}...")
                data_summary['minute_data'] = []

            time.sleep(1)

            # 3. 尝试获取资金流向 (非关键)
            print("  [3/3] Fetching fund flow (optional)...")
            try:
                def get_fund_data():
                    market = "sh" if symbol.startswith("6") or symbol.startswith("5") else "sz"
                    return ak.stock_individual_fund_flow(stock=symbol, market=market)

                fund_df = self._retry_request(get_fund_data, max_retries=2, delay=1)
                if fund_df is not None and not fund_df.empty:
                    # 转换日期列为字符串
                    for col in fund_df.columns:
                        if fund_df[col].dtype == 'object':
                            try:
                                fund_df[col] = fund_df[col].astype(str)
                            except:
                                pass
                    fund_df = fund_df.fillna(value='')
                    data_summary['fund_flow'] = fund_df.tail(3).to_dict(orient='records')
                    print("  [OK] Fund flow data fetched")
                else:
                    data_summary['fund_flow'] = "No data"
                    print("  [SKIP] Fund flow unavailable")
            except Exception as e:
                print(f"  [SKIP] Fund flow failed")
                data_summary['fund_flow'] = "No data"

            return data_summary, None

        except Exception as e:
            import traceback
            error_detail = traceback.format_exc()
            return None, f"Data fetch failed: {str(e)}\n{error_detail[:200]}"

    def analyze_with_llm(self, data_context, strategy="激进型"):
        """调用 DeepSeek 进行分析"""
        print("🤖 正在调用 DeepSeek 进行策略分析...")

        system_prompt = f"""
### 角色定义
你是一位拥有 20 年实战经验的量化交易员，操作风格果断、理性。你的任务是根据传入的实时数据，判断当前股票的买卖时机。

### 你的策略偏好
{strategy}

### 决策逻辑 (Chain of Thought)
请按以下步骤思考：
1. **趋势判定**：日线均线系统是否多头排列？
2. **信号确认**：结合分钟级RSI(>80超买, <20超卖)和价格走势判断。
3. **资金验证**：查看近期主力资金流向是否配合。

### 输出格式 (Markdown)
## 🚦 交易指令：[买入 / 卖出 / 观望]
**置信度**：⭐⭐⭐⭐ (1-5星)

### 📊 核心理由
* **技术面**：[简述分钟级和日线形态]
* **资金面**：[简述资金流向]

### 🎯 操作建议
* **建议入场/出场价格**：[基于最新价 {data_context.get('current_price')} 浮动]
* **止损位**：
* **止盈位**：

### ⚠️ 风险提示
[最大风险点]
"""

        user_prompt = f"""
数据时间: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
股票名称: {data_context.get('name')}
最新价格: {data_context.get('current_price')} (涨跌幅: {data_context.get('change_percent')}%)

【分钟级数据 (最近5个周期)】:
{json.dumps(data_context.get('minute_data'), ensure_ascii=False, indent=2)}

【日线趋势 (最近5日)】:
{json.dumps(data_context.get('daily_data'), ensure_ascii=False, indent=2)}

【资金流向】:
{json.dumps(data_context.get('fund_flow'), ensure_ascii=False, indent=2)}
"""

        try:
            response = self.client.chat.completions.create(
                model=self.model_name,
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt}
                ],
                temperature=0.1, # 低温度以保证理性
                max_tokens=1024
            )
            return response.choices[0].message.content
        except Exception as e:
            return f"AI 分析请求失败: {str(e)}"


# ================= 主程序入口 =================
if __name__ == "__main__":
    import sys
    import io
    # 设置 UTF-8 编码输出
    if sys.platform == 'win32':
        sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')
        sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8', errors='replace')

    # 调试模式：默认股票代码
    DEBUG_MODE = False  # 设为 False 恢复手动输入
    DEFAULT_SYMBOL = "002202"
    DEFAULT_STRATEGY = "激进型"

    # 实例化 Agent
    agent = StockTradingAgent(
        api_key=API_KEY,
        base_url=BASE_URL,
        model_name=MODEL_NAME
    )

    # 用户输入
    if DEBUG_MODE:
        symbol = DEFAULT_SYMBOL
        strategy = DEFAULT_STRATEGY
        print(f"[DEBUG] Stock: {symbol}, Strategy: {strategy}")
    else:
        symbol = input("请输入股票代码 (例如 600519): ").strip()
        strategy = input("请输入策略偏好 (默认: 激进型): ").strip() or "激进型"

    # 1. 获取数据
    data, error = agent.get_market_data(symbol)

    if error:
        print(f"❌ 错误: {error}")
    else:
        print(f"✅ 成功获取 {data['name']} 数据，当前价: {data['current_price']}")

        # 2. AI 分析
        analysis_result = agent.analyze_with_llm(data, strategy)

        # 3. 输出结果
        print("\n" + "="*30 + " 分析报告 " + "="*30)
        print(analysis_result)
        print("="*70)
