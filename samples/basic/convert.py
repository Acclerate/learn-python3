# -*- coding: utf-8 -*-

from odps.udf import annotate
from odps.distcache import get_cache_table
from odps.udf import BaseUDTF
# -*- coding: utf-8 -*-

from odps.udf import annotate
from odps.distcache import get_cache_table

# -*- coding: utf-8 -*-

from odps.udf import annotate
from datetime import datetime, timedelta
from odps.distcache import get_cache_table
from odps.udf import BaseUDTF


# 医疗类别转码
@annotate('*->string')
class fn_conv_medpooltype(object):
    def evaluate(self, med_pool_type):
        if med_pool_type in ("1", "2"):
            return "21"
        elif med_pool_type == "3":
            return "13"
        elif med_pool_type == "4":
            return "14"
        else:
            return "11"


# 医疗类别转码
@annotate('*->string')
class fn_conv_med_type(object):
    def evaluate(self, med_type, med_pool_type):
        # 6 普通门诊
        if med_pool_type == "6":
            med_type_mapping = {
                "18": "11",  # 居民普通门诊慢性病 转为 门诊慢特病
                "19": "990103",  # 新冠病毒核酸检测
                "41": "41",  # 定点药店购药
                "61": "1403",  # 两病门诊
                "62": "990101",  # 门诊单病种
                "63": "9940",  # 意外伤害，意外伤害住院
                "64": "910202",  # 门诊谈判药，国家谈判药门诊"64": "910202", # 门诊谈判药，国家谈判药门诊
                "66": "1103",  # 早诊早治，癌症筛查
                "67": "99331",  # 血液透析
                "68": "99332",  # 腹膜透析
                "69": "1103",  # 多肿瘤标志物门诊, 癌症筛查
                "70": "110215",  # 抗排异门诊单病种，器官移植抗排斥治疗
                "71": "910202",  # 门诊谈判药，国家谈判药门诊
                "72": "510103",  # 居民生育门诊，居民产前检查
                "77": "9943",  # 卫健免费用药
                "78": "910302",  # 住院谈判药
                # "1107": "11",  # 转为 普通门诊 地伟数据库压根没有这个
            }
            med_type = med_type_mapping.get(med_type, med_type)  # 通过字典简化if-else结构

        # 其他状态
        elif med_pool_type == "4":
            med_type = "14"
        elif med_pool_type == "1":
            if med_type == "73":  # 居民生育住院
                med_type = "2106"  # 居民生育住院
            elif med_type == "74":  # 儿童三类疾病
                # med_type = "9940"   # 意外伤害住院
                med_type = "21"
            else:
                med_type = "21"  # 普通住院
        elif med_pool_type == "5":
            med_type = "81"
        elif med_pool_type == "2":
            med_type_mapping_2 = {
                "32": "9954",  # 机构护理，默认同"35"
                "33": "990302",  # 医疗专护
                "34": "990403",  # 机构护理
                "35": "9954",  # 居家护理
            }
            med_type = med_type_mapping_2.get(med_type, "71")
        elif med_pool_type == "3":
            med_type = "13"

        return med_type


# 医疗类别转码(异地)
@annotate('*->string')
class fn_conv_outmed_type(object):
    def __init__(self):
        self.med_type_mappings = {
            '0': {
                "21": "21",  # 普通住院
            },
            '6': {
                "14": "14",  # 门诊慢特病
                "18": "11",  # 居民普通门诊慢性病 转为 门诊慢特病
                "19": "990103",  # 新冠病毒核酸检测
                "41": "41",  # 定点药店购药
                "61": "1403",  # 两病门诊
                "62": "990101",  # 门诊单病种
                "63": "9940",  # 意外伤害，意外伤害住院
                "64": "910202",  # 门诊谈判药，国家谈判药门诊
                "66": "1103",  # 早诊早治，癌症筛查
                "67": "99331",  # 血液透析
                "68": "99332",  # 腹膜透析
                "69": "1103",  # 多肿瘤标志物门诊, 癌症筛查
                "70": "110215",  # 抗排异门诊单病种，器官移植抗排斥治疗
                "71": "910202",  # 门诊谈判药，国家谈判药门诊
                "72": "510103",  # 居民生育门诊，居民产前检查
                "77": "9943",  # 卫健免费用药
                "78": "910302",  # 住院谈判药
                "1107": "11",  # 转为 普通门诊
                "11": "11"  # 转为 普通门诊
            },
            '4': "14",  # 其他状态
            '1': {
                "73": "2106",  # 居民生育住院
                "74": "21",  # 儿童三类疾病
            },
            '5': "9940",  # 意外伤害住院
            '2': {
                "32": "9954",  # 机构护理
                "33": "990302",  # 医疗专护
                "34": "990403",  # 机构护理
                "35": "9954",  # 居家护理
            },
            '3': "13",  # 特定情况，对应值
        }

    def evaluate(self, med_type, med_pool_type):
        default_mapping = self.med_type_mappings.get(med_pool_type, {})

        if med_pool_type == '6':
            med_type = default_mapping.get(med_type, "11")

        elif med_pool_type == '1':
            med_type = default_mapping.get(med_type, "21")

        else:
            med_type = default_mapping if isinstance(default_mapping, str) else default_mapping.get(med_type,
                                                                                                    "21" if med_pool_type != '2' else "71")

        return med_type


# 执行较慢  暂行 替换为 func_get_optins_sql 函数
# 6位行政区新旧编码转换
# 使用函数需要在对应的函数文件资源列表配置中添加my_opt_info资源
# 具体为；convert.py,my_opt_info
# my_opt_info是ODPS中的表资源，详情参考https://help.aliyun.com/zh/maxcompute/user-guide/resource-operations
# 通过list函数，表资源被保存为元素为tuple的list
# @annotate("string->string")
# class fn_conv_getoptins(object):
#     def __init__(self):
#         self.gb_optins_info = list(get_cache_table('my_opt_info')) #   add table sc_dr_ytai_sjzq.stg_gb_optins_info_b_df_v_ytai as my_opt_info -f;
#     def evaluate(self, arg0):
#         conversion_dict = {
#         '': '370600',
#         '377602': '370602',
#         '377612': '370612',
#         '377613': '370613',
#         '377634': '370634',
#         '377640': '370640',
#         '377641': '370641',
#         '377681': '370681',
#         '377682': '370682',
#         '377683': '370683',
#         '377684': '370684',
#         '377685': '370685',
#         '377686': '370686',
#         '377687': '370687',
#         '377699': '370699'
#         }
#         return conversion_dict.get(arg0, arg0)

#         for item in self.gb_optins_info:
#             if item[1] == arg0:
#                 return item[2]
# 已替换为
# CREATE SQL FUNCTION func_get_optins_sql(@a STRING)
# AS
#     case when  @a ='' OR @a is null then
#         '370600'
#     when @a ='377602' then
#         '370602'
#     when @a='377611' then
#         '370611'
#     when @a='377612' then
#         '370612'
#     when @a='377613' then
#         '370613'
#     when @a='377634' then
#         '370634'
#     when @a='377640' then
#         '370640'
#     when @a='377641' then
#         '370641'
#     when @a='377681' then
#         '370681'
#     when @a='377682' then
#         '370682'
#     when @a='377683' then
#         '370683'
#     when @a='377684' then
#         '370684'
#     when @a='377685' then
#         '370685'
#     when @a='377686' then
#         '370686'
#     when @a='377687' then
#         '370687'
#     when @a='377699' then
#         '370699'
#     ELSE
#         case when ((SELECT COUNT(1) FROM pub_ytai_data.stg_gb_optins_info_b_df_v_ytai b WHERE length(b.optins_no) = 6 and @a = b.optins_no )>0) then
#             (SELECT admdvs FROM sc_dr_ytai_sjzq.stg_gb_optins_info_b_df_v_ytai b where length(b.optins_no) = 6 and @a = b.optins_no limit 1)
#         ELSE
#             @a
#         END
#     END
#     ;

#
@annotate('*->string')
class get_insutype(object):
    def evaluate(self, insutype):
        if insutype is None or '' == insutype:
            return ""
        elif "379" in insutype:
            return "410"
        else:
            return insutype


# 二级清算类别转码
class fn_conv_clrtypelv2(object):
    def evaluate(self, grp_type, insutype, med_pool_type, stt_psn_type):
        if insutype == "C":
            if med_pool_type in ["1", "2", "3"]:
                if grp_type == "A":
                    return "3402" if stt_psn_type == "31" else "3104"
                else:
                    return "3903"
            elif med_pool_type == "4":
                return "3103" if grp_type == "A" else "3902"
            else:
                if grp_type == "A":
                    return "3401" if stt_psn_type == "31" else "3105"
                else:
                    return "3904"
        else:
            return "5102" if med_pool_type in ["1", "2", "3"] else "5101"


# 单位类型转码
@annotate('string->string')
class fn_conv_emptype(object):
    def evaluate(self, emp_type):
        if emp_type in ["10", "15"]:
            return "10"
        elif emp_type in ["58", "54", "59", "52", "51", "50", "53"]:
            return "50"
        elif emp_type in ["70", "71", "72"]:
            return "70"
        elif emp_type in ["62", "81"]:
            return "81"
        elif emp_type == "60":
            return "9901"
        elif emp_type in ["30", "55", "56", "57", "80", "82", "83", "84", "85", "86", "90", "91", "93", "94", "95",
                          "96"]:
            return emp_type
        else:
            return "99"


# 参保身份
@annotate('*->string')
class get_quot_clct_flag(object):
    def evaluate(self, pinsutype, pdwbl, pgrbl):
        if pinsutype in ["330", "379", "410"]:
            return "1"
        elif (pdwbl == "0" and pgrbl == "0"):
            return "1"
        else:
            return "0"


# 医疗收费项目类别转码
@annotate('string->string')
class fn_conv_chrgitmtype(object):
    def evaluate(self, med_chrgitm_type):
        conversion_dict = {
            "100": "09", "110": "11", "120": "10", "150": "04",
            "180": "01", "200": "03", "230": "07", "240": "02",
            "300": "05", "400": "08", "401": "03", "500": "21",
            "700": "06"
        }
        if med_chrgitm_type in ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11"]:
            return med_chrgitm_type
        return conversion_dict.get(med_chrgitm_type, "14")


# 清算类别转码
@annotate('*->string')
class fn_conv_clrtype(object):
    def evaluate(self, med_pool_type, med_type):
        if med_pool_type in ["1", "2", "3"]:
            return "21"
        else:
            if med_type == '41':
                return "41"
            else:
                return "11"
        return ""

    # 医疗类别转码


@annotate('*->string')
class fn_conv_clrway(object):
    def evaluate(self, clr_way):
        if clr_way == "B":
            return "1"
        elif clr_way == "D":
            return "2"
        elif clr_way == "E":
            return "3"
        elif clr_way in ["F", "H"]:
            return "9"
        elif clr_way in ["P", "DRG"]:
            return "40"
        elif clr_way in ["DIP", "U"]:
            return "50"
        elif clr_way in ["101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "5", "4", "201",
                         "202", "203", "204", "205", "206", "906", "40", "1", "2", "50", "60", "19"]:
            return clr_way
        else:
            return "9"


# 基金支付类型转码
@annotate('*->string')
class fn_conv_fundpaytype(object):
    def evaluate(self, fund_pay_type, grp_type):
        if grp_type == "B":
            fund_type_mapping_b = {
                "1": "390100", "4": "99999701", "R": "390200", "CH": "99999703",
                "T": "510100", "001": "99999704", "005": "99999705", "009": "99999706",
                "016": "99999707", "109": "99999708", "2": "330100", "8": "320100",
                "9": "310200", "J": "340100", "L": "350100", "007": "610100", "019": "610107"
            }
            return fund_type_mapping_b.get(fund_pay_type, "999997")

        else:
            fund_type_mapping_others = {
                "1": "310100", "4": "99999701", "R": "99999702", "CH": "99999703",
                "001": "99999704", "005": "99999705", "009": "99999706", "016": "99999707",
                "109": "99999708", "2": "330100", "8": "320100", "9": "310200",
                "J": "340100", "L": "350100", "007": "610100", "603": "320400",
                "3": "370100", "T": "510100", "T1": "510100", "A": "320100", "804": "320100", "019": "610107"
            }
        return fund_type_mapping_others.get(fund_pay_type, "999997")


# 征缴规则编号 1统账结合 2单建统筹
@annotate('*->string')
class get_hi_tpye(object):
    def evaluate(self, phi_type, pinsutype):
        if pinsutype == "310" and phi_type not in [
            "A310010001", "A310010002", "A310010003", "A310020001",
            "A310050001", "C310010001", "C310050001"
        ]:
            return "2"
        return "1"


# 征收方式转码
@annotate('*->string')
class get_clct_way(object):
    def evaluate(self, pclct_way):
        way_mapping = {
            "1": "01", "2": "02", "3": "03", "4": "04", "5": "05", "8": "08",
            "12": "12", "15": "15",
            "7": "02", "9": "02"
        }
        return way_mapping.get(pclct_way, "02")

    # 基数核定规则类型编码转码


@annotate('*->string')
class get_clctstd_rule(object):
    def evaluate(self, pclctstd_rule):
        valid_values = {"310", "320", "330", "370", "390"}
        return pclctstd_rule if pclctstd_rule in valid_values else ""

    # 经办人转码


@annotate('string->string')
class gjj_get_default_jbr(object):
    def evaluate(self, pjbr):
        if pjbr is not None and len(str(pjbr)) > 20:
            return pjbr[1:20]
        else:
            if pjbr is None or '' == pjbr:
                return '未知'
            else:
                return pjbr


# 险种类型转码 人员类别
@annotate('string->string')
class fn_conv_psntype(object):
    def __init__(self):
        # 定义一个字典来映射输入值到输出值，特别注意处理了重复键的情况
        self.mapping = {
            None: "99",
            "11": "11", "12": "11", "13": "11", "14": "11", "16": "11",  # 在职
            "15": "1104",  # 减员职工
            "21": "12", "22": "12", "23": "12", "24": "12", "25": "12", "26": "12", "27": "12",  # 退休人员
            "27": "1204",  # 退职职工 这里"27"被"12"覆盖 退职,存在重复键 暂时不在统计
            "31": "13",  # 离休
            "33": "995310",  # 二乙残人员
            "50": "15", "504": "15", "505": "15",  # 居民（成年）
            "92": "146004",  # 低保人员
            "93": "146002",  # 残疾人员
            "41": "1402",  # 学龄前儿童
            "414": "14", "415": "14",  # 居民（未成年）
            "42": "1403", "424": "1403", "425": "1403",  # 中小学生
            "43": "1404", "434": "1404", "435": "1404",  # 大学生
            "44": "1401", "445": "1401",  # 新生儿
            "16": "1105",  # 农民工 与在职重复了，但暂未使用该类型
            "45": "1406",  # 低保学生儿童
            "34": "50",  # 医疗照顾人员
            "35": "5088",  # 离休配偶顾人员
            "36": "156031",  # 遗属60岁以上
            "60": "16", "605": "16",  # 居民（老年
            "37": "34"  # 建国前老工人
        }

    def evaluate(self, psn_type):
        return self.mapping.get(psn_type, "99")  # 如果psn_type不在字典中，则默认返回"99"


# 类别
@annotate('string->string')
class fn_conv_list_type(object):
    def evaluate(self, list_type):
        type_mapping = {
            "1": "101", "2": "201", "4": "301"
        }
        return type_mapping.get(list_type, list_type)

    # 根据入参年月份获取半年前年月 格式为 yyyyMM,类型为字符


@annotate('string->string')
class get_half_year_before_date(object):
    def evaluate(self, date_str):
        year = int(date_str[:4])
        month = int(date_str[4:])
        if month < 7:
            year -= 1
            month += 6
        else:
            month -= 6
        # 确保月份在1-12之间
        month = ((month - 1) % 12) + 1
        return "{:04d}{:02d}".format(year, month)


# 根据入参年月份获取半年前年月 格式为 yyyyMM,类型为字符 只减去五个月，因为给sql的between and用 是包含左侧时间
@annotate('string->string')
class get_five_months_before_date(object):
    def evaluate(self, date_str):
        # 将字符串转换为日期对象
        date_obj = datetime.strptime(date_str, "%Y%m")

        # 减去五个月
        five_months_ago = date_obj - timedelta(days=150)

        # 调整天数以确保我们确实是在上一个周期的最后一天（如果需要的话）
        # 这是为了处理从一个月的最后一天减去几个月的情况
        while five_months_ago.day > 28:
            five_months_ago -= timedelta(days=1)

        # 格式化日期为 "YYYYMM" 字符串
        result_date_str = five_months_ago.strftime("%Y%m")

        return result_date_str


@annotate('string->string')
class get_month_range(object):
    def __init__(self):
        self.today_str = datetime.now().strftime('%Y%m')

    def evaluate(self, start_date_str):
        # 将输入字符串转换为日期对象
        start_date = datetime.strptime(start_date_str, '%Y%m')

        # 获取今天的日期
        today_date = datetime.strptime(self.today_str, '%Y%m')

        # 初始化结果列表
        month_range = []

        # 当前日期初始化为起始日期
        current_date = start_date

        # 循环直到当前日期达到或超过今天
        while current_date <= today_date:
            # 将当前日期添加到结果列表中
            month_range.append(current_date.strftime('%Y%m'))

            # 增加一个月
            # 通过将日期设置为当月的 28 日，然后加上 4 天来确保我们不会错过任何月份的最后一天
            next_month = current_date.replace(day=28) + timedelta(days=4)
            # 然后减去“过期”的天数来移动到下个月的第一天
            current_date = next_month - timedelta(days=next_month.day)

        return month_range


@annotate('string->string')
class get_month_range(object):
    def __init__(self):
        self.today_str = datetime.now().strftime('%Y%m')

    def evaluate(self, start_date_str):
        # 将输入字符串转换为日期对象
        start_date = datetime.strptime(start_date_str, '%Y%m')

        # 获取今天的日期
        today_date = datetime.strptime(self.today_str, '%Y%m')

        # 初始化结果列表
        month_range = []

        # 当前日期初始化为起始日期
        current_date = start_date

        # 循环直到当前日期达到或超过今天
        while current_date <= today_date:
            # 将当前日期添加到结果列表中
            month_range.append(current_date.strftime('%Y%m'))

            # 增加一个月
            # 通过将日期设置为当月的 28 日，然后加上 4 天来确保我们不会错过任何月份的最后一天
            next_month = current_date.replace(day=28) + timedelta(days=4)
            # 然后减去“过期”的天数来移动到下个月的第一天
            current_date = next_month - timedelta(days=next_month.day)

        return month_range


# 类别定点医疗机构 服务对象转码去重 服务对象转码去重
@annotate('*->string')
class fn_decode_obj(object):
    def evaluate(self, fix_cntr_serv_obj):
        obj_mapping = {
            "0": "其他",
            "1": "城镇职工",
            "2": "城乡居民",
            "3": "异地就医"
        }
        decoded_obj = (set([obj_mapping.get(item, "其他") for item in fix_cntr_serv_obj.split(',')]))
        return ','.join(decoded_obj)


@annotate('*->string')
class fn_decode_scp(object):
    def evaluate(self, fix_cntr_serv_scp):
        if not isinstance(fix_cntr_serv_scp, str):
            raise TypeError("Expected a string or Unicode object")

        scp_mapping = {
            "1": "普通门诊",
            "2": "门慢门特",
            "3": "住院",
            "5": "医保个人账户",
            "6": "职工普通门诊统筹",
            "7": "居民普通门诊统筹",
            "9": "其他"
        }

        # 将逗号分隔的字符串转换为列表，映射到中文描述，并去除重复项
        decoded_scps = set(scp_mapping.get(item.strip(), "其他") for item in fix_cntr_serv_scp.split(','))

        # 返回逗号分隔的字符串，符合SQL查询对字符串返回值的预期
        return ','.join(decoded_scps)

if __name__ == '__main__':
    print(fn_decode_scp.evaluate('',"1,2,3,5,6,1,2,4,5,6,7,9,2,4,5,6"))
    print(fn_decode_obj.evaluate('',"1,2,3,0,1,2,3"))
