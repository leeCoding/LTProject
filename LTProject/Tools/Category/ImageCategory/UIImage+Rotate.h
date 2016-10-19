//
//  UIImage+Rotate.h
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Rotate)

/** 纠正图片的方向 */
- (UIImage *)lt_fixOrientation;

/** 按给定的方向旋转图片 */
- (UIImage*)lt_rotate:(UIImageOrientation)orient;

/** 垂直翻转 */
- (UIImage *)lt_flipVertical;

/** 水平翻转 */
- (UIImage *)lt_flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)lt_imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)lt_imageRotatedByRadians:(CGFloat)radians;

@end
