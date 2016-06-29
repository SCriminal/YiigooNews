//
//  BaseSubImagePickerViewController.h
//  米兰港
//
//  Created by suibian_milangang_sqc on 15/10/14.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseSubViewController.h"
//自定义选照片
#import "SLDImagePIckerViewController.h"

@interface BaseSubImagePickerViewController : BaseSubViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>{
    SLDImagePIckerViewController * _imagePickerController;
    BOOL _isEditAllow;
}
@property (nonatomic,strong) UIImage * imagePicker;

//获取图片的接口
- (void)getImage:(UIImage *)aImage;
- (void)getImage:(UIImage *)aImage info:(NSDictionary *)info;
//打开照相机
- (void)openCamera;
//打开相册
- (void)openAlbum;
//显示ActionSheet
- (void)showAction;

@end
