//
//  CommentViewController.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "CommentViewController.h"

//下拉刷新
#import "MJRefresh.h"
//自定义的header
#import "MJChiBaoZiHeader.h"
//cell
#import "CommentCell.h"
//model
#import "ModelComment_BaseClass.h"
//用户评论编辑
#import "CommentEditView.h"

@interface CommentViewController ()

//用户评论页
@property (strong, nonatomic) CommentEditView * editView;

@end

@implementation CommentViewController

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    [self.view endEditing:YES];
    switch (sender.tag) {
        case 4://评论编辑
        {
            [self.editView.textViewEdit becomeFirstResponder];
        }
            break;
            
        default:
            break;
    }
}



//初始化数据，在initViews前调用
- (void)initData
{
    [super initData];
}

//生成视图，视图相关的总入口
- (void)initViews
{
    [super initViews];
    [self addData];
    [self.view addSubview:self.tableView];
}

//生成网络请求
- (void)initRequest
{
    [super initRequest];
    //初始化请求
}
#pragma mark 监听

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //监听键盘
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark 监听键盘
- (void)keyboardWillShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    //    NSLog(@"%f",self.editView.height);
    self.editView.frame = CGRectMake(0, screenHeight, ScreenWidth, self.editView.height);
    [UIView animateWithDuration:0.2 animations:^{
        
        NSLog(@"self.editView.height:%f  screenHeight:%f",self.editView.height,screenHeight);
        
        self.editView.frame = CGRectMake(0, ScreenHeight-self.editView.height-kbSize.height, ScreenWidth, self.editView.height);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)keyboardWillHidden:(NSNotification*)aNotification{
    [UIView animateWithDuration:0.2 animations:^{
        self.editView.frame = CGRectMake(0, screenHeight, ScreenWidth, self.editView.height);
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark table 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.muAry.count;
}



//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 200;
//}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"estimated %ld",indexPath.row);
    NSNumber * numberHeight = [self.muDicHeight objectForKey:[NSNumber numberWithInteger:indexPath.row]];
    if (numberHeight != nil) {
        return [numberHeight floatValue];
    }
    
    CommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CommentCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell resetCellWithModel:self.muAry[indexPath.row]];
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [self.muDicHeight setObject:[NSNumber numberWithFloat:height+1] forKey:[NSNumber numberWithInteger:indexPath.row]];
    return height+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CommentCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell resetCellWithModel:self.muAry[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NewsDetailViewController * detailVC = [[NewsDetailViewController alloc]init];
//    [detailVC setHidesBottomBarWhenPushed:YES];//加上这句就可以把推出的ViewController隐藏Tabbar
//    [GB_Nav pushViewController:detailVC animated:YES];
    
}




#pragma mark ary 添加数据
- (void)addData{
    NSString *strJson=[NSString stringWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"ModelComment" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    NSData * data = [strJson dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    ModelComment_BaseClass * model = [ModelComment_BaseClass modelObjectWithDictionary:dic];
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

- (NSMutableDictionary *)muDicHeight{
    if (_muDicHeight == nil) {
        _muDicHeight = [[NSMutableDictionary alloc]init];
    }
    return _muDicHeight;
}

- (UITableView*)tableView{
    if (_tableView == nil) {
    
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, GB_NavBarHeight+GB_StatusBarHeight, screenWidth, ScreenHeight-GB_StatusBarHeight-GB_NavBarHeight-50) style:UITableViewStylePlain];
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

- (CommentEditView *)editView{
    if (_editView == nil) {
        _editView = [[[NSBundle mainBundle]loadNibNamed:@"CommentEditView" owner:self options:nil]lastObject];
        _editView.frame = CGRectMake(0, screenHeight, ScreenWidth, _editView.height);
        [self.view addSubview:_editView];
    }
    return _editView;
}

@end
