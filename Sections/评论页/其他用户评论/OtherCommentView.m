//
//  OtherCommentView.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/6.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "OtherCommentView.h"

@implementation OtherCommentView

//刷新内容 宽度
- (void)resetViewWithComment:(ModelComment_Data *)subComment width:(CGFloat)width{
    _labelSubComment.text = subComment.content;
    _labelName.text = subComment.name;
    _labelTime.text = subComment.time;
    self.width = width;
    self.backgroundColor = [UIColor lightGrayColor];
//    [self layoutIfNeeded];
//    self.clipsToBounds
    
}


@end
