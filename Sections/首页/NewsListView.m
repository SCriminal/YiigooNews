//
//  NewsListView.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/1.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "NewsListView.h"

//cell
#import "NewsListCell.h"
#import "NewsListADCell.h"
//下拉刷新
#import "MJRefresh.h"
//自定义的header
#import "MJChiBaoZiHeader.h"
//新闻详情页
#import "NewsDetailViewController.h"



@implementation NewsListView


//显示
- (void)showWithRequest:(BOOL)request{
    
}

- (void)drawRect:(CGRect)rect{
    [self addData];
    [self addSubview:self.tableView];
    
}


#pragma mark table代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.muAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%3!=0) {
        NewsListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NewsListCell"];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsListCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell resetCellWithModel:self.muAry[indexPath.row]];
        return cell;
    }
    NewsListADCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NewsListADCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsListADCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //提取cell
    ModelNews_Data *modelNews = self.muAry[indexPath.row];
    NewsDetailViewController * detailVC = [[NewsDetailViewController alloc]init];
//    [detailVC setHidesBottomBarWhenPushed:YES];//加上这句就可以把推出的ViewController隐藏Tabbar
    detailVC.modelNews = modelNews;
    [GB_Nav pushViewController:detailVC animated:YES];
    
}

#pragma mark 添加数据
- (void)addData{
    NSString *strJson=[NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"ModelNews" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    NSData * data = [strJson dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    ModelNews_BaseClass * model = [ModelNews_BaseClass modelObjectWithDictionary:dic];
    [self.muAry addObjectsFromArray:model.data];

}

#pragma mark 上拉刷新 下拉加载
- (void)loadNewData{
    if (self != nil) {
        [_muAry removeAllObjects];
        [self addData];
        [self performSelector:@selector(reloadData) withObject:nil afterDelay:2];
    }
}

- (void)loadMoreData{
    if (self != nil) {
        [self addData];
        [self performSelector:@selector(reloadData) withObject:nil afterDelay:2];
    }
}

- (void)reloadData{
    [_tableView reloadData];
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    
    _tableView.mj_footer.userInteractionEnabled = YES;
    _tableView.mj_header.userInteractionEnabled = YES;

}

#pragma mark 初始化
- (id)muAry{
    if (_muAry == nil) {
        _muAry = [[NSMutableArray alloc]init];
    }
    return _muAry;
}

- (UITableView*)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;

        __unsafe_unretained __typeof(self) weakSelf = self;
        _tableView.mj_header = [MJChiBaoZiHeader headerWithRefreshingBlock:^{
            _tableView.mj_footer.userInteractionEnabled = NO;
            [weakSelf loadNewData];
        }];
        _tableView.mj_footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _tableView.mj_header.userInteractionEnabled = NO;
            [weakSelf loadMoreData];
        }];
        MJRefreshAutoNormalFooter * footer = (MJRefreshAutoNormalFooter*)_tableView.mj_footer;
        footer.refreshingTitleHidden = YES;

    }
    return _tableView;
}


@end
