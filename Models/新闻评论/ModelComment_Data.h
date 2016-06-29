//
//  ModelComment_Data.h
//
//  Created by   on 16/6/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelComment_Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, strong) NSString *supportFlag;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *contentID;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *unsupportNum;
@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, strong) NSString *imageHeadURL;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *supportNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
