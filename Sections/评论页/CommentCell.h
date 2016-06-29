//
//  CommentCell.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/6.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>

//其他用户评论
#import "OtherCommentAllView.h"
//model
#import "ModelComment_Data.h"

@interface CommentCell : UITableViewCell{
    
    __weak IBOutlet UILabel *_labelTime;
    __weak IBOutlet UILabel *_labelName;
    __weak IBOutlet UIImageView *_imageHead;
    __weak IBOutlet UILabel *_labelComment;
    __weak IBOutlet OtherCommentAllView *_viewOtherComment;
}

@property (strong, nonatomic) ModelComment_Data * modelComment;

//刷新cell
- (void)resetCellWithModel:(ModelComment_Data *)modelComment;


@end
