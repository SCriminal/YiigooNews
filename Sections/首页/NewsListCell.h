//
//  NewsListCell.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/1.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>

//model
#import "ModelNews_Data.h"

@interface NewsListCell : UITableViewCell{
    
    __weak IBOutlet UILabel *_labelContent;
    __weak IBOutlet UILabel *_labelTitle;
    __weak IBOutlet UIImageView *_imageHead;
}

@property (strong, nonatomic) ModelNews_Data * modelNews;

//刷新cell
- (void)resetCellWithModel:(ModelNews_Data *)modelNews;

@end
