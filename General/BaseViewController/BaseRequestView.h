//
//  BaseRequestView.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/1.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RequestBaseClass;
@class LoadingView;
@class NoticeView;
@class NoResultView;

@interface BaseRequestView : UIView

@property (nonatomic, strong) RequestBaseClass * requestManager;//请求管理者
@property (nonatomic, strong) LoadingView * loadingView;//loading动画
@property (nonatomic, strong) NoticeView * noticeView;//提示语
@property (nonatomic, strong) NoResultView * noResultView;//显示无结果

@end
