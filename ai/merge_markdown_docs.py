import os
import math

def merge_markdown_files():
    source_dir = r"D:\privategit\github\learn-python3\ai\files2\2024刘晓艳大雁教你语法长难句_work_dir"
    output_dir = r"D:\privategit\github\learn-python3\ai\files2"
    base_name = "2024刘晓艳大雁教你语法长难句_merged"

    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)

    # Get all markdown files
    files = [f for f in os.listdir(source_dir) if f.endswith(".md")]
    
    # Sort files to ensure order. Since they are zero-padded, simple string sort works.
    files.sort()
    
    if not files:
        print("No markdown files found.")
        return

    total_files = len(files)
    print(f"Found {total_files} files.")

    # Calculate chunk size (approximate)
    num_parts = 3
    avg_chunk_size = math.ceil(total_files / num_parts)
    
    # Alternatively, explicit 9, 9, 8 split to match human logic for 26 files
    # part 1: 0-9 (9 files)
    # part 2: 9-18 (9 files)
    # part 3: 18-26 (8 files)
    chunks = []
    start = 0
    for i in range(num_parts):
        # Last part takes the rest
        if i == num_parts - 1:
            end = total_files
        else:
            end = start + avg_chunk_size
            # Adjust if we overshoot? math.ceil handles it mostly, 
            # 26/3 = 8.66 -> 9. 
            # i=0: 0 to 9 (9 items)
            # i=1: 9 to 18 (9 items)
            # i=2: 18 to 26 (8 items)
        
        chunks.append(files[start:end])
        start = end

    for i, chunk_files in enumerate(chunks):
        output_filename = f"{base_name}_{i+1}.md"
        output_path = os.path.join(output_dir, output_filename)
        
        print(f"Creating {output_filename} with {len(chunk_files)} files...")
        
        with open(output_path, "w", encoding="utf-8") as outfile:
            for fname in chunk_files:
                file_path = os.path.join(source_dir, fname)
                try:
                    with open(file_path, "r", encoding="utf-8") as infile:
                        content = infile.read()
                        outfile.write(content)
                        outfile.write("\n\n") # Add spacing between files
                except Exception as e:
                    print(f"Error reading {fname}: {e}")
        
        print(f"Finished {output_filename}")

if __name__ == "__main__":
    merge_markdown_files()
