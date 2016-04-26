//
//  NSString+common.m
//  爱豆
//
//  Created by idol_ios on 15/10/23.
//  Copyright © 2015年 idol_ios. All rights reserved.
//

#import "NSString+common.h"

@implementation NSString (common)

-(NSString *)replaceThumbCharToLargeWillReplaceString:(NSString *)string replaceString:(NSString *)replaceString
{
    NSMutableString *completeString = [NSMutableString string];
    NSArray *components = [self componentsSeparatedByString:@"/"];
    
    for (NSString *str in components) {
        
        if ([str isEqualToString:string] || [str isEqualToString:@"wap180"])
        {
            [completeString appendFormat:@"%@/",replaceString];
        }
        else
        {
            [completeString appendFormat:@"%@/",str];
        }
    }
    
    if (completeString.length>1) {
        
        [completeString deleteCharactersInRange:NSMakeRange(completeString.length-1, 1)];
    }
    
    return completeString;
}

@end
