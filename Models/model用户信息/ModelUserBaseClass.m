//
//  ModelUserBaseClass.m
//
//  Created by 隋林栋  on 15/5/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ModelUserBaseClass.h"
#import "ModelUserUserPermission.h"


NSString *const kModelUserBaseClassCompanyName = @"CompanyName";
NSString *const kModelUserBaseClassQQ = @"QQ";
NSString *const kModelUserBaseClassIsAdmin = @"IsAdmin";
NSString *const kModelUserBaseClassUserID = @"UserID";
NSString *const kModelUserBaseClassCheckStatus = @"CheckStatus";
NSString *const kModelUserBaseClassMajorTrade = @"MajorTrade";
NSString *const kModelUserBaseClassCreateTime = @"CreateTime";
NSString *const kModelUserBaseClassUserName = @"UserName";
NSString *const kModelUserBaseClassIsUnautherizedUser = @"IsUnautherizedUser";
NSString *const kModelUserBaseClassCityId = @"CityId";
NSString *const kModelUserBaseClassLongitude = @"Longitude";
NSString *const kModelUserBaseClassGender = @"Gender";
NSString *const kModelUserBaseClassMobile = @"Mobile";
NSString *const kModelUserBaseClassNickName = @"NickName";
NSString *const kModelUserBaseClassSupplierID = @"SupplierID";
NSString *const kModelUserBaseClassEmail = @"Email";
NSString *const kModelUserBaseClassTrueName = @"TrueName";
NSString *const kModelUserBaseClassLoginTime = @"LoginTime";
NSString *const kModelUserBaseClassLatitude = @"Latitude";
NSString *const kModelUserBaseClassSupplierType = @"SupplierType";
NSString *const kModelUserBaseClassStatus = @"Status";
NSString *const kModelUserBaseClassImageUrl = @"ImageUrl";
NSString *const kModelUserBaseClassTradeType = @"TradeType";
NSString *const kModelUserBaseClassUserPermission = @"UserPermission";


@interface ModelUserBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ModelUserBaseClass

@synthesize companyName = _companyName;
@synthesize qQ = _qQ;
@synthesize isAdmin = _isAdmin;
@synthesize userID = _userID;
@synthesize checkStatus = _checkStatus;
@synthesize majorTrade = _majorTrade;
@synthesize createTime = _createTime;
@synthesize userName = _userName;
@synthesize isUnautherizedUser = _isUnautherizedUser;
@synthesize cityId = _cityId;
@synthesize longitude = _longitude;
@synthesize gender = _gender;
@synthesize mobile = _mobile;
@synthesize nickName = _nickName;
@synthesize supplierID = _supplierID;
@synthesize email = _email;
@synthesize trueName = _trueName;
@synthesize loginTime = _loginTime;
@synthesize latitude = _latitude;
@synthesize supplierType = _supplierType;
@synthesize status = _status;
@synthesize imageUrl = _imageUrl;
@synthesize tradeType = _tradeType;
@synthesize userPermission = _userPermission;


+ (ModelUserBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict
{
    ModelUserBaseClass *instance = [[ModelUserBaseClass alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.companyName = [self objectOrNilForKey:kModelUserBaseClassCompanyName fromDictionary:dict];
            self.qQ = [self objectOrNilForKey:kModelUserBaseClassQQ fromDictionary:dict];
            self.isAdmin = [[self objectOrNilForKey:kModelUserBaseClassIsAdmin fromDictionary:dict] doubleValue];
            self.userID = [[self objectOrNilForKey:kModelUserBaseClassUserID fromDictionary:dict] doubleValue];
            self.checkStatus = [[self objectOrNilForKey:kModelUserBaseClassCheckStatus fromDictionary:dict] doubleValue];
            self.majorTrade = [self objectOrNilForKey:kModelUserBaseClassMajorTrade fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kModelUserBaseClassCreateTime fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kModelUserBaseClassUserName fromDictionary:dict];
            self.isUnautherizedUser = [[self objectOrNilForKey:kModelUserBaseClassIsUnautherizedUser fromDictionary:dict] boolValue];
            self.cityId = [[self objectOrNilForKey:kModelUserBaseClassCityId fromDictionary:dict] doubleValue];
            self.longitude = [[self objectOrNilForKey:kModelUserBaseClassLongitude fromDictionary:dict] doubleValue];
            self.gender = [[self objectOrNilForKey:kModelUserBaseClassGender fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kModelUserBaseClassMobile fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kModelUserBaseClassNickName fromDictionary:dict];
            self.supplierID = [[self objectOrNilForKey:kModelUserBaseClassSupplierID fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kModelUserBaseClassEmail fromDictionary:dict];
            self.trueName = [self objectOrNilForKey:kModelUserBaseClassTrueName fromDictionary:dict];
            self.loginTime = [self objectOrNilForKey:kModelUserBaseClassLoginTime fromDictionary:dict];
            self.latitude = [[self objectOrNilForKey:kModelUserBaseClassLatitude fromDictionary:dict] doubleValue];
            self.supplierType = [[self objectOrNilForKey:kModelUserBaseClassSupplierType fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kModelUserBaseClassStatus fromDictionary:dict] doubleValue];
            self.imageUrl = [self objectOrNilForKey:kModelUserBaseClassImageUrl fromDictionary:dict];
            self.tradeType = [[self objectOrNilForKey:kModelUserBaseClassTradeType fromDictionary:dict] doubleValue];
            self.userPermission = [ModelUserUserPermission modelObjectWithDictionary:[dict objectForKey:kModelUserBaseClassUserPermission]];
        
            //sld_change
            self.isOpen =  [[self objectOrNilForKey:@"IsOpen" fromDictionary:dict] boolValue];
        
            //sld_change
            self.ShopName = [self objectOrNilForKey:@"ShopName" fromDictionary:dict];
            self.LogoURL = [self objectOrNilForKey:@"LogoURL" fromDictionary:dict];
            //sld_change 2015年11月17日14:57:46
            self.InvitationCode = [self objectOrNilForKey:@"InvitationCode" fromDictionary:dict];
            self.IsSFBussinessMan = [[self objectOrNilForKey:@"IsSFBussinessMan" fromDictionary:dict] doubleValue];
            self.AgentType = [[self objectOrNilForKey:@"AgentType" fromDictionary:dict] doubleValue];
            self.PayStatus = [[self objectOrNilForKey:@"PayStatus" fromDictionary:dict] doubleValue];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.companyName forKey:kModelUserBaseClassCompanyName];
    [mutableDict setValue:self.qQ forKey:kModelUserBaseClassQQ];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAdmin] forKey:kModelUserBaseClassIsAdmin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userID] forKey:kModelUserBaseClassUserID];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkStatus] forKey:kModelUserBaseClassCheckStatus];
NSMutableArray *tempArrayForMajorTrade = [NSMutableArray array];
    for (NSObject *subArrayObject in self.majorTrade) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMajorTrade addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMajorTrade addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMajorTrade] forKey:@"kModelUserBaseClassMajorTrade"];
    [mutableDict setValue:self.createTime forKey:kModelUserBaseClassCreateTime];
    [mutableDict setValue:self.userName forKey:kModelUserBaseClassUserName];
    [mutableDict setValue:[NSNumber numberWithBool:self.isUnautherizedUser] forKey:kModelUserBaseClassIsUnautherizedUser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cityId] forKey:kModelUserBaseClassCityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.longitude] forKey:kModelUserBaseClassLongitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kModelUserBaseClassGender];
    [mutableDict setValue:self.mobile forKey:kModelUserBaseClassMobile];
    [mutableDict setValue:self.nickName forKey:kModelUserBaseClassNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.supplierID] forKey:kModelUserBaseClassSupplierID];
    [mutableDict setValue:self.email forKey:kModelUserBaseClassEmail];
    [mutableDict setValue:self.trueName forKey:kModelUserBaseClassTrueName];
    [mutableDict setValue:self.loginTime forKey:kModelUserBaseClassLoginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latitude] forKey:kModelUserBaseClassLatitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.supplierType] forKey:kModelUserBaseClassSupplierType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kModelUserBaseClassStatus];
    [mutableDict setValue:self.imageUrl forKey:kModelUserBaseClassImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tradeType] forKey:kModelUserBaseClassTradeType];
    [mutableDict setValue:[self.userPermission dictionaryRepresentation] forKey:kModelUserBaseClassUserPermission];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.companyName = [aDecoder decodeObjectForKey:kModelUserBaseClassCompanyName];
    self.qQ = [aDecoder decodeObjectForKey:kModelUserBaseClassQQ];
    self.isAdmin = [aDecoder decodeDoubleForKey:kModelUserBaseClassIsAdmin];
    self.userID = [aDecoder decodeDoubleForKey:kModelUserBaseClassUserID];
    self.checkStatus = [aDecoder decodeDoubleForKey:kModelUserBaseClassCheckStatus];
    self.majorTrade = [aDecoder decodeObjectForKey:kModelUserBaseClassMajorTrade];
    self.createTime = [aDecoder decodeObjectForKey:kModelUserBaseClassCreateTime];
    self.userName = [aDecoder decodeObjectForKey:kModelUserBaseClassUserName];
    self.isUnautherizedUser = [aDecoder decodeBoolForKey:kModelUserBaseClassIsUnautherizedUser];
    self.cityId = [aDecoder decodeDoubleForKey:kModelUserBaseClassCityId];
    self.longitude = [aDecoder decodeDoubleForKey:kModelUserBaseClassLongitude];
    self.gender = [aDecoder decodeDoubleForKey:kModelUserBaseClassGender];
    self.mobile = [aDecoder decodeObjectForKey:kModelUserBaseClassMobile];
    self.nickName = [aDecoder decodeObjectForKey:kModelUserBaseClassNickName];
    self.supplierID = [aDecoder decodeDoubleForKey:kModelUserBaseClassSupplierID];
    self.email = [aDecoder decodeObjectForKey:kModelUserBaseClassEmail];
    self.trueName = [aDecoder decodeObjectForKey:kModelUserBaseClassTrueName];
    self.loginTime = [aDecoder decodeObjectForKey:kModelUserBaseClassLoginTime];
    self.latitude = [aDecoder decodeDoubleForKey:kModelUserBaseClassLatitude];
    self.supplierType = [aDecoder decodeDoubleForKey:kModelUserBaseClassSupplierType];
    self.status = [aDecoder decodeDoubleForKey:kModelUserBaseClassStatus];
    self.imageUrl = [aDecoder decodeObjectForKey:kModelUserBaseClassImageUrl];
    self.tradeType = [aDecoder decodeDoubleForKey:kModelUserBaseClassTradeType];
    self.userPermission = [aDecoder decodeObjectForKey:kModelUserBaseClassUserPermission];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_companyName forKey:kModelUserBaseClassCompanyName];
    [aCoder encodeObject:_qQ forKey:kModelUserBaseClassQQ];
    [aCoder encodeDouble:_isAdmin forKey:kModelUserBaseClassIsAdmin];
    [aCoder encodeDouble:_userID forKey:kModelUserBaseClassUserID];
    [aCoder encodeDouble:_checkStatus forKey:kModelUserBaseClassCheckStatus];
    [aCoder encodeObject:_majorTrade forKey:kModelUserBaseClassMajorTrade];
    [aCoder encodeObject:_createTime forKey:kModelUserBaseClassCreateTime];
    [aCoder encodeObject:_userName forKey:kModelUserBaseClassUserName];
    [aCoder encodeBool:_isUnautherizedUser forKey:kModelUserBaseClassIsUnautherizedUser];
    [aCoder encodeDouble:_cityId forKey:kModelUserBaseClassCityId];
    [aCoder encodeDouble:_longitude forKey:kModelUserBaseClassLongitude];
    [aCoder encodeDouble:_gender forKey:kModelUserBaseClassGender];
    [aCoder encodeObject:_mobile forKey:kModelUserBaseClassMobile];
    [aCoder encodeObject:_nickName forKey:kModelUserBaseClassNickName];
    [aCoder encodeDouble:_supplierID forKey:kModelUserBaseClassSupplierID];
    [aCoder encodeObject:_email forKey:kModelUserBaseClassEmail];
    [aCoder encodeObject:_trueName forKey:kModelUserBaseClassTrueName];
    [aCoder encodeObject:_loginTime forKey:kModelUserBaseClassLoginTime];
    [aCoder encodeDouble:_latitude forKey:kModelUserBaseClassLatitude];
    [aCoder encodeDouble:_supplierType forKey:kModelUserBaseClassSupplierType];
    [aCoder encodeDouble:_status forKey:kModelUserBaseClassStatus];
    [aCoder encodeObject:_imageUrl forKey:kModelUserBaseClassImageUrl];
    [aCoder encodeDouble:_tradeType forKey:kModelUserBaseClassTradeType];
    [aCoder encodeObject:_userPermission forKey:kModelUserBaseClassUserPermission];
}


@end
