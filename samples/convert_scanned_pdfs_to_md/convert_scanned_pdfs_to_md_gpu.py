#!/usr/bin/env python3
"""
Windows 批量将数学书 PDF 转为 Markdown (适配 MinerU v1.3.12+)
修改版: 支持页码范围指定，例如 --limit 10-15

工作原理: 
1. 使用 PyMuPDF 切割 PDF (如果指定了 --limit)
2. 调用系统 installed 的 'magic-pdf' 命令行工具进行转换
"""
import argparse
import os
import shutil
import logging
import subprocess
import fitz  # PyMuPDF
from pathlib import Path
from tqdm import tqdm

# 检查 magic-pdf 命令是否可用
def check_dependency():
    try:
        # 尝试运行 magic-pdf --version 或 --help
        subprocess.run(["magic-pdf", "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    except FileNotFoundError:
        print("❌ 错误: 无法找到 'magic-pdf' 命令。")
        print("请确保已安装: pip install -U magic-pdf[full]")
        exit(1)

def parse_page_range(limit_str, total_pages):
    """
    解析页码范围字符串
    输入: limit_str (str), total_pages (int)
    输出: (start_index, end_index) 0-based, inclusive
    """
    if not limit_str:
        return 0, total_pages - 1

    s_str = str(limit_str).strip()
    
    # 模式 1: 范围模式 "10-15" (第10页到第15页)
    if '-' in s_str:
        try:
            parts = s_str.split('-')
            if len(parts) != 2:
                raise ValueError
            
            # 用户输入通常是 1-based (第几页)，转换为 0-based 索引
            start_page = int(parts[0]) - 1 
            end_page = int(parts[1]) - 1
            
            # 边界检查
            start_idx = max(0, start_page)
            end_idx = min(total_pages - 1, end_page)
            
            if start_idx > end_idx:
                print(f"⚠️ 警告: 起始页 {start_idx+1} 大于 结束页 {end_idx+1}，将跳过。")
                return None, None
                
            return start_idx, end_idx
        except ValueError:
            raise ValueError(f"页码范围格式错误: '{limit_str}'。正确格式示例: '10-15' 或 '10'")

    # 模式 2: 前N页模式 "10" (前10页)
    else:
        try:
            count = int(s_str)
            # 前 N 页，即索引 0 到 count-1
            end_idx = min(total_pages, count) - 1
            return 0, end_idx
        except ValueError:
            raise ValueError(f"页码格式错误: '{limit_str}'")

def process_pdf_cli(pdf_path: Path, out_dir: Path, limit_arg=None):
    """
    通过调用命令行处理 PDF
    """
    stem = pdf_path.stem
    
    # 临时文件路径 (如果有分页需求)
    temp_pdf_path = None
    
    # 最终要处理的文件路径
    target_pdf_input = pdf_path

    # ==========================================
    # 1. PDF 切割处理 (如果需要)
    # ==========================================
    try:
        # 打开原始文档检查页数
        doc = fitz.open(str(pdf_path))
        total_pages = doc.page_count
        
        # 解析需要的起止页码 (0-based 索引)
        start_idx, end_idx = 0, total_pages - 1
        is_cut_needed = False

        if limit_arg:
            p_start, p_end = parse_page_range(limit_arg, total_pages)
            if p_start is None: # 范围无效
                doc.close()
                return None
            
            # 如果请求的范围小于总页数，标记需要切割
            # 或者请求的不是从第0页开始
            if p_start > 0 or p_end < (total_pages - 1):
                start_idx, end_idx = p_start, p_end
                is_cut_needed = True

        if is_cut_needed:
            # 打印更友好的信息 (显示 1-based 页码)
            page_count = end_idx - start_idx + 1
            print(f"✂️  正在截取第 {start_idx+1} 页 至 {end_idx+1} 页 (共 {page_count} 页)...")
            
            # 生成临时文件名，包含范围信息防止覆盖
            temp_pdf_name = f"{stem}_pages_{start_idx+1}-{end_idx+1}.pdf"
            temp_pdf_path = pdf_path.parent / temp_pdf_name
            
            # 重新打开一个新文档用于保存
            new_doc = fitz.open()
            new_doc.insert_pdf(doc, from_page=start_idx, to_page=end_idx)
            new_doc.save(str(temp_pdf_path))
            new_doc.close()
            
            # 将目标指向临时文件
            target_pdf_input = temp_pdf_path
        
        doc.close()
            
    except Exception as e:
        raise RuntimeError(f"切割 PDF 失败: {e}")

    # ==========================================
    # 2. 调用 magic-pdf 命令行
    # ==========================================
    # 命令格式: magic-pdf -p "输入文件" -o "输出目录" -m auto
    try:
        # 注意：输出目录不能太深，MinerU 会自动在 out_dir 下创建以文件名命名的文件夹
        cmd = [
            "magic-pdf",
            "-p", str(target_pdf_input),
            "-o", str(out_dir),
            "-m", "auto" 
        ]
        
        # Windows下 subprocess 调用命令的兼容性写法
        print(f"🔄 正在调用 MinerU 引擎处理: {target_pdf_input.name} ...")
        
        # shell=True 在 Windows 下通常是必须的，尤其是通过 pip 安装的命令
        # check=True 会在命令返回非0状态码时抛出异常
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.DEVNULL)
        
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"MinerU 命令行执行失败 (Exit Code {e.returncode})。请检查 magic-pdf.json 配置是否正确。")
    finally:
        # ==========================================
        # 3. 清理临时文件
        # ==========================================
        if temp_pdf_path and temp_pdf_path.exists():
            try:
                os.remove(temp_pdf_path)
                print("🧹 已清理临时切割文件")
            except:
                pass

    return out_dir / stem

def main():
    parser = argparse.ArgumentParser(description="Batch convert PDFs to Markdown using MinerU CLI")
    parser.add_argument("input_dir", help="输入 PDF 文件夹路径")
    parser.add_argument("output_dir", help="输出 Markdown 文件夹路径")
    # 修改 limit 类型为 str 以支持 '10-15' 这种格式
    parser.add_argument("--limit", type=str, default=None, help="处理页数限制 (例如: '10' 表示前10页，'10-15' 表示第10页到第15页)")
    
    args = parser.parse_args()

    inp = Path(args.input_dir)
    out = Path(args.output_dir)
    out.mkdir(parents=True, exist_ok=True)

    # 检查环境
    check_dependency()

    # 扫描 PDF
    pdfs = sorted(list(inp.glob("*.pdf")))
    if not pdfs:
        print(f"❌ 在 {inp} 中未找到 PDF 文件")
        return

    print(f"🚀 开始处理 {len(pdfs)} 个文件...")
    print(f"📂 输出目录: {out}")
    if args.limit:
        print(f"📄 页码限制: {args.limit}")
    print("-" * 50)

    success_count = 0
    
    for pdf in tqdm(pdfs, desc="Processing"):
        try:
            process_pdf_cli(pdf, out, limit_arg=args.limit)
            print(f"✅ Success: {pdf.name}")
            success_count += 1
        except Exception as e:
            print(f"\n❌ Failed on {pdf.name}: {e}")

    print("-" * 50)
    print(f"处理完成: 成功 {success_count}/{len(pdfs)}")

if __name__ == "__main__":
    main()