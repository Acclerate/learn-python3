# 图片处理与上传流程说明

本文件描述了医疗机构照片的处理、数据库导入及最终上传至OSS对象存储的完整工作流程，包含以下核心步骤：

## 步骤1：收集图片文件

使用 `move_images_recursive.py` 脚本将分布在多层级文件夹中的图片文件统一收集到指定的待上传目录。
- **功能说明**：该脚本会递归遍历源目录下的所有子文件夹，自动识别并移动符合命名规则的图片文件
- **处理目的**：去除多余的文件夹层级，将分散的图片文件集中整理到单一目录，便于后续统一处理和上传
- **支持格式**：自动识别常见图片格式（JPG、PNG、GIF、BMP等）

## 步骤2：重命名图片文件

使用 `rename_images.py` 脚本将收集到的图片文件按照数字序列进行标准化重命名。
- **命名规则**：将所有图片依次重命名为 `1.jpg`, `2.jpg`, `3.jpg`, ... 的格式
- **处理优势**：统一的命名格式便于后续批量处理和数据库导入，避免因原始文件名不规范导致的问题
- **注意事项**：重命名操作会覆盖原有文件名，请确保在确认收集完成后再执行此步骤

## 步骤3：生成数据库导入SQL语句

使用 `generate_sql_for_images.py` 脚本根据重命名后的图片文件生成对应的SQL插入语句。
- **核心功能**：自动生成符合数据库要求的SQL语句，用于将图片信息批量导入数据库
- **表名说明**：请注意，该脚本使用的目标数据表为 `dwd_jgxx_fcm_fixmedins_b_df_ytai`
- **特别提醒**：该数据表需要定期更新，请确保使用最新的表结构和命名规范

## 步骤4：上传至OSS对象存储

完成上述步骤后，使用ossutil工具将处理好的图片文件上传至OSS对象存储服务。

### OSS服务器信息
- **服务器地址**：10.80.162.120
- **OSS Bucket**：`oss://oss-sc-dr-ytai-ljhsfn-01/image/`

### 上传操作示例

#### 1. 查看当前OSS存储空间中的文件数量
```bash
# 在服务器上执行以下命令查看当前OSS中的文件数量
ossutil ls oss://oss-sc-dr-ytai-ljhsfn-01/image/ | grep "Object Number"
# 输出示例：Object Number is: 9003
```

#### 2. 统计本地待上传的图片文件数量
```bash
# 在本地图片目录下执行以下命令统计图片文件数量
find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" \) | wc -l
# 输出示例：217
```

#### 3. 执行OSS上传命令
```bash
# 使用ossutil执行批量上传操作
ossutil cp -r /home/image20250912高新区 oss://oss-sc-dr-ytai-ljhsfn-01/image/ -u -j 10
# 输出示例：
# Succeed: Total num: 219, size: 166,659,763. OK num: 219(upload 218 files, 1 directories).
# average speed 187679000(byte/s)
# 0.889852(s) elapsed
```

#### 4. 验证上传结果
```bash
# 再次查看OSS存储空间中的文件数量，确认上传成功
ossutil ls oss://oss-sc-dr-ytai-ljhsfn-01/image/ | grep "Object Number"
# 输出示例：Object Number is: 9221
```

---

请严格按照上述步骤顺序执行，确保图片处理流程的准确性和完整性。
