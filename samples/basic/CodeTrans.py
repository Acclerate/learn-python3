# -*- coding: utf-8 -*-

from odps.udf import annotate
from odps.distcache import get_cache_table


# 险种类型转码
@annotate('string,string->string')
class fn_conv_insutype(object):
    def evaluate(self, insutype, grp_type):
        if insutype == "E":
            return "510"
        elif insutype == "C":
            if grp_type == "B":
                return "390"
            else:
                return "310"
        return insutype


# 经济类型转码
@annotate('string->string')
class fn_conv_econtype(object):
    def evaluate(self, econ_type):
        if econ_type == "101":
            return "900"
        return econ_type


# 限价医院等级
@annotate('string->string')
class fn_conv_lmtprichosplv(object):
    def evaluate(self, hosp_lv):
        if hosp_lv in ["1", "2", "3"]:
            return hosp_lv
        else:
            return "9"

        # 离院方式转码


@annotate('string->string')
class fn_conv_dscgway(object):
    def evaluate(self, dscg_way):
        if dscg_way in ["1", "2", "3", "4"]:
            return "1"
        elif dscg_way in ["7", "8"]:
            return "2"
        elif dscg_way == "5":
            return "5"
        elif dscg_way in ["6", "9"]:
            return "9"
        else:
            return ""


# 在院状态转码
@annotate('*->string')
class fn_conv_inhospstas(object):
    def evaluate(self, med_pool_type, enddate):
        if med_pool_type in ["1", "2", "3"] and enddate is None:
            return "1"
        else:
            return "0"

        # 获取财务拨付状态


@annotate('string->string')
class get_fin_dspo_flag(object):
    def evaluate(self, pfin_dspo_flag):
        if "0" in pfin_dspo_flag:
            return "1"
        elif "1" in pfin_dspo_flag:
            return "4"
        elif "4" in pfin_dspo_flag:
            return "11"
        return ""


# 拨付来源转码
@annotate('string->string')
class fn_conv_dfrsouc(object):
    def __init__(self):
        self.mapping = {
            "10A": "101", "101": "99936", "103": "99931",
            "10B": "99928", "10C": "99925", "10I": "99924",
            "119": "99923", "158": "99922", "173": "99921",
            "6": "99920", "7": "99919", "10D": "201",
            "10E": "304", "10H": "203", "10Q": "204",
            "10S": "204", "112": "206", "167": "106"
        }

    def evaluate(self, dfr_souc):
        return self.mapping.get(dfr_souc, "999")[0:3]


# 统筹区基金支付类型转码
@annotate('string,string->string')
class fn_conv_poolareafundpaytype(object):
    def evaluate(self, fund_pay_type, grp_type):
        poolareafundpaytype_mapping = {
            "B": {
                "1": "390101", "2": "330101", "4": "999997",
                "8": "320101", "9": "310201", "J": "340101",
                "L": "350101", "R": "310302", "007": "610101",
                "CH": "99999748", "T": "510101", "001": "610201",
                "005": "620101", "009": "360101", "016": "999997",
                "109": "610102"
            },
            "default": {
                "1": "310101", "2": "330101", "4": "999997",
                "8": "320101", "9": "310201", "J": "340101",
                "L": "350101", "R": "310302", "007": "610101",
                "CH": "99999748", "T": "510101", "001": "610201",
                "005": "620101", "009": "360101", "016": "999997",
                "109": "610102"
            }
        }

        mapping = poolareafundpaytype_mapping.get(grp_type, poolareafundpaytype_mapping["default"])
        return mapping.get(fund_pay_type, "999997")[0:6]


# 民族名称
@annotate('string->string')
class get_nation_name(object):
    def evaluate(self, mz):
        nation_dict = {
            '01': '汉族', '02': '蒙古族', '03': '回族', '04': '藏族',
            '05': '维吾尔族', '06': '苗族', '07': '彝族', '08': '壮族',
            '09': '布依族', '10': '朝鲜族', '11': '满族', '12': '侗族',
            '13': '瑶族', '14': '白族', '15': '土家族', '16': '哈尼族',
            '17': '哈萨克族', '18': '傣族', '19': '黎族', '20': '傈僳族',
            '21': '佤族', '22': '畲族', '23': '高山族', '24': '拉祜族',
            '25': '水族', '26': '东乡族', '27': '纳西族', '28': '景颇族',
            '29': '柯尔克孜族', '30': '土族', '31': '达斡尔族', '32': '仫佬族',
            '33': '羌族', '34': '布朗族', '35': '撒拉族', '36': '毛南族',
            '37': '仡佬族', '38': '锡伯族', '39': '阿昌族', '40': '普米族',
            '41': '塔吉克族', '42': '怒族', '43': '乌孜别克族', '44': '俄罗斯族',
            '45': '鄂温克族', '46': '德昂族', '47': '保安族', '48': '裕固族',
            '49': '京族', '50': '塔塔尔族', '51': '独龙族', '52': '鄂伦春族',
            '53': '赫哲族', '54': '门巴族', '55': '珞巴族', '56': '基诺族'
        }
        return nation_dict.get(mz, '未说明')

