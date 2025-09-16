import zipfile
import os

# Test ZIP file extraction with encoding fix
zip_path = 'chinese_test.zip'
output_dir = 'd:/privategit/github/learn-python3/samples/io/file_photo/test_output'

os.makedirs(output_dir, exist_ok=True)

with zipfile.ZipFile(zip_path) as zip_ref:
    # Handle Chinese filename encoding
    for info in zip_ref.infolist():
        # Check if filename needs encoding fix
        if '\\' in repr(info.filename) or '\\x' in repr(info.filename):
            try:
                # Try UTF-8 decoding first
                info.filename = info.filename.encode('cp437').decode('utf-8')
            except (UnicodeDecodeError, UnicodeEncodeError):
                # If UTF-8 fails, try GBK
                try:
                    info.filename = info.filename.encode('cp437').decode('gbk')
                except (UnicodeDecodeError, UnicodeEncodeError):
                    # If both fail, keep original filename
                    pass
        print(f"Extracting: {info.filename}")
    
    zip_ref.extractall(output_dir)
    
print("Extraction completed")