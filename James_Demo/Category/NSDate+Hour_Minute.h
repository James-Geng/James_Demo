//
//  NSDate+Hour_Minute.h
//  爱豆IOS
//
//  Created by idol on 14-6-24.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Hour_Minute)

- (NSInteger) getGregorianHour;
- (NSInteger) getGregorianMinute;

- (NSTimeInterval )zeroOfTimeInterval; // 获取当天0点时的时间戳

@end
