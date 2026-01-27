import os
import fitz  # PyMuPDF


def get_file_size(file_path):
    """获取文件大小（字节）"""
    if os.path.exists(file_path):
        return os.path.getsize(file_path)
    return 0


def split_pdf_by_size(input_pdf_path, max_size_mb=13, output_dir=None):
    """
    将PDF按页面顺序分割为多个小于指定大小的文件

    Args:
        input_pdf_path: 输入PDF文件路径
        max_size_mb: 单个文件最大大小（MB），默认13MB
        output_dir: 输出目录，默认与输入文件同目录
    """
    max_size_bytes = max_size_mb * 1024 * 1024  # 转换为字节

    # 设置输出目录
    if output_dir is None:
        output_dir = os.path.dirname(input_pdf_path)
    if not output_dir:
        output_dir = '.'

    # 获取输入文件的基本名称（不含扩展名）
    base_name = os.path.splitext(os.path.basename(input_pdf_path))[0]

    # 打开输入PDF
    try:
        input_doc = fitz.open(input_pdf_path)
    except Exception as e:
        print(f'Error opening PDF file: {e}')
        return

    total_pages = input_doc.page_count
    print(f'Input PDF: {input_pdf_path}')
    print(f'Total pages: {total_pages}')
    print(f'Max file size: {max_size_mb} MB ({max_size_bytes:,} bytes)')
    print('-' * 50)

    # 创建第一个输出文档
    output_doc = fitz.open()
    split_index = 1
    page_count_in_current = 0

    # 遍历所有页面
    for page_num in range(total_pages):
        # 复制页面到输出文档
        output_doc.insert_pdf(input_doc, from_page=page_num, to_page=page_num)
        page_count_in_current += 1

        # 生成临时文件路径来检查大小
        temp_path = os.path.join(output_dir, f'{base_name}_part{split_index}_temp.pdf')

        # 保存临时文件以检查大小
        output_doc.save(temp_path)

        # 检查文件大小
        current_size = get_file_size(temp_path)

        # 如果文件大小超过限制，且当前文件不止一页
        if current_size > max_size_bytes and page_count_in_current > 1:
            # 移除最后一页（导致超出的页）
            output_doc.delete_page(output_doc.page_count - 1)
            page_count_in_current -= 1

            # 保存当前分割文件
            output_path = os.path.join(output_dir, f'{base_name}_part{split_index}.pdf')
            output_doc.save(output_path)
            output_size = get_file_size(output_path)

            print(f'Part {split_index}: pages 1-{page_count_in_current}, size: {output_size / (1024 * 1024):.2f} MB')

            # 关闭当前文档，创建新的
            output_doc.close()
            split_index += 1
            page_count_in_current = 0
            output_doc = fitz.open()

            # 将刚才移除的页面添加到新文档
            output_doc.insert_pdf(input_doc, from_page=page_num, to_page=page_num)
            page_count_in_current += 1

        # 删除临时文件
        if os.path.exists(temp_path):
            os.remove(temp_path)

    # 保存最后一个分割文件
    if output_doc.page_count > 0:
        output_path = os.path.join(output_dir, f'{base_name}_part{split_index}.pdf')
        output_doc.save(output_path)
        output_size = get_file_size(output_path)
        print(f'Part {split_index}: pages {page_count_in_current}, size: {output_size / (1024 * 1024):.2f} MB')
        output_doc.close()

    # 清理
    input_doc.close()
    print('-' * 50)
    print(f'Split complete! Total {split_index} file(s) created.')


if __name__ == '__main__':
    # 指定输入PDF文件路径
    input_pdf = r'D:\Documents\math\2025考研数学 武忠祥高等数学基础篇 - 副本.pdf'  # 请修改为实际路径

    # 调用分割函数
    split_pdf_by_size(input_pdf, max_size_mb=13)

