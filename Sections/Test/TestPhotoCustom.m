//
//  TestPhotoCustom.m
//  yiguo
//
//  Created by 隋林栋 on 16/5/13.
//
//

#import "TestPhotoCustom.h"

#import<Photos/Photos.h>

#import <PhotosUI/PhotosUI.h>

#import "CustomPhotoCollectionViewCell.h"

@interface TestPhotoCustom ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView * _collectionView;
    NSMutableArray * _muAryData;
    NSMutableArray * _muAryAsset;
    UIImageView * _imageViewBig;
}

@end

@implementation TestPhotoCustom


- (void)viewDidLoad{
    [super viewDidLoad];
    _muAryData = [[NSMutableArray alloc]init];
    _muAryAsset = [[NSMutableArray alloc]init];
    //初始化列表
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumLineSpacing = 1.0f;
    layout.minimumInteritemSpacing = 1.0f;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, screenWidth, screenHeight-64) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[CustomPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"CustomPhotoCollectionViewCell"];
    [self.view addSubview:_collectionView];
    
    [self getAlbumsFromDevice];
}

#pragma mark collectionView代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _muAryData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(screenWidth/4-5, screenWidth/4-5);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomPhotoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomPhotoCollectionViewCell" forIndexPath:indexPath];
    [cell resetCellImage:_muAryData[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_imageViewBig == nil) {
        _imageViewBig = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenWidth)];
        _imageViewBig.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:_imageViewBig];
    }
    //创建参数
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc]init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    options.networkAccessAllowed = NO;
    
    
    PHImageManager *manager = [PHImageManager defaultManager];
    [manager requestImageForAsset:[_muAryAsset objectAtIndex:indexPath.row] targetSize:CGSizeMake(screenWidth, screenWidth) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {

        _imageViewBig.image = result;
    }];

}

#pragma mark 判断相册权限 ios8
- (void)checkAuthorizationsStatus_AfteriOS8{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    switch (status) {
        case PHAuthorizationStatusNotDetermined:
        {
            NSLog(@"User has not yet made a choice with regards to this application");
        }
            break;
        case PHAuthorizationStatusRestricted:
        {
            NSLog(@"This application is not authorized to access photo data.");
        }
            break;
        case PHAuthorizationStatusDenied:
        {
            NSLog(@"User has explicitly denied this application access to photos data.");
        }
            break;
        case PHAuthorizationStatusAuthorized:
        {
            NSLog(@"User has authorized this application to access photos data.");
        }
            break;
        default:
            break;
    }
}

/*
 
 */

#pragma mark 请求权限
- (void)requestAuthorizationStatus_AfteriOS8{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){        dispatch_async(dispatch_get_main_queue(), ^{
        switch (status) {
            case PHAuthorizationStatusAuthorized:
            {
                //[self checkAuthorizationSuccess];
                break;
            }
            default:
            {
                //[self showAccessDenied];
                break;
            }
        }});
    }];
}


#pragma mark 获取资源
- (void)getAlbumsFromDevice {

    PHFetchOptions *allPhotosOptions = [[PHFetchOptions alloc] init];
    // 按图片生成时间排序
    allPhotosOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    // 获取图片
    PHFetchResult * fetchResult =  [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:allPhotosOptions];
    if (fetchResult.count<=0) {
        NSLog(@"no result ");
        return;
    }
    for (PHAsset * asset in fetchResult) {
        [self fetchImage:asset];
    }
}

- (void)fetchImage:(PHAsset *)asset{
    
    //创建参数
    PHImageRequestOptions * options = [[PHImageRequestOptions alloc]init];
    options.deliveryMode = PHImageRequestOptionsDeliveryModeFastFormat;
    options.networkAccessAllowed = NO;
    
    
    PHImageManager *manager = [PHImageManager defaultManager];
    [manager requestImageForAsset:asset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFit options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        NSLog(@"%@",info);
        NSLog(@"%@",asset);
        [_muAryData addObject:result];
        [_muAryAsset addObject:asset];
        [_collectionView reloadData];
    }];

}

@end
