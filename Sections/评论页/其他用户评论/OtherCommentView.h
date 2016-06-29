//
//  OtherCommentView.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/6.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>

//model
#import "ModelComment_Data.h"

@interface OtherCommentView : UIView{
    
    __weak IBOutlet UILabel *_labelTime;
    __weak IBOutlet UILabel *_labelName;
    __weak IBOutlet UILabel *_labelSubComment;
}

//刷新内容 宽度
- (void)resetViewWithComment:(ModelComment_Data *)modelComment width:(CGFloat)width;

@end
