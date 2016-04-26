//
//  NSData+Base64.h
//  爱豆
//
//  Created by idol on 14/12/10.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)

+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

- (NSString *)base64EncodedString;

@end
