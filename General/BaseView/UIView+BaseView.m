//
//  UIView+BaseView.m
//  ElectronicCard
//
//  Created by 隋林栋 on 14-4-18.
//  Copyright (c) 2014年 Sl. All rights reserved.
//

#import "UIView+BaseView.h"

@implementation UIView (BaseView)

- (CGFloat)mid{
    return self.frame.origin.x + self.frame.size.width/2.0;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (CGFloat)bottom{
    return self.frame.size.height+self.frame.origin.y;
}

- (CGFloat)top{
    return self.frame.origin.y;

}

- (CGFloat)left{
    return self.frame.origin.x;
    
}

- (CGFloat)right{
    return self.frame.origin.x+self.frame.size.width;
    
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}



- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}



- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}





@end
