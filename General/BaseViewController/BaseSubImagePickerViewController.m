//
//  BaseSubImagePickerViewController.m
//  米兰港
//
//  Created by suibian_milangang_sqc on 15/10/14.
//  Copyright (c) 2015年 Sl. All rights reserved.
//

#import "BaseSubImagePickerViewController.h"

@interface BaseSubImagePickerViewController ()

@end

@implementation BaseSubImagePickerViewController

#pragma mark 初始化
- (void)initViews {
    [super initViews];
    //初始化视图
    _imagePickerController = [[SLDImagePIckerViewController alloc]init];
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePickerController.delegate = self;
    _imagePickerController.allowsEditing = _isEditAllow;
   
}

#pragma mark 外部使用
//为了以后的继承不需要再重写imagePick的代理方法
- (void)getImage:(UIImage *)aImage{
    
}

- (void)getImage:(UIImage *)aImage info:(NSDictionary *)info{
    
}

- (void)showAction{
    _imagePickerController.allowsEditing = _isEditAllow;
    UIActionSheet * tmpAs = [[UIActionSheet alloc]initWithTitle:@"选择图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"照相机" otherButtonTitles:@"相册", nil];
    [tmpAs showInView:self.view];
}


#pragma mark 获取选择的图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    if (_isEditAllow) {
        self.imagePicker = [info objectForKey:UIImagePickerControllerEditedImage];
    }else{
        self.imagePicker = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    [self getImage:self.imagePicker];
    [self getImage:self.imagePicker info:info];
}

//点击取消按钮
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self openCamera];
            break;
        case 1:
            [self openAlbum];
            break;
        case 2:
            break;
        default:
            break;
    }
}


#pragma mark 设置图片选择方式并开启

//从照相机选择
- (void)openCamera{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [GlobalMethod showAlert:@"照相机无法使用,请在设置中开启权限"];
        return;
    }
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePickerController.navigationBar.backgroundColor = [UIColor greenColor];
    [self presentViewController:_imagePickerController animated:YES completion:nil];
    
}

//从相片册选择
- (void)openAlbum{
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:_imagePickerController animated:YES completion:nil];
    
}

@end
