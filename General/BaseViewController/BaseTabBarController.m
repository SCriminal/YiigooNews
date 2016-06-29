//
//  BaseTabBarController.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "BaseTabBarController.h"

//首页
#import "MainViewController.h"
//新闻详情页
#import "NewsDetailViewController.h"
//评论页
#import "CommentViewController.h"
//我的
#import "SelfViewController.h"

//rootnav
#import "BaseNavigationViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController


#pragma mark 初始化
- (instancetype)init{
    self = [super init];
    if (self) {
        MainViewController * mainVC = [[MainViewController alloc]init];
        BaseNavigationViewController * navMain = [[BaseNavigationViewController alloc]initWithRootViewController:mainVC];
        GB_Nav = navMain;
        
        
        NewsDetailViewController * newsVC = [[NewsDetailViewController alloc]init];
        BaseNavigationViewController * navNews = [[BaseNavigationViewController alloc]initWithRootViewController:newsVC];
        
        SelfViewController * selfVC = [[SelfViewController alloc]init];
        BaseNavigationViewController * navSelf = [[BaseNavigationViewController alloc]initWithRootViewController:selfVC];
        
        self.viewControllers = [NSArray arrayWithObjects:navMain,navNews,navSelf,nil];

    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden = YES;
    self.CustomTabBar =[[CustomTabBar  alloc]initWithFrame:CGRectMake(0, screenHeight-GB_ToolBarHeight, screenWidth, GB_ToolBarHeight)];
    [self.view addSubview:self.CustomTabBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 隐藏自定义tabbar
- (void)hideCustomBar{
    [UIView animateWithDuration:0.3 animations:^{
        self.CustomTabBar.alpha = 0;
    }];
}

- (void)showCustomBar{
    [UIView animateWithDuration:0.3 animations:^{
        self.CustomTabBar.alpha = 1;
    }];

}

@end
