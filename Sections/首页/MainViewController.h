//
//  MainViewController.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "BaseViewController.h"

//滑动块
#import "RadioScrollView.h"

@interface MainViewController : BaseViewController<RadioScrollViewDelegate,UIScrollViewDelegate>{
}

@property (strong, nonatomic) RadioScrollView *radioView;//滑动块
@property (strong, nonatomic) UIScrollView *scrollView;//整体滑动sc
@property (assign, nonatomic) NSInteger numRadio;//滑块数量

@end
