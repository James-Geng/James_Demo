//
//  NSString+textSize.h
//  爱豆
//
//  Created by idol on 14-8-22.
//  Copyright (c) 2014年 idol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (textSize)

//计算文本的size
-(CGSize)boundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing;
-(CGSize)labelboundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing;

//sting转AttributedString
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing;

//sting转AttributedString
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing LineBreakMode:(NSLineBreakMode )breakMode;

@end
