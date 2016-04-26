//
//  NSDate+Hour_Minute.m
//  爱豆IOS
//
//  Created by idol on 14-6-24.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import "NSDate+Hour_Minute.h"

@implementation NSDate (Hour_Minute)

-(NSInteger)getGregorianHour
{
    NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComps = [gregorianCal components: (NSHourCalendarUnit | NSMinuteCalendarUnit)
                                                  fromDate: self];
    // Then use it
    //[dateComps minute];
    [dateComps hour];
    return [dateComps hour];
}

-(NSInteger)getGregorianMinute
{
    NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComps = [gregorianCal components: (NSHourCalendarUnit | NSMinuteCalendarUnit)
                                                  fromDate: self];
    // Then use it
    [dateComps minute];
    //[dateComps hour];
    return [dateComps minute];
}

- (NSTimeInterval )zeroOfTimeInterval
{
     NSCalendar *calendar = [NSCalendar currentCalendar];
     NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:self];
     components.hour = 23;
     components.minute = 59;
     components.second = 59;

    // components.nanosecond = 0 not available in iOS
     NSTimeInterval ts = (double)(int)[[calendar dateFromComponents:components] timeIntervalSince1970];
   
    return ts;
 }

@end
