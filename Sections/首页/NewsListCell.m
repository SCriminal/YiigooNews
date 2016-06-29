//
//  NewsListCell.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/1.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "NewsListCell.h"
//网络加载图片
#import <SDWebImage/UIImageView+WebCache.h>

@implementation NewsListCell


//刷新cell
- (void)resetCellWithModel:(ModelNews_Data *)modelNews{
    self.modelNews = modelNews;
    [_imageHead sd_setImageWithURL:[NSURL URLWithString:modelNews.imageurl]];
    _labelTitle.text = modelNews.title;
    _labelContent.text = modelNews.content;
}

@end
