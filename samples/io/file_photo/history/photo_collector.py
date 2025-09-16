#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys
import tempfile
import zipfile
import shutil
import time
import threading
import queue
import psutil  # 用于磁盘空间检查
from PIL import Image
from concurrent.futures import ThreadPoolExecutor, as_completed

# 尝试导入rarfile，用于处理RAR文件
try:
    import rarfile
    RAR_SUPPORT = True
except ImportError:
    RAR_SUPPORT = False
    print("警告: rarfile 模块未安装，RAR文件将无法处理。请运行: pip install rarfile")

# 支持的图片文件扩展名
IMAGE_EXTENSIONS = ('.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.webp', '.heic')
# 支持的压缩文件扩展名
ARCHIVE_EXTENSIONS = ('.zip', '.rar')

class ParallelPhotoCollector:
    def __init__(self, base_output_dir, max_workers=4, max_depth=10):
        self.base_output_dir = base_output_dir
        self.photo_count = 0
        self.count_lock = threading.Lock()
        self.processed_archives = set()
        self.archive_lock = threading.Lock()
        self.errors = []
        self.error_lock = threading.Lock()
        self.max_depth = max_depth
        self.executor = ThreadPoolExecutor(max_workers=max_workers)
        self.task_queue = queue.Queue()
        self.temp_dirs = []
        self.dir_lock = threading.Lock()
        self.start_time = time.time()
        self.file_counter = 0

    def log_error(self, message):
        with self.error_lock:
            self.errors.append(message)
            print(f"❌ {message}", file=sys.stderr)

    def increment_count(self):
        with self.count_lock:
            self.photo_count += 1
            self.file_counter += 1
            
            if self.file_counter % 100 == 0:
                elapsed = time.time() - self.start_time
                mins, secs = divmod(int(elapsed), 60)
                hours, mins = divmod(mins, 60)
                print(f"\r🔄 已处理 {self.file_counter} 文件 | 找到 {self.photo_count} 张图片 | "
                      f"运行时间: {hours:02d}:{mins:02d}:{secs:02d} | "
                      f"队列大小: {self.task_queue.qsize()}", end="")

    def is_image_file(self, filename):
        return filename.lower().endswith(IMAGE_EXTENSIONS)

    def is_archive_file(self, filename):
        ext = os.path.splitext(filename)[1].lower()
        return ext in ARCHIVE_EXTENSIONS

    def process_image(self, file_path):
        if not file_path.startswith(self.base_output_dir):
            try:
                dest_filename = os.path.basename(file_path)
                dest_path = os.path.join(self.base_output_dir, dest_filename)
                counter = 1
                while os.path.exists(dest_path):
                    name, ext = os.path.splitext(dest_filename)
                    dest_path = os.path.join(self.base_output_dir, f"{name}_{counter}{ext}")
                    counter += 1
                shutil.copy2(file_path, dest_path)
                print(f"📷 复制图片: {file_path} -> {dest_path}")
            except Exception as e:
                self.log_error(f"复制图片失败 {file_path}: {str(e)}")
        
        try:
            with Image.open(file_path) as img:
                img.verify()
                self.increment_count()
        except (IOError, SyntaxError, Image.DecompressionBombWarning) as e:
            self.log_error(f"无效图片文件: {file_path}, 错误: {str(e)}")

    def process_entry(self, entry_path, depth=0):
        try:
            if os.path.isdir(entry_path):
                for entry in os.scandir(entry_path):
                    self.task_queue.put((entry.path, depth))
                return

            filename = os.path.basename(entry_path)
            
            if self.is_image_file(filename):
                self.process_image(entry_path)
                return
            
            if self.is_archive_file(filename):
                with self.archive_lock:
                    if entry_path in self.processed_archives:
                        return
                    self.processed_archives.add(entry_path)
                
                if depth >= self.max_depth:
                    self.log_error(f"达到最大递归深度 {self.max_depth}, 跳过: {entry_path}")
                    return
                
                archive_name = os.path.splitext(os.path.basename(entry_path))[0]
                output_dir = os.path.join(self.base_output_dir, archive_name)
                os.makedirs(output_dir, exist_ok=True)
                
                ext = os.path.splitext(filename)[1].lower()
                if ext == '.zip':
                    self.process_zip(entry_path, output_dir)
                elif ext == '.rar':
                    self.process_rar(entry_path, output_dir)
                
                for root, _, files in os.walk(output_dir):
                    for file in files:
                        file_path = os.path.join(root, file)
                        self.task_queue.put((file_path, depth + 1))
        except Exception as e:
            self.log_error(f"处理 {entry_path} 时出错: {str(e)}")

    def process_zip(self, zip_path, output_dir):
        try:
            disk_free = shutil.disk_usage(os.path.dirname(output_dir)).free
            with zipfile.ZipFile(zip_path) as zip_ref:
                # 处理中文文件名编码问题
                for info in zip_ref.infolist():
                    try:
                        # 尝试使用UTF-8解码
                        info.filename = info.filename.encode('cp437').decode('utf-8')
                    except UnicodeDecodeError:
                        # 如果UTF-8失败，尝试使用GBK解码
                        try:
                            info.filename = info.filename.encode('cp437').decode('gbk')
                        except UnicodeDecodeError:
                            # 如果都失败，保留原始文件名
                            pass
                total_size = sum(f.file_size for f in zip_ref.infolist())
                if total_size > disk_free * 0.8:
                    raise OSError(f"磁盘空间不足: 需要 {total_size} 字节, 可用 {disk_free} 字节")
                zip_ref.extractall(output_dir)
                print(f"\n📦 解压ZIP: {zip_path} -> {output_dir}")
        except (zipfile.BadZipFile, OSError) as e:
            self.log_error(f"处理ZIP失败 {zip_path}: {str(e)}")

    def process_rar(self, rar_path, output_dir):
        if not RAR_SUPPORT:
            self.log_error(f"无法处理RAR文件 {rar_path}: rarfile 模块未安装")
            return
        
        try:
            disk_free = shutil.disk_usage(os.path.dirname(output_dir)).free
            with rarfile.RarFile(rar_path) as rar_ref:
                try:
                    rar_ref.testrar()
                except Exception as e:
                    raise Exception(f"RAR文件完整性校验失败: {str(e)}")
                # 处理中文文件名编码问题
                rar_ref.setpassword(None)
                # 尝试设置编码以正确处理中文文件名
                rar_ref.strerror = 'utf-8'
                total_size = sum(f.file_size for f in rar_ref.infolist())
                if total_size > disk_free * 0.8:
                    raise OSError(f"磁盘空间不足: 需要 {total_size} 字节, 可用 {disk_free} 字节")
                rar_ref.extractall(output_dir)
                print(f"\n📦 解压RAR: {rar_path} -> {output_dir}")
        except (rarfile.RarCannotExec, rarfile.BadRarFile, OSError) as e:
            self.log_error(f"处理RAR失败 {rar_path}: {str(e)}")

    def worker(self):
        while True:
            try:
                item = self.task_queue.get(timeout=30)
                if item is None:
                    break
                
                path, depth = item
                self.executor.submit(self.process_entry, path, depth)
                self.task_queue.task_done()
            except queue.Empty:
                break

    def cleanup_temp_dirs(self):
        with self.dir_lock:
            for temp_dir in self.temp_dirs:
                if os.path.exists(temp_dir):
                    try:
                        shutil.rmtree(temp_dir)
                        print(f"🧹 清理临时目录: {temp_dir}")
                    except Exception as e:
                        self.log_error(f"清理临时目录失败 {temp_dir}: {str(e)}")
            self.temp_dirs = []

    def run(self, start_path):
        print(f"⏳ 开始处理: {start_path}")
        self.start_time = time.time()
        
        workers = []
        for _ in range(self.executor._max_workers):
            t = threading.Thread(target=self.worker)
            t.daemon = True
            t.start()
            workers.append(t)
        
        self.task_queue.put((start_path, 0))
        
        try:
            while not self.task_queue.empty() or threading.active_count() > 1:
                time.sleep(1)
                print(f"\r🔄 处理中... 已找到 {self.photo_count} 张图片 | "
                      f"队列大小: {self.task_queue.qsize()} | "
                      f"活动线程: {threading.active_count()-1}", end="")
        except KeyboardInterrupt:
            print("\n⚠️ 用户中断，正在清理...")
        
        for _ in range(len(workers)):
            self.task_queue.put(None)
        
        for t in workers:
            t.join()
        
        self.cleanup_temp_dirs()
        
        self.executor.shutdown(wait=True)
        
        elapsed = time.time() - self.start_time
        mins, secs = divmod(int(elapsed), 60)
        hours, mins = divmod(mins, 60)
        
        print("\n" + "=" * 60)
        print(f"✅ 处理完成! 总共找到 {self.photo_count} 张图片文件")
        print(f"⏱️ 总耗时: {hours:02d}:{mins:02d}:{secs:02d}")
        
        if self.errors:
            print("\n⚠️ 遇到的错误 (部分):")
            for error in self.errors[:10]:
                print(f"- {error}")
            if len(self.errors) > 10:
                print(f"- ...共 {len(self.errors)} 个错误，完整日志请查看程序输出")
        
        print("=" * 60)

if __name__ == '__main__':
    # For testing with our Chinese filename ZIP
    START_PATH = r"."  # Current directory
    BASE_OUTPUT_DIR = r"./output"
    MAX_WORKERS = 2  # Reduced for testing
    MAX_RECURSION_DEPTH = 5
    
    # Create output directory if it doesn't exist
    os.makedirs(BASE_OUTPUT_DIR, exist_ok=True)
    
    collector = ParallelPhotoCollector(
        base_output_dir=BASE_OUTPUT_DIR,
        max_workers=MAX_WORKERS,
        max_depth=MAX_RECURSION_DEPTH
    )
    collector.run(START_PATH)
    
    result_file = "photo_collection_results.txt"
    with open(result_file, "w", encoding="utf-8") as f:
        f.write(f"处理路径: {START_PATH}\n")
        f.write(f"图片总数: {collector.photo_count}\n")
        f.write(f"错误数量: {len(collector.errors)}\n")
        f.write("\n===== 错误日志 =====\n")
        for error in collector.errors:
            f.write(f"{error}\n")
    
    print(f"\n结果已保存到: {result_file}")