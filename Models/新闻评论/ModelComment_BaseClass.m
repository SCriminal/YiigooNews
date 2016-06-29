//
//  ModelComment_BaseClass.m
//
//  Created by   on 16/6/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ModelComment_BaseClass.h"
#import "ModelComment_Data.h"


NSString *const kModelComment_BaseClassData = @"data";


@interface ModelComment_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ModelComment_BaseClass

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
    NSObject *receivedModelComment_Data = [dict objectForKey:kModelComment_BaseClassData];
    NSMutableArray *parsedModelComment_Data = [NSMutableArray array];
    if ([receivedModelComment_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedModelComment_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedModelComment_Data addObject:[ModelComment_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedModelComment_Data isKindOfClass:[NSDictionary class]]) {
       [parsedModelComment_Data addObject:[ModelComment_Data modelObjectWithDictionary:(NSDictionary *)receivedModelComment_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedModelComment_Data];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kModelComment_BaseClassData];

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

    self.data = [aDecoder decodeObjectForKey:kModelComment_BaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kModelComment_BaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ModelComment_BaseClass *copy = [[ModelComment_BaseClass alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
