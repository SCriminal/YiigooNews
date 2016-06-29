//
//  ModelComment_Data.m
//
//  Created by   on 16/6/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ModelComment_Data.h"


NSString *const kModelComment_DataHasMore = @"hasMore";
NSString *const kModelComment_DataSupportFlag = @"supportFlag";
NSString *const kModelComment_DataContent = @"content";
NSString *const kModelComment_DataContentID = @"contentID";
NSString *const kModelComment_DataTime = @"time";
NSString *const kModelComment_DataUnsupportNum = @"unsupportNum";
NSString *const kModelComment_DataContents = @"contents";
NSString *const kModelComment_DataImageHeadURL = @"imageHeadURL";
NSString *const kModelComment_DataName = @"name";
NSString *const kModelComment_DataSupportNum = @"supportNum";


@interface ModelComment_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ModelComment_Data

@synthesize hasMore = _hasMore;
@synthesize supportFlag = _supportFlag;
@synthesize content = _content;
@synthesize contentID = _contentID;
@synthesize time = _time;
@synthesize unsupportNum = _unsupportNum;
@synthesize contents = _contents;
@synthesize imageHeadURL = _imageHeadURL;
@synthesize name = _name;
@synthesize supportNum = _supportNum;


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
            self.hasMore = [[self objectOrNilForKey:kModelComment_DataHasMore fromDictionary:dict] boolValue];
            self.supportFlag = [self objectOrNilForKey:kModelComment_DataSupportFlag fromDictionary:dict];
            self.content = [self objectOrNilForKey:kModelComment_DataContent fromDictionary:dict];
            self.contentID = [self objectOrNilForKey:kModelComment_DataContentID fromDictionary:dict];
            self.time = [self objectOrNilForKey:kModelComment_DataTime fromDictionary:dict];
            self.unsupportNum = [self objectOrNilForKey:kModelComment_DataUnsupportNum fromDictionary:dict];
    NSObject *receivedModelComment_Contents = [dict objectForKey:kModelComment_DataContents];
    NSMutableArray *parsedModelComment_Contents = [NSMutableArray array];
    if ([receivedModelComment_Contents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedModelComment_Contents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedModelComment_Contents addObject:[ModelComment_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedModelComment_Contents isKindOfClass:[NSDictionary class]]) {
       [parsedModelComment_Contents addObject:[ModelComment_Data modelObjectWithDictionary:(NSDictionary *)receivedModelComment_Contents]];
    }

    self.contents = [NSArray arrayWithArray:parsedModelComment_Contents];
            self.imageHeadURL = [self objectOrNilForKey:kModelComment_DataImageHeadURL fromDictionary:dict];
            self.name = [self objectOrNilForKey:kModelComment_DataName fromDictionary:dict];
            self.supportNum = [self objectOrNilForKey:kModelComment_DataSupportNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kModelComment_DataHasMore];
    [mutableDict setValue:self.supportFlag forKey:kModelComment_DataSupportFlag];
    [mutableDict setValue:self.content forKey:kModelComment_DataContent];
    [mutableDict setValue:self.contentID forKey:kModelComment_DataContentID];
    [mutableDict setValue:self.time forKey:kModelComment_DataTime];
    [mutableDict setValue:self.unsupportNum forKey:kModelComment_DataUnsupportNum];
    NSMutableArray *tempArrayForContents = [NSMutableArray array];
    for (NSObject *subArrayObject in self.contents) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForContents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForContents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContents] forKey:kModelComment_DataContents];
    [mutableDict setValue:self.imageHeadURL forKey:kModelComment_DataImageHeadURL];
    [mutableDict setValue:self.name forKey:kModelComment_DataName];
    [mutableDict setValue:self.supportNum forKey:kModelComment_DataSupportNum];

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

    self.hasMore = [aDecoder decodeBoolForKey:kModelComment_DataHasMore];
    self.supportFlag = [aDecoder decodeObjectForKey:kModelComment_DataSupportFlag];
    self.content = [aDecoder decodeObjectForKey:kModelComment_DataContent];
    self.contentID = [aDecoder decodeObjectForKey:kModelComment_DataContentID];
    self.time = [aDecoder decodeObjectForKey:kModelComment_DataTime];
    self.unsupportNum = [aDecoder decodeObjectForKey:kModelComment_DataUnsupportNum];
    self.contents = [aDecoder decodeObjectForKey:kModelComment_DataContents];
    self.imageHeadURL = [aDecoder decodeObjectForKey:kModelComment_DataImageHeadURL];
    self.name = [aDecoder decodeObjectForKey:kModelComment_DataName];
    self.supportNum = [aDecoder decodeObjectForKey:kModelComment_DataSupportNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasMore forKey:kModelComment_DataHasMore];
    [aCoder encodeObject:_supportFlag forKey:kModelComment_DataSupportFlag];
    [aCoder encodeObject:_content forKey:kModelComment_DataContent];
    [aCoder encodeObject:_contentID forKey:kModelComment_DataContentID];
    [aCoder encodeObject:_time forKey:kModelComment_DataTime];
    [aCoder encodeObject:_unsupportNum forKey:kModelComment_DataUnsupportNum];
    [aCoder encodeObject:_contents forKey:kModelComment_DataContents];
    [aCoder encodeObject:_imageHeadURL forKey:kModelComment_DataImageHeadURL];
    [aCoder encodeObject:_name forKey:kModelComment_DataName];
    [aCoder encodeObject:_supportNum forKey:kModelComment_DataSupportNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    ModelComment_Data *copy = [[ModelComment_Data alloc] init];
    
    if (copy) {

        copy.hasMore = self.hasMore;
        copy.supportFlag = [self.supportFlag copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.contentID = [self.contentID copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.unsupportNum = [self.unsupportNum copyWithZone:zone];
        copy.contents = [self.contents copyWithZone:zone];
        copy.imageHeadURL = [self.imageHeadURL copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.supportNum = [self.supportNum copyWithZone:zone];
    }
    
    return copy;
}


@end
