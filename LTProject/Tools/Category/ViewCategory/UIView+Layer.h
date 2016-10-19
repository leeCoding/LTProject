//
//  UIView+Layer.h
//  ActionView
//
//  Created by Jonny on 16/7/20.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

/// 设置圆角
- (void)lt_setLayerCR:(CGFloat)cornerRadius;

/// 设置边框颜色
- (void)lt_setLayerCRC:(UIColor *)color;

/// 设置边框宽度
- (void)lt_setLayerBW:(CGFloat )borderWidth;

@end
