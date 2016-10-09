//
//  UIViewController+HUD.h
//  LTProject
//
//  Created by Jonny on 2016/9/28.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 点击主屏幕回调
typedef void(^tapViewWithBlock)();

@interface UIViewController (HUD)

/// 显示状态 点击屏幕时回调 Show status, Click When screen call block
- (void)showStatus:(NSString *)status tapViewWithBlock:(tapViewWithBlock)block;

/// 消失 Hide tips
- (void)hide;

@end
