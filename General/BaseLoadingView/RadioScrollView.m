//
//  RadioScrollView.m
//  米兰港
//
//  Created by 隋林栋 on 15/7/15.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "RadioScrollView.h"

@implementation RadioScrollView

#define Height_View    46//默认总高度
#define Height_SlidView 2//默认图片



//初始化
- (id)initWithTitles:(NSArray *)aryTitle delegate:(id)delegate
{
    return [self initWithTitles:aryTitle height:Height_View delegate:delegate];
}

- (id)initWithTitles:(NSArray *)aryTitle height:(CGFloat)height delegate:(id)delegate
{
    return [self initWithTitles:aryTitle frame:CGRectMake(0, 0, ScreenWidth, height) delegate:delegate];
}


- (id)initWithTitles:(NSArray *)aryTitle frame:(CGRect)frame delegate:(id)delegate
{
    return [self initWithTitles:aryTitle frame:frame delegate:delegate numPx:10 font:[UIFont systemFontOfSize:14]];
}

- (id)initWithTitles:(NSArray *)aryTitle frame:(CGRect)frame delegate:(id)delegate numPx:(int)numPx font:(UIFont *)font{
    self = [super initWithFrame:frame];
    if (self != nil) {
        
        float height = frame.size.height;
        if (height == 0) {
            height = Height_View;
        }
        
        if (delegate != nil) self.delegate = delegate;
        self.backgroundColor = [UIColor whiteColor];
        if (aryTitle.count == 0) return self;
        //设置frame
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, ScreenWidth, height);
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height)];
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView .showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        //添加按钮
        float numLeft = 0;
        float btnHeight = height - Height_SlidView;
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 1000, 30)];
        label.font = font;
        
        
        for (int i=0; i<aryTitle.count; i++) {
            UIButton *btnTmp = [UIButton buttonWithType:UIButtonTypeCustom];
            btnTmp.tag = i;
            //计算宽度
            label.text = aryTitle[i];
            float numWidth = [GlobalMethod fetchWidthFromLabel:label];
            btnTmp.frame = CGRectMake(numLeft+numPx, 0, numWidth, btnHeight);
            btnTmp.backgroundColor = [UIColor whiteColor];
            btnTmp.titleLabel.font = font;
            [btnTmp setTitle:aryTitle[i] forState:UIControlStateNormal];
            [btnTmp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btnTmp setTitleColor:COLOR_ORANGE_ML forState:UIControlStateSelected];
            [btnTmp addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:btnTmp];
            if (i == 0) {
                btnTmp.selected = YES;
            }
            
            
            if (i<aryTitle.count-1) {
                //添加分割线
                UIImageView *lineimage = [[UIImageView alloc] initWithFrame:CGRectMake(btnTmp.right+numPx, 12, 1, btnHeight-21)];
                lineimage.backgroundColor = COLOR_GRAY_LINE_WHITE;
                [self.scrollView addSubview:lineimage];
                numLeft = lineimage.right;
            }
            self.scrollView.contentSize = CGSizeMake(btnTmp.right+numPx, 0);
            
        }
        
        //添加底线
        UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, btnHeight+1, ScreenWidth, 1)];
        viewLine.backgroundColor = COLOR_GRAY_LINE;
        [self addSubview:viewLine];
        
        //添加滑动条
        label.text = aryTitle[0];
        float numWidth = [GlobalMethod fetchWidthFromLabel:label];
        self.viewSlid = [[UIView alloc]initWithFrame:CGRectMake(numPx, btnHeight, numWidth, Height_SlidView )];
        self.viewSlid.backgroundColor = COLOR_ORANGE_ML;
        [self.scrollView addSubview:self.viewSlid];
        
    }
    
    return self;
}

//按钮点击
- (void)btnClick:(UIButton *)btn
{
    //设置按钮选择
    NSArray * ary = self.scrollView.subviews;
    for (UIView * viewSub in ary) {
        if ([viewSub isKindOfClass:[UIButton class]]) {
            UIButton * btnSub = (UIButton *)viewSub;
            //如果选择的没变则返回
            if (btnSub.selected) {
                if (btnSub == btn) {
                    //代理回调
                    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioScrollViewRepeat:)]) {
                        [self.delegate protocolRadioScrollViewRepeat:btn.tag];
                    }
                    return;
                }
            }
            btnSub.selected = NO;
        }
    }
    [self animateSlide:btn];
    //代理回调
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioScrollViewBtnSelect:)]) {
        [self.delegate protocolRadioScrollViewBtnSelect:btn.tag];
    }
}

- (void)sliderToIndex:(int)index  noticeDelegate:(BOOL)notice{
    //设置按钮选择
    NSArray * ary = self.scrollView.subviews;
    float xTo =0;
    for (UIView * viewSub in ary) {
        if ([viewSub isKindOfClass:[UIButton class]]) {
            UIButton * btnSub = (UIButton *)viewSub;
            //如果选择的没变则返回
            if (btnSub.tag == index) {
                if (btnSub.selected) {
                    
                    return;
                }
                btnSub.selected =YES;
                xTo = btnSub.x;
                [self animateSlide:btnSub];
            }else{
                btnSub.selected = NO;
            }
            
        }
    }
    //滑动条滑动
    
//    [UIView animateWithDuration:0.3 animations:^{
//        self.viewSlid.x = xTo;
//    }];
    //代理回调
    if (notice) {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioScrollViewBtnSelect:)]) {
            [self.delegate protocolRadioScrollViewBtnSelect:index];
        }
        
    }
    
}


- (NSUInteger)selectIndex{
    NSArray * ary = self.scrollView.subviews;
    
    for (UIView * viewSub in ary) {
        if ([viewSub isKindOfClass:[UIButton class]]) {
            UIButton * btnSub = (UIButton *)viewSub;
            
            if (btnSub.selected) {
                return btnSub.tag;
            }
            
        }
    }
    return 0;
    
}

- (void)refreshBtn:(int)index title:(NSString *)strTitle{
    UIButton * btn = (UIButton *) [self.scrollView viewWithTag:index];
    if (btn != nil && [btn isKindOfClass:[UIButton class]]) {
        [btn setTitle:strTitle forState:UIControlStateNormal];
    }
}


#pragma mark 滑动动画
- (void)animateSlide:(UIButton *)btn{
    btn.selected = YES;
    
    //滑动条滑动
    [UIView animateWithDuration:0.5 animations:^{
        self.viewSlid.x = btn.x;
        self.viewSlid.width = btn.width;
        float numX = ScreenWidth/2-btn.centerX;
        
        //判断是否可以滑动
        if (self.scrollView.contentSize.width-ScreenWidth>0) {
            if (-numX<0) {
                self.scrollView.contentOffset = CGPointMake(0, 0);
            }else if(-numX>self.scrollView.contentSize.width-ScreenWidth){
                self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width-ScreenWidth, 0);
            }else{
                self.scrollView.contentOffset = CGPointMake(-numX, 0);
            }
        }
    }];

}
@end
