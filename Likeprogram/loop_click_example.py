"""
循环点击示例脚本
"""
from human_click import create_clicker, ClickConfig
import pyautogui
import time


def loop_click_at_position(x: int, y: int, count: int, interval: float = 0, double_click: bool = False):
    """
    在固定位置循环点击

    Args:
        x: X坐标
        y: Y坐标
        count: 点击次数
        interval: 额外间隔（秒）
        double_click: 是否双击
    """
    print(f"\n{'='*60}")
    click_type = "双击" if double_click else "单击"
    print(f"循环{click_type}模式：固定位置")
    print(f"{'='*60}")
    print(f"位置: ({x}, {y})")
    print(f"次数: {count}")
    print(f"{'='*60}\n")

    clicker = create_clicker()

    try:
        for i in range(count):
            print(f"{click_type} {i+1}/{count}")
            if double_click:
                clicker.double_click(x, y)
            else:
                clicker.click(x, y)
            if interval > 0 and i < count - 1:
                time.sleep(interval)
    except KeyboardInterrupt:
        print("\n循环被用户中断")

    print(f"\n完成！共点击 {i+1} 次")


def loop_click_multi_positions(positions: list, count: int = 1):
    """
    在多个位置依次循环点击

    Args:
        positions: [(x1, y1), (x2, y2), ...]
        count: 循环轮数
    """
    print(f"\n{'='*60}")
    print(f"循环点击模式：多位置依次点击")
    print(f"{'='*60}")
    print(f"位置列表: {positions}")
    print(f"轮数: {count}")
    print(f"{'='*60}\n")

    clicker = create_clicker()

    try:
        for round_num in range(count):
            print(f"\n--- 第 {round_num+1}/{count} 轮 ---")
            for i, (x, y) in enumerate(positions):
                clicker.click(x, y)
                print(f"  [{i+1}/{len(positions)}] 点击 ({x}, {y})")
    except KeyboardInterrupt:
        print("\n循环被用户中断")


def infinite_loop_click(x: int, y: int, duration: float = None):
    """
    无限循环点击（可设置持续时间）

    Args:
        x: X坐标
        y: Y坐标
        duration: 持续时间（秒），None表示无限
    """
    print(f"\n{'='*60}")
    print(f"无限循环点击模式")
    print(f"{'='*60}")
    print(f"位置: ({x}, {y})")
    if duration:
        print(f"持续时间: {duration} 秒")
    else:
        print(f"持续时间: 无限（按 Ctrl+C 停止）")
    print(f"{'='*60}\n")

    clicker = create_clicker()
    count = 0
    start_time = time.time()

    try:
        while True:
            if duration and (time.time() - start_time) >= duration:
                break
            count += 1
            clicker.click(x, y)
            print(f"点击 {count}")
    except KeyboardInterrupt:
        print("\n循环被用户中断")

    elapsed = time.time() - start_time
    print(f"\n完成！共点击 {count} 次，耗时 {elapsed:.1f} 秒")


def random_area_loop_click(x1: int, y1: int, x2: int, y2: int, count: int):
    """
    在区域内随机位置循环点击

    Args:
        x1, y1: 区域左上角
        x2, y2: 区域右下角
        count: 点击次数
    """
    print(f"\n{'='*60}")
    print(f"区域随机点击模式")
    print(f"{'='*60}")
    print(f"区域: ({x1}, {y1}) - ({x2}, {y2})")
    print(f"次数: {count}")
    print(f"{'='*60}\n")

    clicker = create_clicker()

    try:
        for i in range(count):
            actual_x, actual_y = clicker.random_click_in_area(x1, y1, x2, y2)
            print(f"点击 {i+1}/{count}: 实际位置 ({actual_x}, {actual_y})")
    except KeyboardInterrupt:
        print("\n循环被用户中断")


def main():
    print("人类鼠标点击模拟器 - 循环点击示例")
    print("="*60)
    print("请选择模式：")
    print("  1. 固定位置循环点击")
    print("  2. 多位置依次循环点击")
    print("  3. 无限循环点击")
    print("  4. 区域内随机循环点击")
    print("  0. 退出")
    print("="*60)

    choice = input("\n请输入选项 (0-4): ").strip()

    if choice == '1':
        x = int(input("请输入X坐标: "))
        y = int(input("请输入Y坐标: "))
        count = int(input("请输入双击次数: "))
        double = input("是否双击 (y/n): ").strip().lower() == 'y'
        loop_click_at_position(x, y, count, double_click=double)

    elif choice == '2':
        positions = []
        while True:
            coord = input("输入坐标 (格式: x y)，直接回车结束: ").strip()
            if not coord:
                break
            x, y = map(int, coord.split())
            positions.append((x, y))
        if positions:
            count = int(input("请输入循环轮数: "))
            loop_click_multi_positions(positions, count)

    elif choice == '3':
        x = int(input("请输入X坐标: "))
        y = int(input("请输入Y坐标: "))
        duration_input = input("请输入持续时间（秒），直接回车表示无限: ").strip()
        duration = float(duration_input) if duration_input else None
        infinite_loop_click(x, y, duration)

    elif choice == '4':
        x1 = int(input("请输入区域左上角X坐标: "))
        y1 = int(input("请输入区域左上角Y坐标: "))
        x2 = int(input("请输入区域右下角X坐标: "))
        y2 = int(input("请输入区域右下角Y坐标: "))
        count = int(input("请输入点击次数: "))
        random_area_loop_click(x1, y1, x2, y2, count)

    elif choice == '0':
        print("程序退出")
    else:
        print("无效选项")


if __name__ == "__main__":
    main()
