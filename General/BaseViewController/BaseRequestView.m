//
//  BaseRequestView.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/1.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "BaseRequestView.h"
//基础请求
#import "RequestBaseClass.h"
//转圈
#import "LoadingView.h"
//无结果
#import "NoResultView.h"
//提示框
#import "NoticeView.h"

@interface BaseRequestView()<RequestBaseClassDelegate>

@end

@implementation BaseRequestView


#pragma mark 初始化
- (id)requestManager{
    if (_requestManager == nil) {
        _requestManager = [RequestBaseClass manager];
        //        _requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        //        _requestManager.requestSerializer.timeoutInterval = TIME_REQUEST_OUT;
        _requestManager.delegate = self;
    }
    return _requestManager;
}

#pragma mark 设置请求ProgresshDelegate
- (void)protocolHideProgressMehtod:(NSString *)method error:(id)error viewShow:(UIView *)viewShow  show:(BOOL)show{
    //隐藏loadingView
    [self hideLoadingView];
    
    //判断是否需要显示
    if (!show) {
        return;
    }
    
    //显示提示信息
    if (self.noticeView ==nil) {
        self.noticeView = [[[NSBundle mainBundle]loadNibNamed:@"NoticeView" owner:self options:nil]lastObject];
    }
    NSString * strError = [GlobalMethod returnErrorMessage:error];
    [self.noticeView showNotice:strError time:2 viewShow:self vcShow:nil];
    
}

- (void)protocolHideProgressMehtod:(NSString *)method success:(NSString *)message viewShow:(UIView *)viewShow  show:(BOOL)show{
    //隐藏loadingView
    [self hideLoadingView];
    //判断是否需要显示
    if (!show) {
        return;
    }
    
    //显示提示信息
    if (self.noticeView ==nil) {
        self.noticeView = [[[NSBundle mainBundle]loadNibNamed:@"NoticeView" owner:self options:nil]lastObject];
    }
    [self.noticeView showNotice:message time:2 viewShow:self vcShow:nil];
    
}



- (void)protocolShowProgressMethod:(NSString *)method viewShow:(UIView *)viewShow{
    [self showLoadingView:viewShow];
}


#pragma mark 显示loading
- (void)showLoadingView:(UIView *)viewShow{
    //初始化loadingview
    if (self.loadingView == nil) {
        self.loadingView = [[[NSBundle mainBundle]loadNibNamed:@"LoadingView" owner:self options:nil]lastObject];
    }else{
        [self.loadingView removeFromSuperview];
    }
    //设置frame
    [self.loadingView resetFrameViewShow:self vcShow:nil];
    
    [self addSubview:self.loadingView];
}

- (void)hideLoadingView{
    //隐藏loadingView
    if (self.loadingView != nil) {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
    
}

#pragma mark 显示无结果
- (void)showNoResultCanRefresh:(BOOL)canRefresh  viewShow:(UIView *)viewShow message:(NSString *)strMessage{
    if (self.noResultView == nil) {
        self.noResultView = [[[NSBundle mainBundle]loadNibNamed:@"NoResultView" owner:self options:nil]lastObject];
    }
    [self.noResultView showNoResultView:viewShow delegate:nil canRefresh:canRefresh message:strMessage];
    
}

- (void)hideNoResultView{
    [self.noResultView hideNoResutlView];
    self.noResultView = nil;
}

- (void)protocolNoResutlBtnClick{
    [self.noResultView hideNoResutlView];
    self.noResultView = nil;
}

@end
