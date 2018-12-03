//
//  NSData+YCBase64.h
//  YCCategory
//
//  Created by 安跃超 on 2018/12/3.
//  Copyright © 2018年 安跃超. All rights reserved.
//

#import <Foundation/Foundation.h>

void *NewBase64Decode(
                      const char *inputBuffer,
                      size_t length,
                      size_t *outputLength);

char *NewBase64Encode(
                      const void *inputBuffer,
                      size_t length,
                      bool separateLines,
                      size_t *outputLength);

@interface NSData(YCBase64)
@property (nonatomic, copy, readonly)NSString *yc_md5;

@property (nonatomic, readonly) NSString* yc_md5Hash;

@property (nonatomic, readonly) NSString* yc_sha1Hash;


+ (NSData *)yc_dataFromBase64String:(NSString *)aString;
- (NSString *)yc_base64EncodedString;

// added by Hiroshi Hashiguchi
- (NSString *)yc_base64EncodedStringWithSeparateLines:(BOOL)separateLines;

- (NSString *)yc_md5Hash;
- (NSString *)yc_sha1Hash;
@end

