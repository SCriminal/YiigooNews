//
//  RadioView.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/9.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "RadioView.h"

@implementation RadioView

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
    return [self initWithTitles:aryTitle imageNames:nil imageHighNames:nil imageEmptyImageNames:nil frame:frame delegate:delegate];
}

//自定义图片
- (id)initWithTitles:(NSArray *)aryTitle imageNames:(NSArray *)aryNames imageHighNames:(NSArray *)aryHighNames imageEmptyImageNames:(NSArray *)aryEmptyNames frame:(CGRect)frame delegate:(id)delegate{
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
        self.aryImageNames = aryNames;
        self.aryImageHighNames = aryHighNames;
        self.aryImageEmptyNames = aryEmptyNames;
        //添加按钮
        float btnWidth  = ScreenWidth/aryTitle.count;
        float btnHeight = height - Height_SlidView;
        
        for (int i=0; i<aryTitle.count; i++) {
            UIButton *btnTmp = [UIButton buttonWithType:UIButtonTypeCustom];
            btnTmp.tag = i;
            btnTmp.frame = CGRectMake(btnWidth*i, 0, btnWidth, btnHeight);
            btnTmp.backgroundColor = [UIColor whiteColor];
            btnTmp.titleLabel.font = [UIFont systemFontOfSize:14];
            [btnTmp setTitle:aryTitle[i] forState:UIControlStateNormal];
            [btnTmp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btnTmp setTitleColor:COLOR_ORANGE_ML forState:UIControlStateSelected];
            [btnTmp addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btnTmp];
            if (i == 0) {
                btnTmp.selected = YES;
            }
            //添加图片
            if (aryNames != nil) {
                NSString * strName = aryNames[i];
                if (strName.length>0) {
                    UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(btnWidth*i+btnWidth/2+16/320.0*ScreenWidth, btnHeight/2-6, 7, 12)];
                    iv.image = [UIImage imageNamed:@"箭头1"];
                    iv.highlightedImage = [UIImage imageNamed:@"箭头1"];
                    iv.highlighted = YES;
                    iv.tag = 100+i;
                    self.imageViewArr = iv;
                    [self addSubview:iv];
                }
            }
        }
        
        //添加底线
        UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, btnHeight+1, ScreenWidth, 1)];
        viewLine.backgroundColor = COLOR_GRAY_LINE;
        [self addSubview:viewLine];
        
        //添加滑动条
        self.viewSlid = [[UIView alloc]initWithFrame:CGRectMake(0, btnHeight, btnWidth, Height_SlidView )];
        self.viewSlid.backgroundColor = COLOR_ORANGE_ML;
        [self addSubview:self.viewSlid];
        
        //添加分割线
        for (int i=0; i<aryTitle.count-1; i++) {
            UIImageView *lineimage = [[UIImageView alloc] initWithFrame:CGRectMake(btnWidth*(i+1), 12, 1, btnHeight-21)];
            lineimage.backgroundColor = COLOR_GRAY_LINE;
            [self addSubview:lineimage];
        }
    }
    
    return self;
}

//按钮点击
- (void)btnClick:(UIButton *)btn
{
    //设置按钮选择
    NSArray * ary = self.subviews;
    for (UIView * viewSub in ary) {
        if ([viewSub isKindOfClass:[UIButton class]]) {
            UIButton * btnSub = (UIButton *)viewSub;
            //如果选择的没变则返回
            if (btnSub.selected) {
                if (btnSub == btn) {
                //代理回调 重复点击
                    UIImageView * iv = (UIImageView *)[self viewWithTag:100+btn.tag];
                    if (iv != nil) {
                        [self changeImage:iv isEmpty:NO];
                        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioViewRepeat:image:)]) {
                            [self.delegate protocolRadioViewRepeat:btnSub.tag image:iv];
                        }
                    }else{
                        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioViewRepeat:)]) {
                            [self.delegate protocolRadioViewRepeat:btn.tag];
                        }
                    }
                    return;
                }
            }
            btnSub.selected = NO;
            //清空图片
            UIImageView * ivEmpty = (UIImageView *)[self viewWithTag:100+btnSub.tag];
            if (ivEmpty != nil) {
                [self changeImage:ivEmpty isEmpty:YES];
            }

        }
    }
    btn.selected = YES;
    UIImageView * ivSelect = (UIImageView *)[self viewWithTag:100+btn.tag];
    if (ivSelect != nil) {
        [self changeImage:ivSelect isEmpty:NO];
    }

    //滑动条滑动
    [UIView animateWithDuration:0.5 animations:^{
        self.viewSlid.x = btn.x;
    }];
    //代理回调
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioViewBtnSelect:)]) {
        [self.delegate protocolRadioViewBtnSelect:btn.tag];
    }
}

- (void)changeImage:(UIImageView *)iv isEmpty:(BOOL)isEmpty{

    if (isEmpty) {
        self.imageViewArr.image = [UIImage imageNamed:@"箭头1"];
        self.imageViewArr.highlightedImage = [UIImage imageNamed:@"箭头1"];
        self.imageViewArr.backgroundColor = [GlobalMethod exchangeColorWith16:@"fefefe"];
    }else{
        self.imageViewArr.image = [UIImage imageNamed:@"箭头3"];
        self.imageViewArr.highlightedImage = [UIImage imageNamed:@"箭头2"];
        self.imageViewArr.backgroundColor = [UIColor whiteColor];
    }

}

- (void)sliderToIndex:(int)index  noticeDelegate:(BOOL)notice{
    //设置按钮选择
    NSArray * ary = self.subviews;
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
            }else{
                btnSub.selected = NO;
            }
           
        }
    }
    //滑动条滑动
    
    [UIView animateWithDuration:0.3 animations:^{
        self.viewSlid.x = xTo;
    }];
    //代理回调
    if (notice) {
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolRadioViewBtnSelect:)]) {
            [self.delegate protocolRadioViewBtnSelect:index];
        }

    }
    
}


- (NSUInteger)selectIndex{
    NSArray * ary = self.subviews;

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
    UIButton * btn = (UIButton *) [self viewWithTag:index];
    if (btn != nil && [btn isKindOfClass:[UIButton class]]) {
        [btn setTitle:strTitle forState:UIControlStateNormal];
    }
}


@end
