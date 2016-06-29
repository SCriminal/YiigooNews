//
//  RadioView.h
//  米兰港
//
//  Created by 隋林栋 on 15/3/9.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RadioViewDelegate <NSObject>


@optional
- (void)protocolRadioViewBtnSelect:(NSUInteger)tag;
- (void)protocolRadioViewRepeat:(NSUInteger)tag;
- (void)protocolRadioViewRepeat:(NSUInteger)tag image:(UIImageView *)imageview;
- (void)protocolRadioViewChangeImage:(UIImageView *)iv isEmpty:(BOOL)isEmpty;

@end

@interface RadioView : UIView

//代理
@property (nonatomic, weak) id<RadioViewDelegate> delegate;
@property (nonatomic, strong) UIView * viewSlid;
@property (nonatomic, strong) NSArray * aryImageNames;
@property (nonatomic, strong) NSArray * aryImageHighNames;
@property (nonatomic, strong) NSArray * aryImageEmptyNames;
@property (nonatomic, strong) UIImageView * imageViewArr;
//初始化
- (id)initWithTitles:(NSArray *)aryTitle frame:(CGRect)frame delegate:(id)delegate;

//自定义图片
- (id)initWithTitles:(NSArray *)aryTitle imageNames:(NSArray *)aryNames imageHighNames:(NSArray *)aryHighNames imageEmptyImageNames:(NSArray *)aryEmptyNames frame:(CGRect)frame delegate:(id)delegate;

//自定义高度
- (id)initWithTitles:(NSArray *)aryTitle height:(CGFloat)height delegate:(id)delegate;

- (id)initWithTitles:(NSArray *)aryTitle delegate:(id)delegate ;

- (void)sliderToIndex:(int)index noticeDelegate:(BOOL)notice;

- (NSUInteger)selectIndex;

- (void)refreshBtn:(int)indext  title:(NSString *)strTitle;

@end
