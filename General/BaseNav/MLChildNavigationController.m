//
//  MLChildNavigationController.m
//  MilanPort
//
//  Created by DeanW on 14-8-15.
//  Copyright (c) 2014年 Suibian. All rights reserved.
//

#import "MLChildNavigationController.h"


@interface MLChildNavigationController ()

@end

@implementation MLChildNavigationController

/**
 *  类第一次被调用的时候使用 只调用1次 viewDidLoad会被调用4次
 */
+ (void)initialize
{
    // 1.设置导航条的主题
    [self setupNavTheme];
    
   
    
}

/**
 *  设置导航条的主题
 */
+ (void)setupNavTheme
{
    // 拿到appearance主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//        navBar.tintColor = COLOR_NORMALORANGE;
//    } else {
//        navBar.barTintColor = COLOR_NORMALORANGE;
//    }
    [navBar setBackgroundImage:[UIImage imageWithName:@"home_topbar_bg"] forBarMetrics:UIBarMetricsDefault];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
