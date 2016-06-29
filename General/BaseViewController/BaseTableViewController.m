//
//  BaseTableViewController.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/4.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseTableViewController.h"
//基础请求
#import "RequestBaseClass.h"
//转圈
#import "LoadingView.h"
//提示框
#import "NoticeView.h"
//无结果
#import "NoResultView.h"


@interface BaseTableViewController ()

@end

@implementation BaseTableViewController



- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initData];
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initData];
    }
    return self;
}

#pragma mark 初始化

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (IS_IOS7) {
        //sc自动适配;
        IOS7_AUTO_SC;
        self.hidesBottomBarWhenPushed=YES;
    }
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor blackColor];
    UIView * viewBG = [[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight-GB_StatusBarHeight)];
    [self.view addSubview:viewBG];
    viewBG.backgroundColor = COLOR_CONTROLLER_BG;
    
    //初始化的方法
    [self initViews];
    [self initRequest];
    
}

//初始化数据，在initViews前调用
- (void)initData
{
    //
}

//生成视图，视图相关的总入口
- (void)initViews
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-GB_NavBarHeight-GB_StatusBarHeight-GB_ToolBarHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
}

//生成网络请求
- (void)initRequest
{
    //初始化请求
    
}

- (id)requestManager{
    if (_requestManager == nil) {
        _requestManager = [RequestBaseClass manager];
        //    self.requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _requestManager.requestSerializer.timeoutInterval = TIME_REQUEST_OUT;
        _requestManager.delegate = self;
    }
    return _requestManager;
}


#pragma mark 设置请求ProgresshDelegate
- (void)protocolHideProgressMehtod:(NSString *)method error:(id)error viewShow:(UIView *)viewShow  show:(BOOL)show{
    NSLog(@"progress show BaseVC:%@",method);
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
    [self.noticeView showNotice:strError time:2 viewShow:viewShow vcShow:self];
    
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
    [self.noticeView showNotice:message time:2 viewShow:nil vcShow:self];
    
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
    [self.loadingView resetFrameViewShow:viewShow vcShow:self];
    
    [self.view addSubview:self.loadingView];
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
    [self.noResultView showNoResultView:viewShow delegate:self canRefresh:canRefresh message:strMessage];
    
}

- (void)hideNoResultView{
    [self.noResultView hideNoResutlView];
}

- (void)protocolNoResutlBtnClick{
    NSLog(@"无结果按钮点击");
}




- (id)noticeView{
    if (_noticeView == nil) {
        _noticeView = [[[NSBundle mainBundle]loadNibNamed:@"NoticeView" owner:self options:nil]lastObject];
    }
    return _noticeView;
}

- (id)noResultView{
    if (_noResultView == nil) {
        _noResultView = [[[NSBundle mainBundle]loadNibNamed:@"NoResultView" owner:self options:nil]lastObject];
    }
    return _noResultView;
}



@end
