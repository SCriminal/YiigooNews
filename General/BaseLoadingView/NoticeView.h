//
//  NoticeView.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/5.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeView : UIView
@property (weak, nonatomic) IBOutlet UIControl *control;

@property (weak, nonatomic) IBOutlet UIView *viewBG;
@property (weak, nonatomic) IBOutlet UILabel *labelNotice;
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic) int numTime;

- (void)showNotice:(NSString *)strNotice time:(int)timeShow  viewShow:(UIView *)viewShow   vcShow:(UIViewController *)vcShow;

@end
