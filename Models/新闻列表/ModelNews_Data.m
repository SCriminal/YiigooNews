//
//  ModelNews_Data.m
//
//  Created by   on 16/6/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ModelNews_Data.h"


NSString *const kModelNews_DataImageurl = @"imageurl";
NSString *const kModelNews_DataContent = @"content";
NSString *const kModelNews_DataNewsID = @"newsID";
NSString *const kModelNews_DataTitle = @"title";
NSString *const kModelNews_DataCommentNum = @"commentNum";
NSString *const kModelNews_DataGotoURL = @"gotoURL";


@interface ModelNews_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ModelNews_Data

@synthesize imageurl = _imageurl;
@synthesize content = _content;
@synthesize newsID = _newsID;
@synthesize title = _title;
@synthesize commentNum = _commentNum;
@synthesize gotoURL = _gotoURL;


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
            self.imageurl = [self objectOrNilForKey:kModelNews_DataImageurl fromDictionary:dict];
            self.content = [self objectOrNilForKey:kModelNews_DataContent fromDictionary:dict];
            self.newsID = [self objectOrNilForKey:kModelNews_DataNewsID fromDictionary:dict];
            self.title = [self objectOrNilForKey:kModelNews_DataTitle fromDictionary:dict];
            self.commentNum = [[self objectOrNilForKey:kModelNews_DataCommentNum fromDictionary:dict] doubleValue];
            self.gotoURL = [self objectOrNilForKey:kModelNews_DataGotoURL fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imageurl forKey:kModelNews_DataImageurl];
    [mutableDict setValue:self.content forKey:kModelNews_DataContent];
    [mutableDict setValue:self.newsID forKey:kModelNews_DataNewsID];
    [mutableDict setValue:self.title forKey:kModelNews_DataTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentNum] forKey:kModelNews_DataCommentNum];
    [mutableDict setValue:self.gotoURL forKey:kModelNews_DataGotoURL];

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

    self.imageurl = [aDecoder decodeObjectForKey:kModelNews_DataImageurl];
    self.content = [aDecoder decodeObjectForKey:kModelNews_DataContent];
    self.newsID = [aDecoder decodeObjectForKey:kModelNews_DataNewsID];
    self.title = [aDecoder decodeObjectForKey:kModelNews_DataTitle];
    self.commentNum = [aDecoder decodeDoubleForKey:kModelNews_DataCommentNum];
    self.gotoURL = [aDecoder decodeObjectForKey:kModelNews_DataGotoURL];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imageurl forKey:kModelNews_DataImageurl];
    [aCoder encodeObject:_content forKey:kModelNews_DataContent];
    [aCoder encodeObject:_newsID forKey:kModelNews_DataNewsID];
    [aCoder encodeObject:_title forKey:kModelNews_DataTitle];
    [aCoder encodeDouble:_commentNum forKey:kModelNews_DataCommentNum];
    [aCoder encodeObject:_gotoURL forKey:kModelNews_DataGotoURL];
}

- (id)copyWithZone:(NSZone *)zone
{
    ModelNews_Data *copy = [[ModelNews_Data alloc] init];
    
    if (copy) {

        copy.imageurl = [self.imageurl copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.newsID = [self.newsID copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.commentNum = self.commentNum;
        copy.gotoURL = [self.gotoURL copyWithZone:zone];
    }
    
    return copy;
}


@end
