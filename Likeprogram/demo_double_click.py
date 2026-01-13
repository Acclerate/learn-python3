"""
三击循环演示
"""
import pyautogui
from human_click import create_clicker
import time

pyautogui.FAILSAFE = False

print("三连击循环演示")
print("="*60)
print("每次三连击包含：")
print("  - 快速连续3次点击（间隔0.08-0.15秒）")
print("  - 每次三连击间隔0.5-1.5秒（随机）")
print("="*60)
print("将在3秒后开始...")
print("请将鼠标移开")
print("="*60)

time.sleep(3)

clicker = create_clicker()

try:
    for i in range(1500):
        print(f"\n>>> 三连击 {i+1}/5")
        clicker.triple_click(360, 660)
        print(f"    完成，间隔中...")
except KeyboardInterrupt:
    print("\n演示停止")

print("\n演示完成！")
