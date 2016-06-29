//
//  BaseAlertView.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/11.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAlertView : UIView{
    
    __weak IBOutlet UIView *_viewLabelBG;
    __weak IBOutlet UILabel *_labelAlert;
    __weak IBOutlet UIButton *_btnYes;
    __weak IBOutlet UIButton *_btnDismiss;
    __weak IBOutlet UIView *_viewAll;
}

- (void)addWithTitle:(NSString *)strTitle target:(id)target sel:(SEL)selector;

- (void)addWithTitle:(NSString *)strTitle target:(id)target sel:(SEL)selector cancelBtn:(NSString *)cancelBtn  confirmBtn:(NSString *)confirmBtn;
- (void)addWithTitle:(NSString *)strTitle target:(id)target sel:(SEL)selector   confirmBtn:(NSString *)confirmBtn;

- (void)addWithAttributeTitle:(NSAttributedString *)strTitle target:(id)target sel:(SEL)selector cancelBtn:(NSString *)cancelBtn  confirmBtn:(NSString *)confirmBtn;

@end
