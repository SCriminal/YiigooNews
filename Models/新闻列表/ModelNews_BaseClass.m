//
//  ModelNews_BaseClass.m
//
//  Created by   on 16/6/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ModelNews_BaseClass.h"
#import "ModelNews_Data.h"


NSString *const kModelNews_BaseClassData = @"data";


@interface ModelNews_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ModelNews_BaseClass

@synthesize data = _data;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedModelNews_Data = [dict objectForKey:kModelNews_BaseClassData];
    NSMutableArray *parsedModelNews_Data = [NSMutableArray array];
    if ([receivedModelNews_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedModelNews_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedModelNews_Data addObject:[ModelNews_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedModelNews_Data isKindOfClass:[NSDictionary class]]) {
       [parsedModelNews_Data addObject:[ModelNews_Data modelObjectWithDictionary:(NSDictionary *)receivedModelNews_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedModelNews_Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kModelNews_BaseClassData];

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

    self.data = [aDecoder decodeObjectForKey:kModelNews_BaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kModelNews_BaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ModelNews_BaseClass *copy = [[ModelNews_BaseClass alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
