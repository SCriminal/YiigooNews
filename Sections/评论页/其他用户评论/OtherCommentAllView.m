//
//  OtherCommentAllView.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/6.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "OtherCommentAllView.h"
//其他的commentview
#import "OtherCommentView.h"
//自动布局
#import "Masonry.h"

@implementation OtherCommentAllView

//刷新其他用户评论
- (void)resetOtherCommentAllView:(NSArray *)aryTest{
    [GlobalMethod removeAllSubViews:self];
    
    UIView * viewTmp = nil;
    for (int i = 0; i < aryTest.count; i++) {
        OtherCommentView * commentView = [[[NSBundle mainBundle]loadNibNamed:@"OtherCommentView" owner:self options:nil]lastObject];
        [commentView resetViewWithComment:aryTest[i] width:screenWidth];
        [self addSubview:commentView];
        [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (viewTmp == nil) {
                make.top.equalTo(self).offset(0);
            }else{
                make.top.equalTo(viewTmp.mas_bottom).offset(1);
            }
            make.left.equalTo(self);
            make.right.equalTo(self);
            if (i == aryTest.count-1) {
                make.bottom.equalTo(self).offset(-2);
            }
        }];
        viewTmp = commentView;
    }
   
}

@end
