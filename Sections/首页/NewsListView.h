//
//  NewsListView.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/1.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>
//基础请求view
#import "BaseRequestView.h"

@interface NewsListView :BaseRequestView <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) NSMutableArray * muAry;

//显示
- (void)showWithRequest:(BOOL)request;


@end
