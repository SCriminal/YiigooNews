//
//  BaseTableViewController.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/4.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelName.h"
#import "RequestBaseClass.h"
#import "NoResultView.h"



@class RequestBaseClass;
@class LoadingView;
@class NoticeView;


@interface BaseTableViewController : UIViewController<RequestBaseClassDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) RequestBaseClass * requestManager;//请求管理者
@property (nonatomic, strong) LoadingView * loadingView;//loading动画
@property (nonatomic, strong) NoticeView * noticeView;//提示语
@property (nonatomic, strong) NoResultView * noResultView;//显示无结果

//初始化
- (void)initViews;
- (void)initData;
- (void)initRequest;


//显示无结果
- (void)showNoResultCanRefresh:(BOOL)canRefresh  viewShow:(UIView *)viewShow message:(NSString *)strMessage;

- (void)hideNoResultView;

#pragma mark 显示loading
- (void)showLoadingView:(UIView *)viewShow;
- (void)hideLoadingView;


@end
