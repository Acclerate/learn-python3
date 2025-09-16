import pandas as pd
import re

# Read the XLS file into a DataFrame
# df = pd.read_excel(
#     r"D:\Documents\WeChat Files\wxid_lsootbrkhf4x22\FileStorage\File\2024-02\三亚市已完成接口改造定点药店名单2024.2.29(1).xls",
# )
# df = pd.read_excel(
#     r"D:\Documents\WeChat Files\wxid_lsootbrkhf4x22\FileStorage\File\2024-02\工作簿1.xlsx",
# )
# df = pd.read_excel(
#     r"D:\Documents\WeChat Files\wxid_lsootbrkhf4x22\FileStorage\File\2024-03\万宁接口改造完成名单(1).xlsx",
# )
# df = pd.read_excel(
#     r"D:\Documents\WeChat Files\wxid_lsootbrkhf4x22\FileStorage\File\2024-03\三亚市已完成接口改造定点医疗机构名单2024.2.29(1).xls",
# )
df = pd.read_excel(
    r"D:\Documents\WeChat Files\wxid_lsootbrkhf4x22\FileStorage\File\2024-03\妇幼系统贯标名单(2).xls",
)

# Convert the DataFrame to a string
df_str = df.to_string()

# Use regular expressions to extract the P-prefixed and H-prefixed strings
p_strings = re.findall(r"P\d{11}", df_str)
h_strings = re.findall(r"H\d{11}", df_str)

# Concatenate the two lists of strings
strings = p_strings + h_strings

# Convert the list of strings to a string of comma-separated values, with single quotes around each string
in_condition = ",".join(["'" + s + "'" for s in strings])
# Print the number of strings in in_condition
print(len(strings))
# Create the SQL statement
sql = f"""
SELECT FIXMEDINS_CODE, 
       CASE
           WHEN RID LIKE '%2019%' THEN REPLACE(RID, SUBSTR(RID, 5, 4), DATE_FORMAT(NOW(), '%Y%m%d'))
           WHEN RID LIKE '%2020%' THEN REPLACE(RID, SUBSTR(RID, 5, 4), DATE_FORMAT(NOW(), '%Y%m%d'))
           WHEN RID LIKE '%2021%' THEN REPLACE(RID, SUBSTR(RID, 5, 4), DATE_FORMAT(NOW(), '%Y%m%d'))
           WHEN RID LIKE '%2022%' THEN REPLACE(RID, SUBSTR(RID, 5, 4), DATE_FORMAT(NOW(), '%Y%m%d'))
           WHEN RID LIKE '%2023%' THEN REPLACE(RID, SUBSTR(RID, 5, 4), DATE_FORMAT(NOW(), '%Y%m%d'))
           WHEN RID LIKE '%2024%' THEN REPLACE(RID, SUBSTR(RID, 5, 4), DATE_FORMAT(NOW(), '%Y%m%d'))
           ELSE RID
       END AS RID, FIXMEDINS_NAME, 
       VALI_FLAG, VALI_FLAG AS HOSP_APPR_FLAG, 
       '万宁医保' AS CRTER_NAME, 
       POOLAREA_NO
FROM `fixmedins_b`
WHERE FIXMEDINS_CODE IN ({in_condition})
"""

# Print the SQL statement
print(sql)
