//
//  ModelUserUserPermission.m
//
//  Created by 隋林栋  on 15/5/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ModelUserUserPermission.h"


NSString *const kModelUserUserPermissionTakeDeliveryGoods = @"TakeDeliveryGoods";
NSString *const kModelUserUserPermissionType = @"$type";
NSString *const kModelUserUserPermissionSubmitRefund = @"SubmitRefund";
NSString *const kModelUserUserPermissionFirmOrder = @"FirmOrder";
NSString *const kModelUserUserPermissionSubmitPay = @"SubmitPay";
NSString *const kModelUserUserPermissionCancelOrder = @"CancelOrder";
NSString *const kModelUserUserPermissionCancelRefund = @"CancelRefund";
NSString *const kModelUserUserPermissionSubmitOrder = @"SubmitOrder";


@interface ModelUserUserPermission ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ModelUserUserPermission

@synthesize takeDeliveryGoods = _takeDeliveryGoods;
@synthesize type = _type;
@synthesize submitRefund = _submitRefund;
@synthesize firmOrder = _firmOrder;
@synthesize submitPay = _submitPay;
@synthesize cancelOrder = _cancelOrder;
@synthesize cancelRefund = _cancelRefund;
@synthesize submitOrder = _submitOrder;


+ (ModelUserUserPermission *)modelObjectWithDictionary:(NSDictionary *)dict
{
    ModelUserUserPermission *instance = [[ModelUserUserPermission alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.takeDeliveryGoods = [[self objectOrNilForKey:kModelUserUserPermissionTakeDeliveryGoods fromDictionary:dict] boolValue];
            self.type = [self objectOrNilForKey:kModelUserUserPermissionType fromDictionary:dict];
            self.submitRefund = [[self objectOrNilForKey:kModelUserUserPermissionSubmitRefund fromDictionary:dict] boolValue];
            self.firmOrder = [[self objectOrNilForKey:kModelUserUserPermissionFirmOrder fromDictionary:dict] boolValue];
            self.submitPay = [[self objectOrNilForKey:kModelUserUserPermissionSubmitPay fromDictionary:dict] boolValue];
            self.cancelOrder = [[self objectOrNilForKey:kModelUserUserPermissionCancelOrder fromDictionary:dict] boolValue];
            self.cancelRefund = [[self objectOrNilForKey:kModelUserUserPermissionCancelRefund fromDictionary:dict] boolValue];
            self.submitOrder = [[self objectOrNilForKey:kModelUserUserPermissionSubmitOrder fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.takeDeliveryGoods] forKey:kModelUserUserPermissionTakeDeliveryGoods];
    [mutableDict setValue:self.type forKey:kModelUserUserPermissionType];
    [mutableDict setValue:[NSNumber numberWithBool:self.submitRefund] forKey:kModelUserUserPermissionSubmitRefund];
    [mutableDict setValue:[NSNumber numberWithBool:self.firmOrder] forKey:kModelUserUserPermissionFirmOrder];
    [mutableDict setValue:[NSNumber numberWithBool:self.submitPay] forKey:kModelUserUserPermissionSubmitPay];
    [mutableDict setValue:[NSNumber numberWithBool:self.cancelOrder] forKey:kModelUserUserPermissionCancelOrder];
    [mutableDict setValue:[NSNumber numberWithBool:self.cancelRefund] forKey:kModelUserUserPermissionCancelRefund];
    [mutableDict setValue:[NSNumber numberWithBool:self.submitOrder] forKey:kModelUserUserPermissionSubmitOrder];

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

    self.takeDeliveryGoods = [aDecoder decodeBoolForKey:kModelUserUserPermissionTakeDeliveryGoods];
    self.type = [aDecoder decodeObjectForKey:kModelUserUserPermissionType];
    self.submitRefund = [aDecoder decodeBoolForKey:kModelUserUserPermissionSubmitRefund];
    self.firmOrder = [aDecoder decodeBoolForKey:kModelUserUserPermissionFirmOrder];
    self.submitPay = [aDecoder decodeBoolForKey:kModelUserUserPermissionSubmitPay];
    self.cancelOrder = [aDecoder decodeBoolForKey:kModelUserUserPermissionCancelOrder];
    self.cancelRefund = [aDecoder decodeBoolForKey:kModelUserUserPermissionCancelRefund];
    self.submitOrder = [aDecoder decodeBoolForKey:kModelUserUserPermissionSubmitOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_takeDeliveryGoods forKey:kModelUserUserPermissionTakeDeliveryGoods];
    [aCoder encodeObject:_type forKey:kModelUserUserPermissionType];
    [aCoder encodeBool:_submitRefund forKey:kModelUserUserPermissionSubmitRefund];
    [aCoder encodeBool:_firmOrder forKey:kModelUserUserPermissionFirmOrder];
    [aCoder encodeBool:_submitPay forKey:kModelUserUserPermissionSubmitPay];
    [aCoder encodeBool:_cancelOrder forKey:kModelUserUserPermissionCancelOrder];
    [aCoder encodeBool:_cancelRefund forKey:kModelUserUserPermissionCancelRefund];
    [aCoder encodeBool:_submitOrder forKey:kModelUserUserPermissionSubmitOrder];
}


@end
