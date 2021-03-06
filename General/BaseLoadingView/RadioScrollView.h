//
//  RadioScrollView.h
//  米兰港
//
//  Created by 隋林栋 on 15/7/15.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RadioScrollViewDelegate <NSObject>

@optional
- (void)protocolRadioScrollViewBtnSelect:(NSUInteger)tag;
- (void)protocolRadioScrollViewRepeat:(NSUInteger)tag;

@end

@interface RadioScrollView : UIView

//代理
@property (nonatomic, weak) id<RadioScrollViewDelegate> delegate;
@property (nonatomic, strong) UIView * viewSlid;
@property (nonatomic, strong) UIScrollView * scrollView;

//初始化

- (id)initWithTitles:(NSArray *)aryTitle frame:(CGRect)frame delegate:(id)delegate;

- (id)initWithTitles:(NSArray *)aryTitle height:(CGFloat)height delegate:(id)delegate;

- (id)initWithTitles:(NSArray *)aryTitle delegate:(id)delegate ;

- (id)initWithTitles:(NSArray *)aryTitle frame:(CGRect)frame delegate:(id)delegate numPx:(int)numPx font:(UIFont *)font;

- (void)sliderToIndex:(int)index noticeDelegate:(BOOL)notice;

- (NSUInteger)selectIndex;

- (void)refreshBtn:(int)indext  title:(NSString *)strTitle;


@end
