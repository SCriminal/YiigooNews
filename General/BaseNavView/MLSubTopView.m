//
//  MLSubTopView.m
//  PortOfMilan
//
//  Created by suibian_milangang_sqc on 14-9-23.
//
//

#import "MLSubTopView.h"

@implementation MLSubTopView


//初始化方法

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)strTitle target:(UIViewController *) target   selecter:(SEL)action showRightBtn:(BOOL)showRightBtn{
    return [self initWithFrame:frame title:strTitle titleColor:customBlack imageLeft:@"btn_back" target:target selecter:action showRightBtn:showRightBtn];
}

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)strTitle target:(UIViewController *) target   selecter:(SEL)action
{
    return  [self initWithFrame:frame title:strTitle target:target selecter:action showRightBtn:YES];
}

-(instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame title:@"返回" target:nil selecter:nil];
}


-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)strTitle titleColor:(UIColor *)titleColor imageLeft:(NSString*)nameImageLeft target:(UIViewController *) target   selecter:(SEL)action showRightBtn:(BOOL)showRightBtn{
    self = [super initWithFrame:frame];
    
    if(self) {
        
        float numY = frame.size.height/2-20;
        _titleLab =[[UILabel alloc] initWithFrame:CGRectMake(60, numY, screenWidth-120, 40)];
        [_titleLab setTextColor:titleColor];
        _titleLab.text = strTitle!=nil?strTitle:@"";
        [_titleLab setTextAlignment:NSTextAlignmentCenter];
        [_titleLab setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_titleLab];
        
        
        
        numY = frame.size.height/2-20;
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, numY, 27, 40)];
        [_backBtn setBackgroundImage:[UIImage imageNamed:nameImageLeft] forState:UIControlStateNormal];
        if (target != nil) {
            [self addSubview:_backBtn];
        }
        
        
        
        if (target != nil) {
            UIControl * control = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, _titleLab.right , frame.size.height)];
            [control addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:control];
        }
        
        if (showRightBtn) {
            _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-5-44, 0, 44, 44)];
            [_rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_right_new"] forState:UIControlStateNormal];
            [_rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_right_new_highlighted"] forState:UIControlStateHighlighted];
            [_rightBtn.imageView setContentMode:UIViewContentModeCenter]; // 图片拉伸不变形
            [_rightBtn addTarget:self action:@selector(showSubJumpView) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_rightBtn];
        }
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"second_topbar_bg"]]];
        UIView * viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, GB_NavBarHeight-1, ScreenWidth, 1)];
        viewLine.backgroundColor = COLOR_GRAY_LINE;
        [self addSubview:viewLine];
    }
    
    return self;

}

#pragma mark 弹出4个按钮
- (void)showSubJumpView{
//    SubJumpView * subView = [[[NSBundle mainBundle]loadNibNamed:@"SubJumpView" owner:self
//                                                        options:nil]lastObject];
//    [subView showinVC:nil];
}

//- (void)popDropList
//{
//    if (!self.popDropController) {
//        [self initPop];
//    }
//    CGRect rect = CGRectMake(216, 204+GB_NavBarHeight, 104, 204);
//    [self.popDropController presentPopoverFromRect:rect inView:self permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
//}
//
//#pragma PopDropList
//
//- (void)popoverControllerDidDismissPopover:(WEPopoverController *)popoverController
//{
//    
//}
//
//- (BOOL)popoverControllerShouldDismissPopover:(WEPopoverController *)popoverController
//{
//    return YES;
//}

//- (void)initPop
//{
//    WEPopoverContainerViewProperties *pops = [WEPopoverContainerViewProperties alloc];
//    
//    CGFloat bgMargin = 1.0;
//    CGFloat contentMargin = 1.0;
//    pops.leftBgMargin = bgMargin;
//    pops.rightBgMargin = bgMargin;
//    pops.topBgMargin = bgMargin;
//    pops.bottomBgMargin = bgMargin;
//    
//    pops.leftContentMargin = contentMargin;
//    pops.rightContentMargin = contentMargin; // Need to shift one pixel for border to look correct
//    pops.topContentMargin = contentMargin;
//    pops.bottomContentMargin = contentMargin;
//    pops.arrowMargin = 0.0;
//    pops.arrowOffset = 0.0;
//    
//    CGFloat oneH = 50.0f;
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 104, oneH * 4 + 4)];
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 104, oneH)];
//    [btn setImage:[UIImage imageWithName:@"dropListHome"] forState:UIControlStateNormal];
//    [self lastPop:btn buttonTag:0 buttonTitle:@"首页"];
//    [view addSubview:btn];
//    
//    // 隔线
//    UIView * vline1 = [[UIView alloc] initWithFrame:CGRectMake(0, oneH, 104, 1)];
//    [vline1 setBackgroundColor:[UIColor clearColor]];
//    [view addSubview:vline1];
//    
//    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, oneH + 1, 104, oneH)];
//    [btn setImage:[UIImage imageWithName:@"dropListCate"] forState:UIControlStateNormal];
//    [self lastPop:btn buttonTag:1 buttonTitle:@"分类"];
//    [view addSubview:btn];
//    
//    // 隔线
//    UIView * vline2 = [[UIView alloc] initWithFrame:CGRectMake(0, oneH, 104, 1)];
//    [vline2 setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
//    [view addSubview:vline2];
//    
//    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, oneH * 2 + 2, 104, oneH)];
//    [btn setImage:[UIImage imageWithName:@"dropListBC"] forState:UIControlStateNormal];
//    [self lastPop:btn buttonTag:2 buttonTitle:@"进货单"];
//    [view addSubview:btn];
//    
//    // 隔线
//    UIView * vline3 = [[UIView alloc] initWithFrame:CGRectMake(0, oneH, 104, 1)];
//    [vline3 setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
//    [view addSubview:vline3];
//    
//    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, oneH * 3 + 3, 104, oneH)];
//    [btn setImage:[UIImage imageWithName:@"dorpListProfile"] forState:UIControlStateNormal];
//    [self lastPop:btn buttonTag:3 buttonTitle:@"我的"];
//    [view addSubview:btn];
//    
//    UIViewController *vc = [[UIViewController alloc] init];
//    [vc.view setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
//    [vc.view addSubview:view];
//    vc.contentSizeForViewInPopover = CGSizeMake(view.frame.size.width, view.frame.size.height);
//    
//    self.popDropController = [[WEPopoverController alloc] initWithContentViewController:vc];
//    [self.popDropController setContainerViewProperties:pops];
//    self.popDropController.delegate = self;
//    
//}

//- (void)lastPop:(UIButton *)btn buttonTag:(NSInteger)bTag buttonTitle:(NSString *)title
//{
//    btn.tag = bTag;
//    [btn setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.9]];
//    btn.titleLabel.font = [UIFont systemFontOfSize:13];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn setTitle:title forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(gotoWebOnClickManageMenu:) forControlEvents:UIControlEventTouchUpInside];
//}
//
//- (void)gotoWebOnClickManageMenu:(UIButton *)btn
//{
//
//    [GB_Nav popToRootViewControllerAnimated:NO];
//    [_popDropController dismissPopoverAnimated:YES];
//    
//    NSNumber *theTag = [NSNumber numberWithInt:(int )btn.tag];
//    NSLog(@"%@", theTag);
//    NSDictionary *tagInfo = [NSDictionary dictionaryWithObject:theTag forKey:@"theTag"];
//    // 设置通知 通知tabbar选中哪个按钮
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"setView" object:nil userInfo:tagInfo];
//}




@end
