//
//  ModelUserUserPermission.h
//
//  Created by 隋林栋  on 15/5/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelUserUserPermission : NSObject <NSCoding>

@property (nonatomic, assign) BOOL takeDeliveryGoods;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) BOOL submitRefund;
@property (nonatomic, assign) BOOL firmOrder;
@property (nonatomic, assign) BOOL submitPay;
@property (nonatomic, assign) BOOL cancelOrder;
@property (nonatomic, assign) BOOL cancelRefund;
@property (nonatomic, assign) BOOL submitOrder;

+ (ModelUserUserPermission *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
