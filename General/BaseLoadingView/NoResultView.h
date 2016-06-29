//
//  NoResultView.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/5.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NoResultViewDelegate <NSObject>

- (void)protocolNoResutlBtnClick;

@end

@interface NoResultView : UIView{
    
    NSArray * _aryViews;
}

@property (weak, nonatomic) IBOutlet UIButton *btnRefresh;

@property (weak, nonatomic) IBOutlet UILabel *labelMessage;

@property (weak, nonatomic) IBOutlet UIImageView *ivAlert;
@property (weak, nonatomic) IBOutlet UIView *viewWhite;

@property (weak, nonatomic) IBOutlet UIView *viewNoWifi;
@property (weak, nonatomic) IBOutlet UIView *viewNoTui;
@property (weak, nonatomic) IBOutlet UIView *viewNoOrder;
@property (weak, nonatomic) IBOutlet UIView *viewNoPushProduct;
@property (weak, nonatomic) IBOutlet UIView *viewNoPushBuyer;
@property (weak, nonatomic) IBOutlet UIView *viewNoPushedBuyer;
@property (weak, nonatomic) IBOutlet UILabel *labelNoPushProduct;

@property (nonatomic, weak) id<NoResultViewDelegate> delegate;


//显示无结果
- (void)showNoResultView:(UIView *)viewShow delegate:(UIViewController *)vc canRefresh:(BOOL)canRefresh  message:(NSString *)strMessage;
//显示无结果
- (void)showNoResultView:(UIView *)viewShow Frame:(CGRect)rect delegate:(UIViewController *)vc canRefresh:(BOOL)canRefresh  message:(NSString *)strMessage;
//没有订单
- (void)showNoOrderView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate;
//没有退款单
- (void)showNoTuiView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate;
//没有wifi
- (void)showNoWifiView:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate;
//没有可推送的产品
- (void)showNoPushProduct:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate;
//没有可推送的商家
- (void)showNoPushBuyer:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate;
//没有已推送的商家
- (void)showNoPushedBuyer:(UIView *)viewShow Frame:(CGRect)rect delegate:(id)delegate;
//隐藏无结果
- (void)hideNoResutlView;


@end
