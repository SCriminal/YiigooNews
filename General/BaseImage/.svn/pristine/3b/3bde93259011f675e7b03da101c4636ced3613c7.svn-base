//
//  UIImage+WM.m
//  MilanPort
//
//  Created by DeanW on 14-8-18.
//  Copyright (c) 2014年 Suibian. All rights reserved.
//

#import "UIImage+WM.h"

@implementation UIImage (WM)

+ (instancetype)imageWithName:(NSString *)imageName
{
    // 定义返回对象
    UIImage *image = nil;
    
    // 判断是否为iOS7
    if (iOS7) {
        
        // 在图片名称后拼接_iOS7
        NSString *iOS7ImageName = [imageName stringByAppendingString:@"_iOS7"];
        image = [UIImage imageNamed:iOS7ImageName];
    }
    
    // 判断图片是否为nil（iOS6 7通用的图片）
    if (image == nil) {
        image = [UIImage imageNamed:imageName];
    }
    
    return image;
}

+ (instancetype)resizableImageWithName:(NSString *)imageName
{
    return [self resizableImageWithName:imageName left:0.5 top:0.5];
}


+ (instancetype)resizableImageWithName:(NSString *)imageName left:(CGFloat)leftRatio top:(CGFloat)topRatio
{
    UIImage *image = [UIImage imageWithName:imageName];
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    return [image stretchableImageWithLeftCapWidth:left topCapHeight:top];


}

@end
