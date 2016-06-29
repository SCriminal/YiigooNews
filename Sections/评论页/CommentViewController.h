//
//  CommentViewController.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "BaseViewController.h"



@interface CommentViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;
@property (strong, nonatomic) NSMutableArray * muAry;
@property (strong, nonatomic) NSMutableDictionary * muDicHeight;




@end
