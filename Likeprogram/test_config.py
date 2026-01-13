"""
配置测试脚本
"""
from human_click import create_clicker, ClickConfig
import pyautogui
import time


def test_config(description: str, config: ClickConfig):
    """测试配置效果"""
    print(f"\n{'='*60}")
    print(f"测试: {description}")
    print(f"{'='*60}")
    print(f"配置参数:")
    print(f"  间隔: {config.min_interval:.2f}s - {config.max_interval:.2f}s")
    print(f"  X偏移: {config.min_x_offset:.1f} - {config.max_x_offset:.1f}")
    print(f"  Y偏移: {config.min_y_offset:.1f} - {config.max_y_offset:.1f}")
    print(f"  移动时间: {config.click_duration:.3f}s")
    print(f"{'='*60}")
    print("将在3秒后开始点击...")
    print("请将鼠标移开，点击将发生在屏幕中心")
    print("按 Ctrl+C 停止")
    print(f"{'='*60}\n")

    time.sleep(3)

    clicker = create_clicker(config)
    screen_width, screen_height = pyautogui.size()
    center_x, center_y = screen_width // 2, screen_height // 2

    try:
        for i in range(3):
            clicker.click(center_x, center_y)
            print(f"  点击 {i+1}/3 完成")
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n测试停止")


def main():
    print("人类鼠标点击模拟器 - 配置测试")
    print("="*60)

    # 测试1: 自定义配置（用户指定）
    config1 = ClickConfig(
        min_interval=0.5,
        max_interval=1.5,
        min_x_offset=-10,
        max_x_offset=10,
        min_y_offset=-8,
        max_y_offset=8,
        click_duration=0.15
    )
    test_config("自定义配置（0.5-1.5s间隔，±10像素偏移）", config1)

    # 测试2: 慢速配置（更像真人）
    config2 = ClickConfig(
        min_interval=0.8,
        max_interval=2.0,
        min_x_offset=-10,
        max_x_offset=10,
        min_y_offset=-8,
        max_y_offset=8,
        click_duration=0.2
    )
    test_config("慢速配置（更像人类操作）", config2)

    # 测试3: 快速配置（仍非机械）
    config3 = ClickConfig(
        min_interval=0.1,
        max_interval=0.4,
        min_x_offset=-2,
        max_x_offset=2,
        min_y_offset=-2,
        max_y_offset=2,
        click_duration=0.05
    )
    test_config("快速配置（快速但自然）", config3)

    print("\n" + "="*60)
    print("所有测试完成！")
    print("="*60)


if __name__ == "__main__":
    main()
