//
//  UIImage+UIImageScale.h
//  爱豆IOS
//
//  Created by idol on 14-6-17.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageScale)

-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;
+(UIImage*)imageWithColor:(UIColor *)color;
+(UIImage*)imageWithColor:(UIColor *)color size:(CGSize) size;

@end
