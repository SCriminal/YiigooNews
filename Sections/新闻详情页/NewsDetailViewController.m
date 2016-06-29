//
//  NewsDetailViewController.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "NewsDetailViewController.h"
//自定义navItem
#import "UINavigationItem+NavigationItemCustom.h"
//评论页
#import "CommentViewController.h"
//用户评论编辑
#import "CommentEditView.h"

//测试
#import "TestVC.h"

@interface NewsDetailViewController ()

@property (strong, nonatomic) UIWebView * webView;//网页

//用户评论页
@property (strong, nonatomic) CommentEditView * editView;

@end

@implementation NewsDetailViewController

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    [self.view endEditing:YES];
    switch (sender.tag) {
        case 1:// 返回
        {

            [GB_Nav popViewControllerAnimated:YES];
        }
            break;
            case 2://评论
        {
            [GlobalMethod loginWithBlock:^{
                CommentViewController * commentVC = [[CommentViewController alloc]init];
                [GB_Nav pushViewController:commentVC animated:YES];
            }];
            
        }
            break;
            case 3://分享
        {
            TestVC * vc = [[TestVC alloc]initWithNibName:@"TestVC" bundle:nil];
            [GB_Nav pushViewController:vc animated:YES];
        }
            break;
            case 4://弹出评论层
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
//    UIView * viewNav3 = [[UIView alloc]initWithFrame:CGRectMake(0,64, 90, 44)];
//    viewNav3.backgroundColor = [UIColor blackColor];
//    UIBarButtonItem * itemRight = [[UIBarButtonItem alloc]initWithCustomView:viewNav3]; 
    [self.navigationItem setupLeftBarButton:[[UIBarButtonItem alloc]initWithCustomView:_viewLeftItem] ];
    [self.navigationItem setupRightBarButton:[[UIBarButtonItem alloc]initWithCustomView:_viewRightItem]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.modelNews.gotoURL]]];
    
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



#pragma mark 初始化
- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, GB_StatusBarHeight+GB_NavBarHeight, screenWidth, screenHeight-GB_NavBarHeight-GB_StatusBarHeight-50)];
        [self.view addSubview:_webView];
    }
    return _webView;
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
