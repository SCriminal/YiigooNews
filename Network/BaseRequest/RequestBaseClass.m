//
//  RequestBaseClass.m
//  yiguo
//
//  Created by 隋林栋 on 16/4/28.
//
//

#import "RequestBaseClass.h"
//md5
#import "MLMD5Trans.h"

@implementation RequestBaseClass


//类方法 构建方法
+ (instancetype)manager{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    RequestBaseClass *manager = [[RequestBaseClass alloc]initWithSessionConfiguration:configuration];
    return  manager;
}

- (void)postUrl:(NSString *)URL
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
        success:(void (^)(NSURLSessionDataTask * _Nonnull task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask * _Nonnull task, id error))failure{
    [self postUrl:URL method:method parameters:parameters returnALL:NO constructingBodyWithBlock:nil success:success failure:failure];
}

- (void)postUrl:(NSString *)URL
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
      returnALL:(BOOL)returnAll
        success:(void (^)(NSURLSessionDataTask * _Nonnull task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask * _Nonnull task, id error))failure{
    [self postUrl:URL method:method parameters:parameters returnALL:returnAll constructingBodyWithBlock:nil success:success failure:failure];
}

- (void)postUrl:(NSString *)URL
         method:(NSString *)method
     parameters:(NSDictionary *)parameters
      returnALL:(BOOL)returnAll
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
        success:(void (^)(NSURLSessionDataTask * _Nonnull task, id responseObject))success
        failure:(void (^)(NSURLSessionDataTask * _Nonnull task, id error))failure{
    if (parameters == nil)   parameters = [NSDictionary dictionary];
    
    //设置请求头
    NSMutableDictionary * muDic = [self setInitHead:parameters method:method];
    //拼接参数
    NSString * urlNew = [NSString stringWithFormat:@"%@%@",BASEURL,URL];
    //走回调 隐藏progress
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolShowProgressMethod:viewShow:)]) {
        [self.delegate protocolShowProgressMethod:method viewShow:nil];
    }
    [self POST:urlNew parameters:muDic constructingBodyWithBlock:block progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 0. 传回JSON存储在一个字典里
        //        NSString * strTmp = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",strTmp);
        NSDictionary *dict =responseObject;
        if (dict == nil ) {
            //走回调 隐藏progress
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolHideProgressMehtod:error:viewShow:show:)]) {
                [self.delegate protocolHideProgressMehtod:method error:@"数据解析失败" viewShow:nil show:YES];
            }
            
            failure(task,@"数据解析错误");
            NSLog(@"error:数据解析错误%@",responseObject);
            return ;
        }
        //获取json数据
        NSData * dataJson = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
        NSString * strJson = [[NSString alloc]initWithData:dataJson encoding:NSUTF8StringEncoding];
        NSLog(@"URL:%@   Parameters:%@    Reponse:%@", urlNew, muDic, strJson);
        
        if([[dict objectForKey:@"Status"] integerValue] == 1){
            
            
            //走回调 隐藏progress
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolHideProgressMehtod:success:viewShow:show:)]) {
                [self.delegate protocolHideProgressMehtod:method success:@"" viewShow:nil show:NO];
            }
            if (returnAll) {
                success(task,dict);
            }else{
                success(task,dict[@"Data"]);
            }
        } else {
            //走回调 隐藏progress
            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolHideProgressMehtod:error:viewShow:show:)]) {
                [self.delegate protocolHideProgressMehtod:method error:dict[@"Message"] viewShow:nil show:YES];
            }
            
            failure(task,dict);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"URL:%@   Parameters:%@    Reponse:error 连接失败",urlNew,muDic);
        //走回调 隐藏progress
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(protocolHideProgressMehtod:error:viewShow:show:)]) {
            [self.delegate protocolHideProgressMehtod:method error:@"网络连接失败" viewShow:nil show:YES];
        }
        failure(task,@"网络连接失败");

    }];

}


#pragma mark 拼接基础头字符串
- (NSMutableDictionary *)setInitHead:(NSDictionary *)dicParameters  method:(NSString *)method{
    NSMutableDictionary * muDic = [NSMutableDictionary dictionaryWithDictionary:dicParameters];
    [muDic setObject:method forKey:@"method"];
    [self fetchPwd:muDic];
    [self fetchSystem:muDic];
    [self fetchUserID:muDic];
    return muDic;
}




#pragma mark 拼接头数据
- (void)fetchPwd:(NSMutableDictionary *)muDic{
    //如果有用户名 密码就不需要拼接
    NSString * strUserName = muDic[@"username"];
    if (strUserName != nil) return;
    
    //如果没有登陆就不拼接
    GlobalData * gbData = [GlobalData sharedInstance];
    if (gbData.GB_UserModel == nil) {
        return;
    }
    
    //读取本地用户名 密码
    NSUserDefaults      *userDefaults  = [NSUserDefaults standardUserDefaults]; // 读取userdefault存储的用户名密码
    NSString            *username      = [userDefaults stringForKey:LOCAL_USER_NAME];
    
    NSString *password = [userDefaults stringForKey:LOCAL_PWD];
    if (password!= nil && password.length != 0 && username!= nil && username.length != 0 ) {
        [muDic setObject:username forKey:@"username"];
        [muDic setObject:[MLMD5Trans getFinalMd5P:password] forKey:@"password"];
    }else{
        
    }
}

//拼接苹果系统数据
- (void)fetchSystem:(NSMutableDictionary *)muDic{
    [muDic setObject:@"2" forKey:@"os"];
    NSString *currentVersion =[GlobalMethod getVersion];
    [muDic setObject:currentVersion forKey:@"versionCode"];
    
}

//获取userID
- (void)fetchUserID:(NSMutableDictionary *)muDic{
    GlobalData * gbData = [GlobalData sharedInstance];
    //如果没有登陆就不拼接
    if (gbData.GB_UserModel == nil) {
        return;
    }
    NSNumber *uid = [NSNumber numberWithDouble: gbData.GB_UserModel.userID];
    [muDic setObject:uid  forKey:@"uid"];
}


@end
