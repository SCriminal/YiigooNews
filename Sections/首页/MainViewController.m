//
//  MainViewController.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "MainViewController.h"
//数据列表
#import "NewsListView.h"

@interface MainViewController ()

@end

@implementation MainViewController


//初始化数据，在initViews前调用
- (void)initData
{
    [super initData];
    self.numRadio = 12;
    

}

//生成视图，视图相关的总入口
- (void)initViews
{
    [super initViews];
    [self.view addSubview:self.radioView];
    [self.view addSubview:self.scrollView];

}

//生成网络请求
- (void)initRequest
{
    [super initRequest];
    //初始化请求
}


#pragma mark 初始化
- (id)radioView{
    if (_radioView == nil) {
       _radioView =  [[RadioScrollView alloc]initWithTitles:[NSArray arrayWithObjects:@"国际",@"体育",@"财经",@"NBA",@"房产",@"娱乐",@"体育",@"财经",@"NBA",@"房产",@"娱乐", nil] frame:CGRectMake(0, GB_NavBarHeight+GB_StatusBarHeight, ScreenWidth, 0) delegate:self numPx:10 font:[UIFont systemFontOfSize:14]];
        _radioView.delegate = self;
        [self.view addSubview:_radioView];
    }
    return _radioView;
}



- (id)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, GB_StatusBarHeight+GB_NavBarHeight+self.radioView.height, screenWidth, screenHeight-GB_StatusBarHeight-GB_NavBarHeight-self.radioView.height)];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.contentSize = CGSizeMake(_numRadio* screenWidth, _scrollView.height);
        //添加listview
        for (int i = 0; i< self.numRadio; i++) {
            NewsListView * listView = [[NewsListView alloc]init];
            listView.frame = CGRectMake(_scrollView.width*i, 0, _scrollView.width, _scrollView.height);
            listView.tag = i+1;
            listView.backgroundColor = ColorRandom;
            [_scrollView addSubview:listView];
            if (i == 0) {
                [listView showWithRequest:YES];
            }
        }

    }
    return _scrollView;
}

#pragma mark scroll代理
- (void)scrollChange:(UIScrollView *)scrollView
{
    // 获取已经滚动的比例
    double ratio = scrollView.contentOffset.x / screenWidth;
    int    page  = (int)(ratio + 0.5);
    // scrollview 到page页时 将toolbar调至对应按钮
    [_radioView sliderToIndex:page noticeDelegate:NO];
    // 取MLOrderListShowView时不直接用page因为下级页面返回时需要知道当前tagindex 才能刷新当前页
    for (NewsListView *listView in self.scrollView.subviews) {
        if (listView.tag == page+1) {
            [listView showWithRequest:NO];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self scrollChange:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollChange:scrollView];
}

# pragma mark - radioView代理

- (void)protocolRadioScrollViewBtnSelect:(NSUInteger)tag
{
    _scrollView.contentOffset = CGPointMake(screenWidth * (tag), 0);
    
    for (NewsListView *listView in self.scrollView.subviews) {
        if (listView.tag == tag+1) {
            [listView showWithRequest:NO];
        }
    }
}


@end
