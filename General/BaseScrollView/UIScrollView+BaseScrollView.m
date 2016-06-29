//
//  UIScrollView+BaseScrollView.m
//  米兰港
//
//  Created by 隋林栋 on 15/3/30.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "UIScrollView+BaseScrollView.h"

@implementation UIScrollView (BaseScrollView)

- (void)resetSubView{
    NSArray * aryVies = self.subviews;
    CGRect rect;
    for (int i = 0; i< aryVies.count; i++) {
        UIView * tmpView = aryVies[i];
        if (i == 0) {
            rect = tmpView.frame;
            rect.origin.y = 0;
            tmpView.frame = rect;
            continue;
        }
        UIView * tmpViewBefore = aryVies[i-1];
        rect = tmpView.frame;
        rect.origin.y = tmpViewBefore.bottom;
        tmpView.frame = rect;
        
        self.contentSize = CGSizeMake(0, tmpView.bottom);

    }
    

}


@end
