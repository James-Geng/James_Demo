//
//  UIImageView+IDTextImageView.m
//  爱豆
//
//  Created by idol on 14-8-5.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import "UIImageView+IDTextImageView.h"

@implementation UIImageView (IDTextImageView)

-(UIImage *)imageWithLabelText:(NSString *)text
{
    //CGContextRef context = UIGraphicsGetCurrentContext();
    UIFont *font = [UIFont systemFontOfSize:11];
    UIGraphicsBeginImageContext(self.bounds.size);
    //[image drawInRect:CGRectMake(0,0,size.width,size.height)];
    //CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    //CGContextSetFillColorWithColor([UIColor redColor].CGColor);
    CGRect rect = CGRectMake(3, 3, self.bounds.size.width-6, self.bounds.size.height-6);
    [[UIColor colorWithRed:136/255.0f  green:136/255.0f  blue:136/255.0f alpha:1] set];
    [text drawInRect:CGRectIntegral(rect) withFont:font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

@end
