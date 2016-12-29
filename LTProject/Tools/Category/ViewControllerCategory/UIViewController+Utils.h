//
//  UIViewController+Utils.h
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

#pragma mark - 无数据提示
/* 显示提示无数据视图 */
- (void)lt_showNoneImageInView:(UIView *)inView;

/* 隐藏提示视图 */
- (void)lt_hideTipNoneView;

#pragma mark - 显示HUD
/* 显示 */
- (void)lt_showHUD;

/* 消失 */
- (void)lt_dismissHUD;

/* 显示文字提示 */
- (void)lt_showHUDWithContent:(NSString *)text;

/* 获取成功状态 */
- (void)lt_showHUDSuccess:(NSString *)text;

/* 显示错误状态 */
- (void)lt_showHUDError:(NSString *)text;

@end
