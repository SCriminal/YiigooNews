//
//  UIImage+WM.h
//  MilanPort
//
//  Created by DeanW on 14-8-18.
//  Copyright (c) 2014年 Suibian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WM)

/**
 *  创建适配好 iOS6 和 7 的图片
 */
+ (instancetype)imageWithName:(NSString *)imageName;

/**
 *  设置图片拉伸不变形
 */
+ (instancetype)resizableImageWithName:(NSString *)imageName;

+ (instancetype)resizableImageWithName:(NSString *)imageName left:(CGFloat)left top:(CGFloat)top;

@end
