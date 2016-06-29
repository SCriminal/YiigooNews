//
//  TestVC.m
//  YiigooNews
//
//  Created by 隋林栋 on 16/6/17.
//  Copyright © 2016年 隋林栋. All rights reserved.
//

#import "TestVC.h"

@interface TestVC ()


@end

@implementation TestVC

#pragma mark 点击事件
- (IBAction)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1://shake
        {
            CABasicAnimation *momAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            momAnimation.fromValue = [NSNumber numberWithFloat:-0.3];
            momAnimation.toValue = [NSNumber numberWithFloat:0.3];
            momAnimation.duration = 0.1;
            momAnimation.repeatCount = 2;
            momAnimation.autoreverses = YES;
            momAnimation.delegate = self;
            [_viewShake.layer addAnimation:momAnimation forKey:@"animateLayer"];
        }
            break;
            
        default:
            break;
    }
}
//

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    int (^blockName)(NSString *) = ^int (NSString * name){
        return 3;
    };
    blockName(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 One day Sunshine girl
}
*/

@end
