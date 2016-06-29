//
//  BaseSubViewController.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/10.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseSubViewController : BaseViewController



//添加nav
- (void)addNavBarWithTitle:(NSString *)title;

//添加nav
- (void)addNavBarWithTitle:(NSString *)title rightView:(UIView *)viewRight;

//添加nav
- (void)addNavOrangeBarWithTitle:(NSString *)title rightView:(UIView *)viewRight;

//返回按钮点击
- (void)btnBackClick;

@end
