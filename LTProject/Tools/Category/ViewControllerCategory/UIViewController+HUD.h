//
//  UIViewController+HUD.h
//  LTProject
//
//  Created by Jonny on 2016/9/28.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapViewWithBlock)();

@interface UIViewController (HUD)

/// 显示状态
- (void)showStatus:(NSString *)status tapViewWithBlock:(tapViewWithBlock)block;

/// 消失
- (void)hide;


@end
