//
//  BaseNavigationViewController.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/24.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController


#pragma mark 屏幕旋转
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //    return UIInterfaceOrientationMaskLandscapeLeft;
       return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
       return NO;
}





@end