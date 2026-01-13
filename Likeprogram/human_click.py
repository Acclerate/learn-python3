"""
Human-like Mouse Click Simulator
模拟人类鼠标点击行为的程序
"""

import pyautogui
import random
import time
from typing import Callable, Optional
from dataclasses import dataclass


@dataclass
class ClickConfig:
    """点击配置"""
    min_interval: float = 0.5
    max_interval: float = 1.5
    min_x_offset: float = -10.0
    max_x_offset: float = 10.0
    min_y_offset: float = -8.0
    max_y_offset: float = 8.0
    click_duration: float = 0.15
    random_seed: Optional[int] = None


class HumanLikeMouseClicker:
    """模拟人类鼠标点击的类"""

    def __init__(self, config: Optional[ClickConfig] = None):
        self.config = config or ClickConfig()
        if self.config.random_seed is not None:
            random.seed(self.config.random_seed)

        pyautogui.FAILSAFE = True
        pyautogui.PAUSE = 0

    def _get_random_interval(self) -> float:
        """生成随机点击间隔"""
        return random.uniform(self.config.min_interval, self.config.max_interval)

    def _get_random_offset(self) -> tuple[float, float]:
        """生成随机位置偏移"""
        x_offset = random.uniform(self.config.min_x_offset, self.config.max_x_offset)
        y_offset = random.uniform(self.config.min_y_offset, self.config.max_y_offset)
        return x_offset, y_offset

    def _get_click_duration(self) -> float:
        """生成点击持续时间"""
        base_duration = self.config.click_duration
        variation = random.uniform(-0.02, 0.02)
        return max(0.02, base_duration + variation)

    def click(self, x: int, y: int, button: str = 'left', times: int = 1):
        """
        在指定位置进行模拟人类点击

        Args:
            x: X坐标
            y: Y坐标
            button: 鼠标按钮 ('left', 'right', 'middle')
            times: 点击次数
        """
        for _ in range(times):
            offset_x, offset_y = self._get_random_offset()
            actual_x = int(x + offset_x)
            actual_y = int(y + offset_y)

            pyautogui.moveTo(actual_x, actual_y, duration=self._get_click_duration())

            time.sleep(self._get_random_interval() * 0.3)

            pyautogui.click(x=actual_x, y=actual_y, button=button, interval=self._get_random_interval())

            time.sleep(self._get_random_interval())

    def double_click(self, x: int, y: int):
        """双击指定位置"""
        self.click(x, y, times=2)

    def triple_click(self, x: int, y: int):
        """三连击：快速连续的三次点击"""
        offset_x, offset_y = self._get_random_offset()
        actual_x = int(x + offset_x)
        actual_y = int(y + offset_y)

        pyautogui.moveTo(actual_x, actual_y, duration=self._get_click_duration())

        for _ in range(3):
            pyautogui.click(x=actual_x, y=actual_y, interval=random.uniform(0.08, 0.15))

    def click_with_callback(self, x: int, y: int, callback: Callable, button: str = 'left'):
        """点击并执行回调函数"""
        self.click(x, y, button)
        callback()

    def random_click_in_area(self, x1: int, y1: int, x2: int, y2: int,
                            button: str = 'left') -> tuple[int, int]:
        """
        在指定区域内随机点击

        Args:
            x1, y1: 区域左上角坐标
            x2, y2: 区域右下角坐标

        Returns:
            点击的坐标 (x, y)
        """
        x = random.randint(min(x1, x2), max(x1, x2))
        y = random.randint(min(y1, y2), max(y1, y2))

        self.click(x, y, button)
        return x, y

    def scroll(self, clicks: int, x: Optional[int] = None, y: Optional[int] = None):
        """
        滚动鼠标滚轮

        Args:
            clicks: 滚动次数 (正数向上，负数向下)
            x: X坐标 (可选)
            y: Y坐标 (可选)
        """
        if x is None or y is None:
            current_x, current_y = pyautogui.position()
            x = x or current_x
            y = y or current_y

        pyautogui.scroll(clicks, x=x, y=y)

    def drag_to(self, x: int, y: int, button: str = 'left'):
        """
        拖拽到指定位置

        Args:
            x: 目标X坐标
            y: 目标Y坐标
            button: 鼠标按钮
        """
        duration = random.uniform(0.2, 0.5)
        pyautogui.dragTo(x, y, duration=duration, button=button)

    def get_current_position(self) -> tuple[int, int]:
        """获取当前鼠标位置"""
        return pyautogui.position()


def create_clicker(config: Optional[ClickConfig] = None) -> HumanLikeMouseClicker:
    """创建点击器实例的工厂函数"""
    return HumanLikeMouseClicker(config)


def interactive_mode():
    """交互模式"""
    print("=" * 60)
    print("人类鼠标点击模拟器 - 交互模式")
    print("=" * 60)
    print("指令说明:")
    print("  click x y [button]   - 点击指定位置")
    print("  double x y           - 双击指定位置")
    print("  area x1 y1 x2 y2     - 在区域内随机点击")
    print("  scroll n             - 滚动n次")
    print("  pos                  - 显示当前位置")
    print("  quit                 - 退出")
    print("  help                 - 显示帮助")
    print("=" * 60)

    clicker = create_clicker()

    while True:
        try:
            command = input("\n请输入指令: ").strip().lower()

            if not command:
                continue

            parts = command.split()

            if parts[0] == 'quit' or parts[0] == 'exit':
                print("程序退出")
                break

            elif parts[0] == 'help':
                print("\n指令说明:")
                print("  click x y [button]   - 点击指定位置 (button: left/right/middle)")
                print("  double x y           - 双击指定位置")
                print("  area x1 y1 x2 y2     - 在区域内随机点击")
                print("  scroll n             - 滚动n次 (正数向上，负数向下)")
                print("  pos                  - 显示当前位置")
                print("  quit                 - 退出程序")

            elif parts[0] == 'click':
                if len(parts) < 3:
                    print("用法: click x y [button]")
                    continue

                x, y = int(parts[1]), int(parts[2])
                button = parts[3] if len(parts) > 3 else 'left'

                clicker.click(x, y, button)
                print(f"已在 ({x}, {y}) 点击 {button} 键")

            elif parts[0] == 'double':
                if len(parts) < 3:
                    print("用法: double x y")
                    continue

                x, y = int(parts[1]), int(parts[2])
                clicker.double_click(x, y)
                print(f"已在 ({x}, {y}) 双击")

            elif parts[0] == 'area':
                if len(parts) < 5:
                    print("用法: area x1 y1 x2 y2")
                    continue

                x1, y1, x2, y2 = int(parts[1]), int(parts[2]), int(parts[3]), int(parts[4])
                actual_x, actual_y = clicker.random_click_in_area(x1, y1, x2, y2)
                print(f"已在区域 ({x1}, {y1}) - ({x2}, {y2}) 的 ({actual_x}, {actual_y}) 点击")

            elif parts[0] == 'scroll':
                if len(parts) < 2:
                    print("用法: scroll n")
                    continue

                clicks = int(parts[1])
                clicker.scroll(clicks)
                print(f"已滚动 {clicks} 次")

            elif parts[0] == 'pos':
                x, y = clicker.get_current_position()
                print(f"当前鼠标位置: ({x}, {y})")

            else:
                print(f"未知指令: {parts[0]}")

        except KeyboardInterrupt:
            print("\n程序退出")
            break
        except Exception as e:
            print(f"错误: {e}")


def demo_mode():
    """演示模式"""
    print("=" * 60)
    print("人类鼠标点击模拟器 - 演示模式")
    print("=" * 60)
    print("将在5秒后开始演示...")
    print("按 Ctrl+C 停止演示")
    print("=" * 60)

    time.sleep(5)

    config = ClickConfig(
        min_interval=0.5,
        max_interval=1.5,
        min_x_offset=-10,
        max_x_offset=10,
        min_y_offset=-8,
        max_y_offset=8
    )

    clicker = create_clicker(config)

    try:
        while True:
            x, y = pyautogui.size()
            center_x, center_y = x // 2, y // 2

            clicker.click(center_x, center_y)

            print(f"点击位置: ({center_x}, {center_y})")

            time.sleep(2)

    except KeyboardInterrupt:
        print("\n演示结束")


if __name__ == "__main__":
    import sys

    if len(sys.argv) > 1:
        if sys.argv[1] == '--demo' or sys.argv[1] == '-d':
            demo_mode()
        elif sys.argv[1] == '--help' or sys.argv[1] == '-h':
            print("用法: python human_click.py [--demo]")
            print("  --demo, -d  启动演示模式")
            print("  无参数     启动交互模式")
        else:
            print(f"未知参数: {sys.argv[1]}")
            print("使用 --help 查看帮助")
    else:
        interactive_mode()
