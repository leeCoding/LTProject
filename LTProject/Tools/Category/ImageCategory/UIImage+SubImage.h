//
//  UIImage+SubImage.h
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SubImage)

/** 截取当前image对象rect区域内的图像 */
- (UIImage *)lt_subImageWithRect:(CGRect)rect;

/** 压缩图片至指定尺寸 */
- (UIImage *)lt_rescaleImageToSize:(CGSize)size;

/** 压缩图片至指定像素 */
- (UIImage *)lt_rescaleImageToPX:(CGFloat )toPX;

/** 在指定的size里面生成一个平铺的图片 */
- (UIImage *)lt_getTiledImageWithSize:(CGSize)size;

/** UIView转化为UIImage */
+ (UIImage *)lt_imageFromView:(UIView *)view;

/** 将两个图片生成一张图片 */
+ (UIImage*)lt_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;

@end
