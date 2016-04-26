//
//  UIImage+IW.h
//  01-ItcastWeibo
//
//  Created by apple on 14-1-12.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IW)
/**
 *  自动判断ios6/7的图片(拼接后缀)
 *
 *  @param name 文件名
 *
 *  @return 一个新的图片对象
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  返回能够自由拉伸不变形的图片
 *
 *  @param name 文件名
 *
 *  @return 能够自由拉伸不变形的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

/**
 *   返回能够自由拉伸不变形的图片
 *
 *  @param name      文件名
 *  @param leftScale 左边需要保护的比例（0~1）
 */
+ (UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;

/**
 *   返回能够自由拉伸不变形的图片 ios 6 and later
 *
 *  @param name      文件名
 *  @param capInsets 上 下 左 右
 */

+ (UIImage *)resizedImage:(NSString *)name capInsets:(UIEdgeInsets) capInsets resizingMode:(UIImageResizingMode)resizingMode;
/**
 *   返回始终竖着方向的图片
 *
 */

+ (UIImage *)fixOrientation:(UIImage *)aImage;

@end
