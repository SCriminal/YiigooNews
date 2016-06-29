//
//  RequestBaseClass.h
//  yiguo
//
//  Created by 隋林栋 on 16/4/28.
//
//

#import <AFNetworking/AFNetworking.h>

// 协议 用来做progress

@protocol RequestBaseClassDelegate <NSObject>

- (void)protocolHideProgressMehtod:(NSString *)method success:(NSString *)message viewShow:(UIView *)viewShow  show:(BOOL)show;
- (void)protocolHideProgressMehtod:(NSString *)method error:(id)error viewShow:(UIView *)viewShow show:(BOOL)show;
- (void)protocolShowProgressMethod:(NSString *)method viewShow:(UIView *)viewShow;
@end

@interface RequestBaseClass : AFHTTPSessionManager

//类方法 构建方法
+ (instancetype)manager;

@property (nonatomic, weak) id <RequestBaseClassDelegate> delegate;
@property (nonatomic, strong) UIViewController * vcUser;

#pragma mark 网络请求
// responseObject 返回数据为data中的内容
- (void)postUrl:(NSString *)URL
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSURLSessionDataTask *  task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask *  task, id error))failure;

// responseObject 返回数据含有status data message
- (void)postUrl:(NSString *)URL
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
      returnALL:(BOOL)returnAll
        success:(void (^)(NSURLSessionDataTask *  task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask *  task, id error))failure;

//上传图片
- (void)postUrl:(NSString *)URL
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
      returnALL:(BOOL)returnAll
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
        success:(void (^)(NSURLSessionDataTask *  task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask *  task, id  error))failure;

@end
