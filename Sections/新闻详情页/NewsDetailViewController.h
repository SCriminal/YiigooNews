//
//  NewsDetailViewController.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/5/31.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "BaseViewController.h"
//model
#import "ModelNews_Data.h"


@interface NewsDetailViewController : BaseViewController{

    IBOutlet UIView *_viewRightItem;
    IBOutlet UIView *_viewLeftItem;
}

@property (strong, nonatomic) ModelNews_Data * modelNews;


@end
