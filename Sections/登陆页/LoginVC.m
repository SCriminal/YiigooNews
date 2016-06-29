//
//  LoginVC.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/13.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "LoginVC.h"

//联合登录
//shareSDK
#import <ShareSDK/ShareSDK.h>

@interface LoginVC ()

@end

@implementation LoginVC
#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1://返回
        {
            
        }
            break;
        case 2://qq联合登录
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeQQ
                   onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
             {
                 if (state == SSDKResponseStateSuccess)
                 {
                     
                     NSLog(@"uid=%@",user.uid);
                     NSLog(@"%@",user.credential);
                     NSLog(@"token=%@",user.credential.token);
                     NSLog(@"nickname=%@",user.nickname);
                 }
                 
                 else
                 {
                     NSLog(@"%@",error);
                 }
                 
             }];
        }
            break;
        case 3://微信联合登录
        {
            [ShareSDK getUserInfo:SSDKPlatformTypeWechat
                   onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
             {
                 if (state == SSDKResponseStateSuccess)
                 {
                     
                     NSLog(@"uid=%@",user.uid);
                     NSLog(@"%@",user.credential);
                     NSLog(@"token=%@",user.credential.token);
                     NSLog(@"nickname=%@",user.nickname);
                 }
                 
                 else
                 {
                     NSLog(@"%@",error);
                 }
                 
             }];

        }
            break;
        default:
            break;
    }
}


#pragma mark 初始化

- (void)viewDidLoad{
    
}
//初始化数据，在initViews前调用
- (void)initData
{
    [super initData];
}

//生成视图，视图相关的总入口
- (void)initViews
{
    [super initViews];

}

//生成网络请求
- (void)initRequest
{
    [super initRequest];
    //初始化请求
}

@end
