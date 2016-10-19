//
//  UIView+Animation.h
//  LTProject
//
//  Created by Jonny on 16/7/26.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

/**
 *  脉冲动画
 *
 *  @param duration 持续时间
 */
- (void)pulseViewWithDuration:(CGFloat)duration;

/**
 *  摇摆动画
 */
- (void)lt_shakeView;

@end
