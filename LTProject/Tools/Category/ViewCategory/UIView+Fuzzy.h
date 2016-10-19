//
//  UIView+Fuzzy.h
//  LTProject
//
//  Created by Jonny on 16/8/5.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Fuzzy)

// 1.
- (void)lt_addBlurEffectImageView:(UIImageView *)imageView baseView:(UIView *)baseView;

// 2.
- (void)lt_addToolbarImageView:(UIImageView *)imageView baseView:(UIView *)baseView;

// 3.
- (void)lt_addCoreImage:(UIImageView *)imageView;

// 4.
- (UIImage *)lt_boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
