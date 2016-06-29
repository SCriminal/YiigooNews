//
//  BaseAlertView.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/11.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseAlertView.h"

@implementation BaseAlertView

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1://消失
        {
            [self removeFromSuperview];
        }
            break;
            case 2://确定
        {
            [self removeFromSuperview];
        }
            break;
        default:
            break;
    }
}


- (void)addWithTitle:(NSString *)strTitle target:(id)target sel:(SEL)selector{
    if (strTitle != nil) {
        _labelAlert.text = strTitle;
    }
    //22
    CGFloat height = [GlobalMethod fetchSizeFromLabel:_labelAlert];
    if (height>23) {
        _labelAlert.textAlignment = NSTextAlignmentLeft;
    }
    if (target != nil ) {
        if (selector!=nil) {
            [_btnYes addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        }
        UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
        self.frame = keyWindow.bounds;
        [keyWindow addSubview:self];
    }
}




- (void)addWithTitle:(NSString *)strTitle target:(id)target sel:(SEL)selector cancelBtn:(NSString *)cancelBtn  confirmBtn:(NSString *)confirmBtn{
    [_btnDismiss setTitle:cancelBtn forState:UIControlStateNormal];
    [_btnYes setTitle:confirmBtn forState:UIControlStateNormal];
    
    [self addWithTitle:strTitle target:target sel:selector];
}

- (void)addWithTitle:(NSString *)strTitle target:(id)target sel:(SEL)selector   confirmBtn:(NSString *)confirmBtn{
    [_btnDismiss setHidden:YES];
    [_btnYes setTitle:confirmBtn forState:UIControlStateNormal];
//    _btnYes.centerX = _viewAll.centerX;
    _btnYes.x = _viewAll.width/2-_btnYes.width/2;
    _btnYes.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addWithTitle:strTitle target:target sel:selector];
}

- (void)addWithAttributeTitle:(NSAttributedString *)strTitle target:(id)target sel:(SEL)selector cancelBtn:(NSString *)cancelBtn  confirmBtn:(NSString *)confirmBtn{
    _labelAlert.attributedText = strTitle;
    [self addWithTitle:nil target:target sel:selector cancelBtn:cancelBtn confirmBtn:confirmBtn];
}


- (void)awakeFromNib{
    //设置描边
    
    [GlobalMethod setRoundView:_btnDismiss color:COLOR_GRAY_LINE_WHITE numRound:NUM_BTN_ROUND width:1];
    [GlobalMethod setRoundBtn:_btnYes btnBgColor:nil];
    
    [GlobalMethod setRoundView:_viewAll color:COLOR_GRAY_LINE_WHITE numRound:0 width:1];
}

@end
