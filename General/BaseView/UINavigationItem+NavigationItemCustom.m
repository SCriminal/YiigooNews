//
//  UINavigationItem+NavigationItemCustom.m
//  TestNavCustom
//
//  Created by 隋林栋 on 16/5/5.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "UINavigationItem+NavigationItemCustom.h"

@implementation UINavigationItem (NavigationItemCustom)

- (void)setupRightBarButton:(UIBarButtonItem*)item{
    UIBarButtonItem * negativeSpacer2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //-16  -20
    if ([UIScreen mainScreen].bounds.size.width<375) {
        negativeSpacer2.width = -16;
    }else {
        negativeSpacer2.width = -20;
    }
    self.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer2,item,nil];
}

- (void)setupLeftBarButton:(UIBarButtonItem*)item{
    UIBarButtonItem * negativeSpacer2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //-16  -20
    if ([UIScreen mainScreen].bounds.size.width<375) {
        negativeSpacer2.width = -16;
    }else {
        negativeSpacer2.width = -20;
    }
    self.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer2,item,nil];
}

@end
