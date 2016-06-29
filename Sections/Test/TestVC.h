//
//  TestVC.h
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/17.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestVC : UIViewController{
    
    __weak IBOutlet UIView *_viewShake;
}

@property (strong, nonatomic) int (^blockName)(NSString *,int);


- (int (^)(NSString *))funcReturnBlock;

@end
