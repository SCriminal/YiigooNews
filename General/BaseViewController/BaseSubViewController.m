//
//  BaseSubViewController.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/10.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseSubViewController.h"

#import "MLSubTopView.h"

@interface BaseSubViewController ()

@end

@implementation BaseSubViewController


#pragma mark 改变vc底部颜色
- (void)initViews{
    [super initViews];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"second_topbar_bg"]];
}

//添加nav
- (void)addNavBarWithTitle:(NSString *)title{
    MLSubTopView *mlSubTop = [[MLSubTopView alloc] initWithFrame:CGRectMake(0, GB_StatusBarHeight, ScreenWidth, GB_NavBarHeight) title:title target:self selecter:@selector(btnBackClick)];
    [self.view addSubview:mlSubTop];

}

//添加nav
- (void)addNavBarWithTitle:(NSString *)title rightView:(UIView *)viewRight{
    MLSubTopView *mlSubTop = [[MLSubTopView alloc] initWithFrame:CGRectMake(0, GB_StatusBarHeight, ScreenWidth, GB_NavBarHeight) title:title target:self selecter:@selector(btnBackClick) showRightBtn:NO];
    
    
    if (viewRight!= nil) {
        viewRight.frame = CGRectMake(ScreenWidth-viewRight.width, 0, viewRight.width, viewRight.height);
        [mlSubTop addSubview:viewRight];
    }
    
    [self.view addSubview:mlSubTop];
    
    
}

//添加nav
//添加nav
- (void)addNavOrangeBarWithTitle:(NSString *)title rightView:(UIView *)viewRight{
//    MLSubTopView *mlSubTop = [[MLSubTopView alloc] initWithFrame:CGRectMake(0, GB_StatusBarHeight, self.view.frame.size.width, GB_NavBarHeight) title:title target:self selecter:@selector(btnBackClick) showRightBtn:NO];
    MLSubTopView *mlSubTop = [[MLSubTopView alloc] initWithFrame:CGRectMake(0, GB_StatusBarHeight, ScreenWidth, GB_NavBarHeight) title:title titleColor:[UIColor whiteColor] imageLeft:@"btn_back_white_nor" target:self selecter:@selector(btnBackClick) showRightBtn:NO];

    mlSubTop.backgroundColor = COLOR_NORMALORANGE;
    
    
    if (viewRight!= nil) {
        viewRight.frame = CGRectMake(ScreenWidth-viewRight.width, 0, viewRight.width, viewRight.height);
        [mlSubTop addSubview:viewRight];
    }
    
    [self.view addSubview:mlSubTop];
    
    
}


- (void)btnBackClick{
    [GB_Nav popViewControllerAnimated:YES];
}


#pragma mark 改变statusbar 颜色
//改变statusbar颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end