//
//  CustomTabBar.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "CustomTabBar.h"


@implementation CustomTabBar


#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1://主页
        {
            [GB_Nav popToRootViewControllerAnimated:YES];
        }
            break;
            case 2://评论
        {
//            TestVC * testVC = [[TestVC alloc]init];
//            [GB_Nav pushViewController:testVC animated:YES];
        }
            break;
            case 3://我的
        {
            
        }
            break;
        default:
            break;
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"CustomTabBar" owner:self options:nil]lastObject];
        self.frame = frame;
    }
    return self;
}
@end
