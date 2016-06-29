//
//  custemButton.m
//  PortOfMilan
//
//  Created by suibian_milangang_sqc on 14-12-25.
//
//

#import "custemButton.h"

@implementation custemButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        self.rightLabel.font = [UIFont systemFontOfSize:13];
        self.leftImage.contentMode = UIViewContentModeLeft;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width - 30;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    contentRect = (CGRect){
        {
            titleX,titleY
        },
        {
            titleW,titleH
        }
    };
    return contentRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 15;
    CGFloat imageH = 15;
    CGFloat imageX = contentRect.size.width -5;
    CGFloat imageY = 2.5;
    contentRect = (CGRect){
        {
            imageX,imageY
        },
        {
            imageW,imageH
        }
    };
    return contentRect;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
