//
//  NoResultView.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/5.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "NoResultView.h"

@implementation NoResultView

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 101://
        {
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolNoResutlBtnClick)]) {
                [self.delegate protocolNoResutlBtnClick];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)awakeFromNib{
    _aryViews = [NSArray arrayWithObjects:_viewNoWifi,_viewNoOrder,_viewNoTui,_viewNoPushProduct,_viewNoPushBuyer,_viewNoPushedBuyer, nil];
    
   
    NSString * strAll = @"只支持以下行业 : \n• 机械/五金/工具 \n• 电工电气/元件 \n• 橡塑/化工/钢材 \n• 安全防护 \n• 仪器仪表";
    NSMutableAttributedString * strAttributeSelect = [[NSMutableAttributedString alloc]initWithString:strAll];
    [strAttributeSelect setAttributes:@{NSForegroundColorAttributeName : COLOR_NORMALCONTENT,        NSFontAttributeName : [UIFont systemFontOfSize:12]} range:NSMakeRange(0, strAll.length)];
    //行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [strAttributeSelect addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, strAll.length)];
    self.labelNoPushProduct.attributedText = strAttributeSelect;
}

- (void)showNoResultView:(UIView *)viewShow delegate:(UIViewController *)vc canRefresh:(BOOL)canRefresh message:(NSString *)strMessage{
    CGRect rect;
    if (viewShow==nil) {
        rect = [UIScreen mainScreen].bounds;
    }else{
        rect = viewShow.frame;
    }
    //判断是否显示刷新按钮
    [self resetLabel:strMessage btnCanRefres:canRefresh];

    self.frame = rect;
    if (vc != nil &&[vc isKindOfClass:[UIViewController class]]) {
        [vc.view addSubview:self];
        self.delegate = (id)vc;
    }
    

}

- (void)showNoResultView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate canRefresh:(BOOL)canRefresh  message:(NSString *)strMessage{
    
    
    [self resetLabel:strMessage btnCanRefres:canRefresh];
     self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
  
}

- (void)showNoOrderView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate{
    _viewNoOrder.frame =  CGRectMake(0, 0, rect.size.width, rect.size.height);;
    [self addSubview:_viewNoOrder];
    
    
    self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
}

- (void)showNoTuiView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate{
    _viewNoTui.frame =  CGRectMake(0, 0, rect.size.width, rect.size.height);;
    [self addSubview:_viewNoTui];
    
    
    self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
}

- (void)showNoWifiView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate{
    _viewNoWifi.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self addSubview:_viewNoWifi];
    
    self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
}

- (void)showNoPushProduct:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate{
    _viewNoPushProduct.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self addSubview:_viewNoPushProduct];
    self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
}

- (void)showNoPushBuyer:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate{
    _viewNoPushBuyer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self addSubview:_viewNoPushBuyer];
    self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
}

- (void)showNoPushedBuyer:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate{
    _viewNoPushedBuyer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    [self addSubview:_viewNoPushedBuyer];
    self.frame = rect;
    [viewShow addSubview:self];
    self.delegate = delegate;
}

#pragma mark //隐藏无结果
- (void)hideNoResutlView{
    [_viewNoOrder removeFromSuperview];
    [_viewNoTui removeFromSuperview];
    [_viewNoWifi removeFromSuperview];
    [_viewNoPushProduct removeFromSuperview];
    [_viewNoPushBuyer removeFromSuperview];
    [_viewNoPushedBuyer removeFromSuperview];
    self.delegate = nil;
    [self removeFromSuperview];
}


#pragma mark 设置lableframe
- (void)resetLabel:(NSString *)strMessage btnCanRefres:(BOOL)canRefresh{
    
    //更改提示标语
    self.labelMessage.text = strMessage;
    CGFloat height = [GlobalMethod fetchSizeFromLabel:self.labelMessage];
    self.labelMessage.height = height+10;
    
    //判断是否显示刷新按钮
    self.btnRefresh.hidden = !canRefresh;
    _btnRefresh.y = self.labelMessage.bottom+40;


    self.ivAlert.centerY = self.labelMessage.centerY;
    
    self.viewWhite.height = canRefresh?self.btnRefresh.bottom+40:self.labelMessage.bottom+10;

}

@end
