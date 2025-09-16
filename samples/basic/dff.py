# listA = ['P46900600187,P46900600188']
# listB = ['P46900600187','P46900600188','P46900600012','P46900600015','P46900600189','P46900600013','P46900600014','P46900600068','P46900600138','P46900600194','P46900600214','P46900600215','P46900600105','P46900600354','P46900600260','P46900600409','P46900600329','P46900600236','P46900600235','P46900600257','P46900600347','P46900600309','P46900600325','P46900600326','P46900600348','P46900600319','P46900600320','P46900600412','P46900600387','P46900600384','P46900600432','P46900600413','P46900600458','P46900600328','P46900600341','P46900600186','P46900600376','P46900600428','P46900600515','H46900600003','H46900600001','H46900600002','H46900600483','H46900600035','H46900600010','H46900600037','H46900600033','H46900600027','H46900600013','H46900600016','H46900600430','H46900600028','H46900600007','H46900600077','H46900600006','H46900600449','H46900600078','H46900600015','H46900600011','H46900601034','H46900600005','H46900600450','H46900600135','H46900600014','H46900600004','H46900600076','H46900600017','H46900600452','H46900600075','H46900600012','H46900601830'
# ]
# # 使用集合运算符（-）获取差集','
# difference =  set(listB) - set(listA)
# # 将差集转换为列表
# 差集列表 = list(difference)
# print(差集列表)  # 输出：[1, 4, 5]

# #  SELECT  GROUP_CONCAT("'" ||FIXMEDINS_CODE|| "'")   AS FIXMEDINS_CODE  



# 定义两个列表
listA = []
listB = []

# 读取第一个 TXT 文件
with open("D:\\privategit\\learn-python3\\samples\\afile\\listA.txt", "r") as f:
    for line in f:
        # 如果listA文件的内容是逗号分隔的字符串，则需要进行处理
        # listA = line.strip().replace("'", "").split(',')
        listA.append(line.strip())
# 读取第二个 TXT 文件
with open("D:\\privategit\\learn-python3\\samples\\afile\\listB.txt", "r") as f:
    for line in f:
        listB.append(line.strip())

# 使用集合运算符（-）获取差集
# difference = set(listB) - set(listA)

# 将差集转换为列表
# 差集列表 = list(difference)

# 将列表转换为集合
setA = set(listA)
setB = set(listB)

# # 计算交集
intersection = setA & setB

# 输出
print("交集 setA & setB :", intersection)

# 计算差集 (setB 中有而 setA 中没有的元素)
difference = setA - setB

# 输出
print("差集 setA - setB :", difference)

# 计算差集 (setB 中有而 setA 中没有的元素)
differenceA = setB - setA

# 输出
print("差集 setB - setA :", differenceA)


# 计算并集
union = setA | setB
print("并集 setA | setB :", union)

# 计算补集（对称差集）
complement = setA ^ setB
print("补集 对称差集 setA ^ setB:", complement)
# # 输出集合A和集合B的交集
# print(A & B)
# print(B.intersection(A))
# # 输出集合A和集合B的并集
# print(A | B)
# print(A.union(B))
# # 输出集合A和集合B的差集
# print(A - B)
# print(A.difference(B))
# print(B - A)
# print(B.difference(A))
# # 输出集合A和集合B的对称差集,或者补集
# print(A ^ B)
# print(A.symmetric_difference(B))

# 打印差集
# print(差集列表)

# A=['1','2','3','4','5']
# B=A+['2','3','4','5','6']
# C=['2','3','4']
# print(B)
# print(type(B))
# D=B-C
# print(D)
