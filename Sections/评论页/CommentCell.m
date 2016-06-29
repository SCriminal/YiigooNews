//
//  CommentCell.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/6.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "CommentCell.h"

//网络加载图片
#import <SDWebImage/UIImageView+WebCache.h>


@implementation CommentCell

//刷新cell
- (void)resetCellWithModel:(ModelComment_Data *)modelComment{
    self.modelComment = modelComment;
    [_viewOtherComment resetOtherCommentAllView:modelComment.contents];
    _labelComment.text = self.modelComment.content;
    [_imageHead sd_setImageWithURL:[NSURL URLWithString:self.modelComment.imageHeadURL]];
    _labelName.text = self.modelComment.name;
    _labelTime.text = self.modelComment.time;
}



@end
