//
//  MLMD5Trans.m
//  PortOfMilan
//
//  Created by DeanW on 15/2/11.
//
//

#import "MLMD5Trans.h"
#import "GTMBase642.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MLMD5Trans

+ (NSString *)md5HexDigest:(NSString *)password
{
    NSData *testData = [password dataUsingEncoding:NSUTF16StringEncoding];
    if(testData.length > 2){
        testData = [testData subdataWithRange:NSMakeRange(2, testData.length-2)];
    }
    const char *testByte = (char *)[testData bytes];
    
//    for(int i=0; i<[testData length]; i++)
//        printf("testByte = %d\n", testByte[i]);
    unsigned char result[16];
    CC_MD5(testByte, [testData length], result);
    NSMutableString *hash = [NSMutableString string];
    for (int i=0; i<16; i++)
    {
//        NSLog(@"%02X",result[i]);
        [hash appendFormat:@"%02X", result[i]];
    }
    NSString *mdfiveString = [hash lowercaseString];
//    NSLog(@"%@", mdfiveString);
    return mdfiveString;
}

+ (NSString *)getFinalMd5P:(NSString *)pass
{
    NSData *testData = [pass dataUsingEncoding:NSUTF16StringEncoding];
    if(testData.length>2){
        testData= [testData subdataWithRange:NSMakeRange(2, testData.length-2)];
    }
    
    const char *testByte = (char *)[testData bytes];
    
//    for(int i=0; i<[testData length]; i++)
//        printf("testByte = %d\n", testByte[i]);
    unsigned char result[16];
    CC_MD5(testByte, [testData length], result);
    NSString *hehe = [GTMBase642 stringByEncodingBytes:result length:16];
//    NSLog(@"11111%@", hehe);
    
    hehe = [self md5HexDigest:hehe];
//    NSLog(@"11111%@", hehe);
    return hehe;
}

@end
