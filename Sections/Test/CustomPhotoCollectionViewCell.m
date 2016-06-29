//
//  CustomPhotoCollectionViewCell.m
//  yiguo
//
//  Created by 隋林栋 on 16/5/13.
//
//

#import "CustomPhotoCollectionViewCell.h"

@implementation CustomPhotoCollectionViewCell{
    
    __weak IBOutlet UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"CustomPhotoCollectionViewCell" owner:self options:nil]lastObject];
    }
    return self;
}

- (void)resetCellImage:(UIImage *)image{
    _imageView.image = image;
}

@end
