//
//  GlobalMethod.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/3.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class NSDictionary;

@interface GlobalMethod : NSObject

//获取ip
+  (NSString *)fetchIPAddress;

//创建rootNav
+ (void)createRootNav;

//获取更新版本
+ (void)requestVersionSuccess:(NSDictionary *)dicResponse;

//提交token
+ (void)requestUpTokenisExit:(BOOL)isexit;
//注销
+ (void)logoutSuccess;

//判断是否登陆
+(BOOL)isLoginSuccess;


//登陆 with block
+ (void)loginWithBlock:(void (^)(void))block;

//自动登陆
+ (void)autoLogin;

//登陆成功
+ (void)loginSuccess:(NSDictionary *)dicReturn  userName:(NSString *)userName pwd:(NSString *)pwd;

//读取未读信息
+ (void)fetchUnReadMessage;

//计算高度 宽度
+ (CGFloat)fetchSizeFromLabel:(UILabel *)label;
+ (CGFloat)fetchSizeFromLabel:(UILabel *)label heightLimit:(CGFloat )height;
+ (CGFloat)fetchWidthFromLabel:(UILabel *)label;

//设置圆角
+ (void)setRoundBtn:(UIView *)view btnBgColor:(UIColor *)colorBtn;
+ (void)setRoundView:(UIView *)iv color:(UIColor *)color;
+ (void)setRoundView:(UIView *)iv color:(UIColor *)color numRound:(int)numRound width:(int)width;
+ (void)resetBtnColor:(UIButton*)btn enumSelect:(int)enum_btn_color ;
+ (void)resetViewColor:(UIView *)view enumSelect:(int)enum_view_color;

//textfield添加左边距
+ (void)setTextFileLeftPadding:(UITextField *)ut leftPadding:(float)leftPadding;

//解析错误信息
+ (NSString *)returnErrorMessage:(id)error;



//跳转页面
+ (void)jumpToVC:(NSString *)strClassName anminated:(BOOL)animated;

//去掉空格
+ (NSString *)exchangeEmpty:(NSString *)str;

//处理小数点
+ (NSString *)exchangeNum:(double)num;

//转换为jsong
+ (NSString *)exchangeToJson:(id)object;

//转换json
+ (NSString *)exchangeModel:(id)model;

//十六进制转颜色
+ (UIColor *)exchangeColorWith16:(NSString*)hexColor;

//移除全部子视图
+ (void)removeAllSubViews:(UIView *)view ;

//隐藏显示tag视图
+ (void)showHideViewWithTag:(int)tag inView:(UIView *)view isshow:(BOOL)isShow;

//显示提示
+ (void)showAlert:(NSString *)strAlert;

//获取版本号
+ (NSString *)getVersion;

//判断是否需要重新登陆
+ (void)judgeReLogin;


#pragma mark 角标清零
+ (void)zeroIcon;

#pragma mark 根据推送的消息进行跳转
+ (void)jumpWithPushJson;

#pragma mark 存储本地数据
+ (void)writeStr:(NSString *)strValue forKey:(NSString *)strKey;

+ (NSString *)readStrFromUser:(NSString *)strKey;

+ (void)writeDate:(NSDate *)date  forKey:(NSString *)strKey;

//写入数据库
+ (void)writeBool:(BOOL)bol local:(NSString *)noti;

+ (BOOL)readBoolLocal:(NSString *)noti;

+ (NSDate *)readDateFromUser:(NSString *)strKey;

//是否接受消息
+ (BOOL)local_readMsgState;
+ (void)local_changeMsgState;

+(NSString *)removeHTML:(NSString *)html;

#pragma mark 拼写文件名
+ (NSString *)fetchDoumentPath:(NSString *)name;

#pragma mark 弹出提示
+ (void)showNotiInStatusBar:(NSString *)strMsg bageNum:(int)msgCount;

#pragma mark 跳转页面 
//跳转店铺
+ (void)jumpToShopDetail:(double )sid;

#pragma mark 判断网络状态
+ (BOOL)IsEnableNetwork;
+ (BOOL)IsEnableWifi;
+ (BOOL)IsENable3G;
@end
