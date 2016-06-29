//
//  LoginVC.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/13.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginVC : BaseViewController

@property (nonatomic, strong) void (^blockLoginSuccess)(void);

@end
