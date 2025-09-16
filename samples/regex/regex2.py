import os
import shutil


def find_and_print_ppt_files(src_dir, dest_dir):
    for root, _, files in os.walk(src_dir):
        for file in files:
            if "课堂ppt.pdf" in file.lower():
                src_file_path = os.path.join(root, file)
                dest_file_path = os.path.join(dest_dir, file)

                try:
                    shutil.copy(src_file_path, dest_file_path)
                    print(f"Copied {src_file_path} to {dest_file_path}")
                except IOError as e:
                    print(f"Unable to copy file {src_file_path} to {dest_file_path}. Error: {e}")
                except Exception as e:
                    print(f"Unexpected error: {e}")


if __name__ == "__main__":
    source_directory = r'D:\math_ppt_pdf'  # 源目录路径，请替换为实际路径
    target_directory = r'D:\math_ppt_pdf\target'  # 源目录路径，请替换为实际路径
    find_and_print_ppt_files(source_directory,target_directory)
