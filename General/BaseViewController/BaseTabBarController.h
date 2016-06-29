//
//  BaseTabBarController.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>

//自定义tabbar
#import "CustomTabBar.h"

@interface BaseTabBarController : UITabBarController

@property (strong, nonatomic) CustomTabBar * CustomTabBar;


- (void)hideCustomBar;

@end
