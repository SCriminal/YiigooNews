//
//  ModelNews_Data.h
//
//  Created by   on 16/6/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelNews_Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imageurl;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *newsID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double commentNum;
@property (nonatomic, strong) NSString *gotoURL;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
