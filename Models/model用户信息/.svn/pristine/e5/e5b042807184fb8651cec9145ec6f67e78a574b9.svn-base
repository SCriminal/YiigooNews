//
//  ModelUserBaseClass.h
//
//  Created by 隋林栋  on 15/5/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelUserUserPermission;

@interface ModelUserBaseClass : NSObject <NSCoding>

@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *qQ;
@property (nonatomic, assign) double isAdmin;
@property (nonatomic, assign) double userID;
@property (nonatomic, assign) double checkStatus;
@property (nonatomic, strong) NSArray *majorTrade;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) BOOL isUnautherizedUser;
@property (nonatomic, assign) double cityId;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double gender;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, assign) double supplierID;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *trueName;
@property (nonatomic, strong) NSString *loginTime;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double supplierType;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) double tradeType;
@property (nonatomic, strong) ModelUserUserPermission *userPermission;


//new 是否开过店
@property (nonatomic, assign) BOOL isOpen;

//new
@property (nonatomic, strong) NSString * ShopName;
@property (nonatomic, strong) NSString * LogoURL;
//new cps
@property (nonatomic, strong) NSString * InvitationCode;//邀请码
@property (nonatomic, assign) double IsSFBussinessMan;//该账号是否为SF业务员 0否 1是
@property (nonatomic, assign) double AgentType;  ///代理商类型 1为SF类代理商
@property (nonatomic, assign) double PayStatus;// 注册费用支付状态0否 1是

+ (ModelUserBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
