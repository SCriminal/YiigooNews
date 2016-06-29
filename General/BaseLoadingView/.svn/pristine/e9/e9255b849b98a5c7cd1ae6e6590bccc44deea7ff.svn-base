//
//  NoticeView.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/5.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "NoticeView.h"
#import "GlobalMethod.h"

@implementation NoticeView

- (void)awakeFromNib{
    //设置圆角
    [GlobalMethod setRoundView:self.viewBG color:[UIColor clearColor]];
    
}


- (void)showNotice:(NSString *)strNotice time:(int)timeShow  viewShow:(UIView *)viewShow   vcShow:(UIViewController *)vcShow{
    //去掉空格
    NSArray * aryStr = [strNotice componentsSeparatedByString:@" "];
    strNotice = [aryStr componentsJoinedByString:@""];
    
    if (viewShow != nil) {
        self.frame = viewShow.frame;
    }else{
        self.frame = [UIScreen mainScreen].bounds;
    }
    self.control.frame = self.bounds;
    
    [self timerStop];
    
    self.labelNotice.width = ScreenWidth-40;

    
    //设置label
    self.labelNotice.text = strNotice;
    CGFloat height = [GlobalMethod fetchSizeFromLabel:self.labelNotice];
    self.labelNotice.height = height;
    self.viewBG.height = height+16;
    self.viewBG.y = self.height-self.viewBG.height-60;
    
    CGFloat width;
    if (height>24) {
        width = self.labelNotice.width;
    }else{
        //设置宽度
        width = [GlobalMethod fetchWidthFromLabel:self.labelNotice];
    }
    
    
    self.viewBG.width = width+20;
    self.viewBG.centerX = ScreenWidth/2;
    self.labelNotice.centerX = self.viewBG.width/2;
   
    if (vcShow != nil) {
        [vcShow.view addSubview:self];
    }else{

        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
    }
    
    //启动定时器
    self.numTime = timeShow;
    [self timerStart];
}



#pragma mark 定时器相关
- (void)timerStart{
    //开启定时器
    if (_timer == nil) {
        _timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    }
    
}

- (void)timerRun{
    //每秒的动作
    if (_numTime <=0) {
        //刷新按钮 开始
        [self timerStop];
        return;
    }
    _numTime --;
    
    
}

- (void)timerStop{
    //停止定时器
    if (_timer != nil) {
        [_timer invalidate];
        self.timer = nil;
    }
    
    [self removeFromSuperview];
    
   
}

- (void)dealloc{
    
}

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    [self timerStop];
}

@end
