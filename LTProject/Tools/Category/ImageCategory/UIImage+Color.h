//
//  UIImage+Color.h
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
*  根据颜色生成纯色图片
*
*  @param color 颜色
*
*  @return 图片
*/
+ (UIImage *)lt_imageWithColor:(UIColor *)color;

/**
 *  取图片某一像素的颜色
 *
 *  @param point  点
 *
 *  @return 颜色
 */
- (UIColor *)lt_colorAtPixel:(CGPoint)point;

/**
 *  获得灰度图
 *
 *  @return 图片
 */
- (UIImage *)lt_convertToGrayImage;

@end
