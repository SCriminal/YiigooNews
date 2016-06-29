//
//  CommentEditView.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/16.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "CommentEditView.h"

@implementation CommentEditView

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1://确定
        {
        }
            break;
        case 2://取消
        {
            [self.textViewEdit resignFirstResponder];

        }
            break;
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
