//
//  UIView+Animation.m
//  LTProject
//
//  Created by Jonny on 16/7/26.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)


/*!
 *  脉冲动画
 *
 *  @param duration 传入次数
 *
 *  @return
 */
- (void)pulseViewWithDuration:(CGFloat)duration {
    
    [UIView animateWithDuration:duration / 6 animations:^{
        [self setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    } completion:^(BOOL finished) {
        if(finished)
        {
            [UIView animateWithDuration:duration / 6 animations:^{
                [self setTransform:CGAffineTransformMakeScale(0.96, 0.96)];
            } completion:^(BOOL finished) {
                if(finished)
                {
                    [UIView animateWithDuration:duration / 6 animations:^{
                        [self setTransform:CGAffineTransformMakeScale(1.03, 1.03)];
                    } completion:^(BOOL finished) {
                        if(finished)
                        {
                            [UIView animateWithDuration:duration / 6 animations:^{
                                [self setTransform:CGAffineTransformMakeScale(0.985, 0.985)];
                            } completion:^(BOOL finished) {
                                if(finished)
                                {
                                    [UIView animateWithDuration:duration / 6 animations:^{
                                        [self setTransform:CGAffineTransformMakeScale(1.007, 1.007)];
                                    } completion:^(BOOL finished) {
                                        if(finished)
                                        {
                                            [UIView animateWithDuration:duration / 6 animations:^{
                                                [self setTransform:CGAffineTransformMakeScale(1, 1)];
                                            } completion:nil];
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];
}

/* 2.摇摆动画 */
- (void)lt_shakeView {
    
    // 创建关键帧动画类
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    // 设置每个关键帧的值对象的数组
    shake.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)],
                     [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    // 设置是否自动翻转
    shake.autoreverses = YES;
    // 设置重复次数
    shake.repeatCount = 3.0f;
    // 设置间隔时间
    shake.duration = 0.07f;
    // 添加动画
    [self.layer addAnimation:shake
                      forKey:@"shake"];
}

@end
