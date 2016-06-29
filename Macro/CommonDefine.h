//
//  CommonDefine.h
//  米兰港
//
//  Created by 隋林栋 on 15/4/1.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#ifndef ____CommonDefine_h
#define ____CommonDefine_h


//判断邮箱是否规则
#define IsValidEmail(email)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"] evaluateWithObject:email]
//判断邮编是否规则
#define IsValidPostCode(code)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[1-9]\\d{5}(?!\\d)"] evaluateWithObject:code]

//判断电话号码是否规则
#define IsValidPhoneNum(phoneNum)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^((13[0-9])|(170)|(15[^4,\\D])|(18[0-9]))\\d{8}$"] evaluateWithObject:[NSString stringWithFormat:@"%@",phoneNum]]

//判断用户名是否规则
#define IsValidUserName(userName)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[a-zA-Z][a-zA-Z0-9_]{5,17}$"] evaluateWithObject:userName]




//只有字母  只有数字  只有符号 只有汉字
#define IsOnlyLetter(userName)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[a-zA-Z]{6,32}$"] evaluateWithObject:userName]
#define IsOnlyNum(userName)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9_]{6,32}$"] evaluateWithObject:userName]
#define IsOnlySign(userName)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[@!#$%&'*+-/=\?^_`{|}~]{6,32}$"] evaluateWithObject:userName]
#define IsOnlyChina(userName)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[\u4E00-\u9FA5]{6,32}$"] evaluateWithObject:userName]


//判断用户密码是否规则
#define IsValidUserPwd(pwd)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^[\x21-\x7E]{6,16}$"] evaluateWithObject:pwd]

//判断文件名是否规则
#define IsValidFileName(fileName)\
[fileName rangeOfString:@"\\"].length ? NO : [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^*[^?<>:/\"|*]*$"] evaluateWithObject:fileName]

//判断是否是数字
#define IsValidNum(str)\
[[NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^[0-9]*$"] evaluateWithObject:str]


#endif
