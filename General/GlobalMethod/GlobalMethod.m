//
//  GlobalMethod.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/3.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "GlobalMethod.h"


//登陆页
#import "LoginVC.h"

//基础请求

#import "AppDelegate.h"


//数学
#import <math.h>
//提示框
#import "NoticeView.h"
//model用户
#import "ModelUserBaseClass.h"

//root tabbar
#import "BaseTabBarController.h"
//root mainVC
#import "MainViewController.h"
#import "BaseNavigationViewController.h"
//网络请求
#import "AFNetworkReachabilityManager.h"

@implementation GlobalMethod

//创建rootNav
+ (void)createRootNav{
//    BaseTabBarController * baseTabBar = [[BaseTabBarController alloc]init];
    MainViewController * mainVC = [[MainViewController alloc]init];
    BaseNavigationViewController * navMain = [[BaseNavigationViewController alloc]initWithRootViewController:mainVC];
    GB_Nav = navMain;
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    delegate.window.rootViewController = GB_Nav;
    [delegate.window makeKeyAndVisible];
}

//获取更新版本
+ (void)requestVersionSuccess:(NSDictionary *)responseObject{
    //比较时间

    NSDate * dateUp = [[NSUserDefaults standardUserDefaults]objectForKey:LOCAL_TIME_VERSION];
   
    if (dateUp != nil && [dateUp isKindOfClass:[NSDate class]]) {
        NSTimeInterval  timeInterval = [dateUp timeIntervalSinceNow];
        timeInterval = -timeInterval;
        
        if (timeInterval/60/60 > 24) {
//            ModelVersion_BaseClass * modelVersion = [ModelVersion_BaseClass modelObjectWithDictionary:responseObject];
//            VersionUpdateView * versionView = [[[NSBundle mainBundle]loadNibNamed:@"VersionUpdateView" owner:nil options:nil]lastObject];
//            [versionView showViewWithData:modelVersion];
        }
        
    }else{
//        ModelVersion_BaseClass * modelVersion = [ModelVersion_BaseClass modelObjectWithDictionary:responseObject];
//        VersionUpdateView * versionView = [[[NSBundle mainBundle]loadNibNamed:@"VersionUpdateView" owner:nil options:nil]lastObject];
//        [versionView showViewWithData:modelVersion];
    }
   
    
    
}



//提交token
+ (void)requestUpTokenisExit:(BOOL)isexit{
    NSString * strToken = [GlobalMethod readStrFromUser:LOCAL_TOKEN];
    if (strToken == nil || strToken.length ==0) return;
    
//    [[GlobalRequest sharedInstance].Request_Up_Token.operationQueue cancelAllOperations];
//    //等于1  退出
//    [[GlobalRequest sharedInstance].Request_Up_Token requestUpDateTokendeviceToken:strToken isexit:[NSString stringWithFormat:@"%d",isexit] success:^(AFHTTPRequestOperation *operation, id responseObject) {
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
}

//注销
+ (void)logoutSuccess{
    //清除全局数据
    GlobalData * gbData = [GlobalData sharedInstance];
    gbData.GB_MsgUnRead_Private = 0;
    gbData.GB_MsgUnRead_System = 0;
    gbData.GB_MsgUnRead = 0;
    gbData.GB_UserModel = nil;
    [self requestUpTokenisExit:YES];
    
    //清除本地数据
    [GlobalMethod writeStr:@"" forKey:LOCAL_PWD];
    [GlobalMethod writeBool:NO local:LOCAL_RECEIVE_TUISONG];
    [GlobalMethod writeStr:@"" forKey:LOCAL_PUSH_JSON];
    
    //重置根视图
    AppDelegate * delegate = (AppDelegate *) [UIApplication sharedApplication].delegate ;
    [delegate initRootNav];
    

    
    
}

//判断是否登陆
+(BOOL)isLoginSuccess{
    GlobalData * gbData = [GlobalData sharedInstance];
    if (gbData.GB_UserModel == nil) {
        return NO;
    }
    return YES;
}

+ (void)loginWithBlock:(void (^)(void))block {

    if ([self isLoginSuccess]) {
        block();
    }else{
        LoginVC *loginVC = [[LoginVC alloc]initWithNibName:@"LoginVC" bundle:nil];
        loginVC.blockLoginSuccess = block;
        [GB_Nav pushViewController:loginVC animated:YES];
    }
   
}




// 自动登陆
+ (void)autoLogin
{
    NSLog(@"autoLogin");
    NSString * username = [GlobalMethod readStrFromUser:LOCAL_USER_NAME];
    NSString * password = [GlobalMethod readStrFromUser:LOCAL_PWD];
    if (password == nil || password.length == 0) {
        return;
    }
//    [[GlobalRequest sharedInstance].Request_Login.operationQueue cancelAllOperations];
//    [[GlobalRequest sharedInstance].Request_Login requestLoginUserName:username Password:password success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [self loginSuccess:responseObject userName:username pwd:password];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//    }];
}

//登陆成功
+ (void)loginSuccess:(NSDictionary *)dicReturn  userName:(NSString *)userName pwd:(NSString *)pwd{
    
    if (userName != nil) {
        //存储用户名 密码
        [GlobalMethod writeStr:userName forKey:LOCAL_USER_NAME];
        [GlobalMethod writeStr:pwd forKey:LOCAL_PWD];
    }
    
    //存储数据
    ModelUserBaseClass *modelB = [ModelUserBaseClass modelObjectWithDictionary:dicReturn];
    // 重置程序主控制器，完成页面跳转
    GlobalData * gbData = [GlobalData sharedInstance];
    gbData.GB_UserModel = modelB;
    //获取未读信息
    [GlobalMethod fetchUnReadMessage];
    
//    [UIApplication sharedApplication].statusBarHidden = NO;// 显示状态栏
    
    [self requestUpTokenisExit:NO];
    
}




//读取未读信息
+ (void)fetchUnReadMessage{
//    [[GlobalRequest sharedInstance].Request_Unread_Message.operationQueue cancelAllOperations];
//    
//    [[GlobalRequest sharedInstance].Request_Unread_Message rquestUnReadMessagesuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        ModelMsgUnReadBaseClass * modelMsg = [ModelMsgUnReadBaseClass modelObjectWithDictionary:responseObject];
//        
//        GlobalData * gbData = [GlobalData sharedInstance];
//        
//        for (ModelMsgUnReadItems * modelItem in modelMsg.items) {
//            if (modelItem.messageType == 4) {
//                gbData.GB_MsgUnRead_System = modelItem.rowcounts;
//            }
//            if (modelItem.messageType == 1) {
//                gbData.GB_MsgUnRead_Private =modelItem.rowcounts;
//            }
//        }
//        gbData.GB_MsgUnRead = gbData.GB_MsgUnRead_Private+gbData.GB_MsgUnRead_System;
//        
//        [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_UNREAD_MESSAGE object:nil];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
}

+ (void)setTextFileLeftPadding:(UITextField *)ut leftPadding:(float)leftPadding{
    CGRect frame = ut.frame;
    frame.size.width = leftPadding;
    UIView *leftV = [[UIView alloc] initWithFrame:frame];
    ut.leftViewMode = UITextFieldViewModeAlways;
    ut.leftView = leftV;
}


#pragma mark //解析错误信息
+ (NSString *)returnErrorMessage:(id)error{
    if (error == nil) {
        return @"错误为空";
    }
    if ([error isKindOfClass:[NSString class]]) {
        NSString * strError = (NSString *)error;
        if (strError.length >0) {
            return strError;
        }
        return @"错误为空";
    }
    if ([error isKindOfClass:[NSDictionary class]]) {
        NSString * strError = [error objectForKey:@"Message"];
        return  strError;
    }
    return  @"错误为空";
}


#pragma mark 角标清零
+ (void)zeroIcon{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];

}

#pragma mark 计算label size
+ (CGFloat)fetchSizeFromLabel:(UILabel *)label{
    return [self fetchSizeFromLabel:label heightLimit:10000];
}

+ (CGFloat)fetchSizeFromLabel:(UILabel *)label heightLimit:(CGFloat )height{
    if (label == nil||label.text==nil) {
        return 0;
    }
    NSString * strContent = label.text;
    UIFont * font = label.font;
    NSAttributedString * attributeString = [[NSAttributedString alloc]initWithString:strContent attributes:@{NSFontAttributeName: font}];
    CGRect rect =[attributeString boundingRectWithSize:CGSizeMake(label.width, height)  options:NSStringDrawingUsesLineFragmentOrigin context:nil];
//    label.autoresizingMask = UIViewAutoresizingNone;
    CGFloat num_height_return = rect.size.height+1;
    //限制行数
    if (label.numberOfLines != 0) {
        attributeString = [[NSAttributedString alloc]initWithString:@"A" attributes:@{NSFontAttributeName: font}];
        rect =[attributeString boundingRectWithSize:CGSizeMake(label.width, height)  options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        num_height_return = num_height_return >label.numberOfLines*rect.size.height?label.numberOfLines*rect.size.height:num_height_return;
    }
   
    return ceil(num_height_return) ;
}

+ (CGFloat)fetchWidthFromLabel:(UILabel *)label{
    NSString * strContent = label.text;
    UIFont * font = label.font;
    NSAttributedString * attributeString = [[NSAttributedString alloc]initWithString:strContent attributes:@{NSFontAttributeName: font}];
    CGRect rect =[attributeString boundingRectWithSize:CGSizeMake(1000, 1000)  options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return ceil(rect.size.width);
}


+ (void)setRoundBtn:(UIView *)view btnBgColor:(UIColor *)colorBtn{
    if (colorBtn == nil) {
        view.backgroundColor = COLOR_NORMALORANGE;
    }else{
        view.backgroundColor = colorBtn;
    }
    [self setRoundView:view color:COLOR_CLEAR numRound:NUM_BTN_ROUND width:4];
}

//设置圆角
+ (void)setRoundView:(UIView *)iv color:(UIColor *)color
{
    [self setRoundView:iv color:color numRound:4 width:4];
}
//设置圆角
+ (void)setRoundView:(UIView *)iv color:(UIColor *)color numRound:(int)numRound width:(int)width
{
    iv.layer.cornerRadius = numRound;//圆角设置
    iv.layer.masksToBounds = YES;
    [iv.layer setBorderWidth:width];
    iv.layer.borderColor = color.CGColor;
}

+ (void)resetViewColor:(UIView *)view enumSelect:(int)enum_view_color{
    switch (enum_view_color) {
        case ENUM_SLD_ORANGE:{
            view.backgroundColor = COLOR_NORMALORANGE;
        }
            break;
        case ENUM_SLD_YELLOW:{
            view.backgroundColor = COLOR_NORMALYELLOW;
        }
            break;
        case ENUM_SLD_GRAY:{
            view.backgroundColor = COLOR_NORMALGRAY;
        }
            break;
        default:
            break;
    }

}

+ (void)resetBtnColor:(UIButton *)btn enumSelect:(int)enum_btn_color{
    switch (enum_btn_color) {
        case ENUM_SLD_YELLOW:{
            [self resetBtnWithBtn:btn image:@"6X6正常黄正常" imageClick:@"6X6正常黄按下"];
        }
            break;
        case ENUM_SLD_ORANGE:{
            [self resetBtnWithBtn:btn image:@"6X6正常红" imageClick:@"6X6正常红按下"];
        }
            break;
        case ENUM_SLD_GRAY:{
            [self resetBtnWithBtn:btn image:@"6X6正常白" imageClick:@"6X6正常白按下"];
        }
            break;
        default:
            break;
    }
}
+ (void)resetBtnWithBtn:(UIButton *)btn image:(NSString *)imageName  imageClick:(NSString *)imageNameClick{
    UIImage * image = [UIImage imageNamed:imageName];
    UIImage * imageResize = [image resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    [btn setBackgroundImage:imageResize forState:UIControlStateNormal];
    
    UIImage * imageClick = [UIImage imageNamed:imageNameClick];
    UIImage * ImageClickResize = [imageClick resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    [btn setBackgroundImage:ImageClickResize forState:UIControlStateHighlighted];
}


#pragma mark 读存本地数据

//写入数据库
+ (void)writeBool:(BOOL)bol local:(NSString *)noti{
    if (noti == nil || noti.length==0) {
        return;
    }
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setObject:[NSNumber numberWithBool:bol] forKey:noti];
    [user synchronize];
    
}

+ (BOOL)readBoolLocal:(NSString *)noti{
    if (noti == nil || noti.length==0) {
        return NO;
    }
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [user objectForKey:noti];
    if (num == nil) return NO;
    return [num boolValue];
}


//是否接受消息
+ (BOOL)local_readMsgState{
   BOOL notReceice = [self readBoolLocal:LOCAL_RECEIVE_TUISONG];
    return !notReceice;
}

+ (void)local_changeMsgState{
    BOOL notReceice = [self readBoolLocal:LOCAL_RECEIVE_TUISONG];
    [self writeBool:!notReceice local:LOCAL_RECEIVE_TUISONG];
}

//跳转页面
+ (void)jumpToVC:(NSString *)strClassName anminated:(BOOL)animated{
    id vc = [[NSClassFromString(strClassName) alloc]init];
    [GB_Nav pushViewController:vc animated:animated];

}

//处理小数点
+ (NSString *)exchangeNum:(double)num{
    NSString * strReturn =[NSString stringWithFormat:@"%.02f",round(num*100)/100 ];
    return strReturn;
}

//去掉空格
+ (NSString *)exchangeEmpty:(NSString *)str{
    
    if (str == nil || ![str isKindOfClass:[NSString class]]) {
        return @"";
    }
    NSString * strReturn = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return strReturn;
}

//转换为jsong
+ (NSString *)exchangeToJson:(id)object{
    if (object == nil) {
        NSLog(@"error json转换错误");
        return @"";
    }
    NSData * dataJson = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    NSString * strJson = [[NSString alloc]initWithData:dataJson encoding:NSUTF8StringEncoding];
    return strJson;
}

//转换json
+ (NSString *)exchangeModel:(id)model{
    NSDictionary * dicJson = [model dictionaryRepresentation];
    NSData * dataJson = [NSJSONSerialization dataWithJSONObject:dicJson options:NSJSONWritingPrettyPrinted error:nil];
    NSString * strJson = [[NSString alloc]initWithData:dataJson encoding:NSUTF8StringEncoding];
    return strJson!=nil?strJson:@"";
}

//十六进制转颜色
+ (UIColor *)exchangeColorWith16:(NSString*)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:1.0f];
}


//移除全部子视图
+ (void)removeAllSubViews:(UIView *)view{
    if (view == nil) return;
    NSArray * aryView = view.subviews;
    for (UIView * viewSub in aryView) {
        [viewSub removeFromSuperview];
    }
}

//隐藏显示tag视图
+ (void)showHideViewWithTag:(int)tag inView:(UIView *)viewAll isshow:(BOOL)isShow{
    UIView * viewTag = [viewAll viewWithTag:tag];
    if (viewTag != nil) {
        viewTag.hidden = !isShow;
    }
}

//显示提示
+ (void)showAlert:(NSString *)strAlert{
    NoticeView * noticeView = [[[NSBundle mainBundle]loadNibNamed:@"NoticeView" owner:nil options:nil]lastObject];
    [noticeView showNotice:strAlert time:1 viewShow:nil vcShow:nil];
    
}

//获取版本号
+ (NSString *)getVersion{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
//    CFShow(infoDic);
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}

//判断是否需要重新登陆
+ (void)judgeReLogin{
   //如果没登陆就不判定
    GlobalData * gbData = [GlobalData sharedInstance];
    if (gbData.GB_UserModel ==nil || gbData.GB_UserModel.userName == nil )return;
    
    NSDate * dateLocal = [self readDateFromUser:LOCAL_TIME_RELOGIN];
    if (dateLocal != nil && [dateLocal isKindOfClass:[NSDate class]]) {
        NSTimeInterval  timeInterval = [dateLocal timeIntervalSinceNow];
        timeInterval = -timeInterval;
        
        if (timeInterval/60/60 > 24) {
            [self logoutSuccess];
        }
        
    }

}

#pragma mark 根据推送的消息进行跳转
+ (void)jumpWithPushJson{
//    GlobalData * gbData = [GlobalData sharedInstance];
//    if (gbData.GB_UserModel == nil) {
//        //如果没有用户就不跳转
//        return;
//    }
//    NSString * strJson = [self readStrFromUser:LOCAL_PUSH_JSON];
//    if (strJson != nil &&strJson.length >0) {
//        NSData * data = [strJson dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary * dicItem = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        Model_Push_BaseClass * modelPush = [Model_Push_BaseClass modelObjectWithDictionary:dicItem];
//        switch ([modelPush.type intValue]) {
//            case 1://消息列表
//            {
//                MLMessageViewController   *messageVC   = [[MLMessageViewController   alloc] init];
//                messageVC.isJumpPrivious = YES;
//                [GB_Nav pushViewController:messageVC animated:NO];
//            }break;
//            case 2://消息详情
//            {
//                MLMessageViewController   *messageVC   = [[MLMessageViewController   alloc] init];
//                messageVC.isJumpPrivious = YES;
//                [GB_Nav pushViewController:messageVC animated:NO];
//            }break;
//            case 3://商品
//            {
//                ProductDetailViewController * productVC = [[ProductDetailViewController alloc]init];
//                productVC.productId = [modelPush.productId intValue];
//                [GB_Nav pushViewController:productVC animated:NO];
//            }break;
//            case 4://订单卖家 订单详情
//            {
//                ManageOrderDetailViewController * orderDetailVC = [[ManageOrderDetailViewController alloc]initWithOrderID:modelPush.orderId ordertype:0 isweb:0 delegate:nil];
//                [GB_Nav pushViewController:orderDetailVC animated:NO];
//            }break;
//            case 5://订单列表
//            {
//                //默认样品
//                MLOrderShowViewController *orderS = [[MLOrderShowViewController alloc] initWithCurrentTag:2 isWeb:1 firstIn:1];
//                [GB_Nav pushViewController:orderS animated:NO];
//            }break;
//            case 6://店铺
//            {
//                [self jumpToShopDetail:[modelPush.sid intValue]];
//            }break;
//            case 7://专题 预留
//            {
//            }break;
//            case 8://网页
//            {
//                HomeAdViewController * webVC = [[HomeAdViewController alloc]init];
//                webVC.strURL = modelPush.url;
//                [GB_Nav pushViewController:webVC animated:NO];
//            }break;
//            default:
//                break;
//        }
//    }
//    [self writeStr:@"" forKey:LOCAL_PUSH_JSON];
  
}

#pragma mark 存储本地数据
+ (void)writeStr:(NSString *)strValue forKey:(NSString *)strKey{
    if ([self isStr:strKey ] && strValue) {
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        [user setObject:strValue  forKey:strKey];
        [user synchronize];
    }
}

+ (void)writeDate:(NSDate *)date  forKey:(NSString *)strKey{
    if (date == nil ) return;
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setObject:date  forKey:strKey];
    [user synchronize];
}

+ (NSString *)readStrFromUser:(NSString *)strKey{
    if ([self isStr:strKey]) {
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        NSString * strValue = [user objectForKey:strKey];
        if (strValue != nil && [strValue isKindOfClass:[NSString class]]&& strValue.length>0) {
            return strValue;
        }
    }
    return @"";
}

+ (NSDate *)readDateFromUser:(NSString *)strKey{
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    NSDate * dateLocal = [user objectForKey:strKey];
    return dateLocal;
}

#pragma mark 验证字符串

+ (BOOL)isStr:(NSString *)str{
    if (str != nil && [str isKindOfClass:[NSString class]] ) {
        return YES;
    }
    return NO;
}

+ (BOOL)isDic:(NSDictionary *)dic{
    if (dic != nil && [dic isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}


+(NSString *)removeHTML:(NSString *)html {
    
    NSScanner *theScanner;
    
    NSString *text = nil;
    
    
    
    theScanner = [NSScanner scannerWithString:html];
    
    
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        
        
        // find end of tag
        
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        
        
        // replace the found tag with a space
        
        //(you can filter multi-spaces out later if you wish)
        
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@" "];
        
        
        
    }
    
    return html;
    
}

#pragma mark 弹出提示
+ (void)showNotiInStatusBar:(NSString *)strMsg  bageNum:(int)msgCount{
    UILocalNotification* noti = [[UILocalNotification alloc]init];
    NSDate* now = [NSDate date];
    noti.fireDate = [now dateByAddingTimeInterval:4];
    noti.timeZone = [NSTimeZone defaultTimeZone];
    noti.alertBody = strMsg;
    noti.soundName = UILocalNotificationDefaultSoundName;
    noti.alertAction = strMsg;
    noti.applicationIconBadgeNumber = msgCount;
//    [noti setUserInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1], @"notikey", nil]];
    //NSLog(@"您有%d条消息需要处理",msgCount);
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
}

#pragma mark 拼写文件名
+ (NSString *)fetchDoumentPath:(NSString *)name{
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"sld"];
    
    BOOL bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];

    NSString *result = [path stringByAppendingPathComponent:name];
    
    return result;
}

#pragma mark 获取ip
+  (NSString *)fetchIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
//    success = getifaddrs(&interfaces);
//    if (success == 0) {
//        // Loop through linked list of interfaces
//        temp_addr = interfaces;
//        while (temp_addr != NULL) {
//            if( temp_addr->ifa_addr->sa_family == AF_INET) {
//                // Check if interface is en0 which is the wifi connection on the iPhone
//                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
//                    // Get NSString from C String
//                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
//                }
//            }
//            
//            temp_addr = temp_addr->ifa_next;
//        }
//    }
//    
//    // Free memory
//    freeifaddrs(interfaces);
    
    return address;
}

//跳转店铺
+ (void)jumpToShopDetail:(double )sid{
//    ShopDetailHtmlViewController * shopHtmlVC = [[ShopDetailHtmlViewController alloc]init];
//    shopHtmlVC.supplerID = sid;
//    [GB_Nav pushViewController:shopHtmlVC animated:YES];
}


#pragma mark 判断网络状态
+ (BOOL)IsEnableNetwork{
    if ([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] == AFNetworkReachabilityStatusNotReachable) {
        return NO;
    }
    return YES;
}

+ (BOOL)IsEnableWifi{
    return ([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] == AFNetworkReachabilityStatusReachableViaWiFi);

}

+ (BOOL)IsENable3G{
    return ([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] == AFNetworkReachabilityStatusReachableViaWWAN);

}

@end
