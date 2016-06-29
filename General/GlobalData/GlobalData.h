//
//  GlobalData.h
//  ChinaDream
//
//  Created by zhangfeng on 12-11-26.
//  Copyright (c) 2012年 eastedge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ModelUserBaseClass.h"


//仅在appdelegate里赋值，无需做成实例变量
extern UINavigationController *GB_Nav;//全局导航条
extern float GB_StartYCoordinate;//起始Y坐标
extern float GB_StatusBarHeight;//状态栏高度
extern float GB_NavBarHeight;//导航条的高度
extern float GB_ToolBarHeight;//工具栏高度

/*
 GB_UserName,GB_Pwd,GB_Permission会出现多次值的更改，所以要做成实例变量，可调用set方法来改变值
 这样可以避免写太多的alloc和release
 例如：要给GB_UserName重新赋值，[GB_UserName release];GB_UserName = nil;GB_UserName=[[NSString alloc] initWithString:@"aaa"];
    现在只需要这样调用[[GlobalData sharedGlobalData] setGB_UserName:@"aaa"];
 */

@interface GlobalData : NSObject

@property (nonatomic, strong) ModelUserBaseClass * GB_UserModel;//用户模型
@property int GB_MsgUnRead_Private;//消息
@property int GB_MsgUnRead_System;
@property int GB_MsgUnRead;
@property int GB_Tabbar_Btn;//分页导航页切换

//单例
+ (GlobalData *)sharedInstance;

//释放所有的全局变量，在方法- (void)applicationWillTerminate:(UIApplication *)application里调用
//+ (void)releaseGlobalData;

@end
