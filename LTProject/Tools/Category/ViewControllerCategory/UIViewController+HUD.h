//
//  UIViewController+HUD.h
//  LTProject
//
//  Created by Jonny on 2016/9/28.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 点击主屏幕回调
typedef void(^tapViewWithBlock)();

@interface UIViewController (HUD)

/// 显示状态，点击屏幕时回调。显示文字
- (void)showStatus:(NSString *)status tapViewWithBlock:(tapViewWithBlock)block;

/// 显示状态，点击屏幕时回调，如果是gif，type请填gif, 默认加载jpg,png。
- (void)showStatus:(NSString *)status imageName:(NSString *)imageName type:(NSString *)type tapViewWithBlock:(tapViewWithBlock)block;

/// 隐藏提示
- (void)hide;

@end
