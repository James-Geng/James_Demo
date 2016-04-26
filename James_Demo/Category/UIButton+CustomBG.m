//
//  UIButton+CustomBG.m
//  爱豆IOS
//
//  Created by idol on 14-7-2.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import "UIButton+CustomBG.h"

@implementation UIButton (CustomBG)

-(void)addCustomBackGroundColor
{

    [self addTarget:self action:@selector(UP:) forControlEvents:UIControlEventTouchDragOutside];
    [self addTarget:self action:@selector(Drow:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(UP:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(UP:) forControlEvents:UIControlEventTouchCancel];
}

-(void)UP:(id) sender
{
    UIButton *button = (UIButton*) sender;
    button.alpha = 1.0f;
}

-(void)Drow:(id) sender
{
    UIButton *button = (UIButton*) sender;
    button.alpha = 0.2f;
}

@end
