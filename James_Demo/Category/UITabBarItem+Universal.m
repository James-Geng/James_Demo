//
//  UITabBarItem+Universal.m
//  爱豆IOS
//
//  Created by idol on 14-7-2.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import "UITabBarItem+Universal.h"

@implementation UITabBarItem (Universal)
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UITabBarItem *tabBarItem = nil;
    if (IS_IOS_7_AND_LATER)
    { tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]]; }
    else { tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:nil tag:0];
        [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:image];
    }
    
    return tabBarItem;
}
@end
