//
//  UIView+Layer.m
//  ActionView
//
//  Created by Jonny on 16/7/20.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

// 设置layer圆角
- (void)lt_setLayerCR:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
}

// 设置layer边框宽度颜色
- (void)lt_setLayerCRC:(UIColor *)color {
    
    self.layer.borderColor = color.CGColor;
}

// 设置边框
- (void)lt_setLayerBW:(CGFloat )borderWidth {
    
    self.layer.borderWidth = borderWidth;
}


@end
