//
//  UIViewController+HUD.m
//  LTProject
//
//  Created by Jonny on 2016/9/28.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <objc/message.h>

static const void *kHud = @"k_labelHud";

@interface UIViewController ()

@property (nonatomic,strong)UILabel *labelHud;

@end

@implementation UIViewController (HUD)

- (UILabel *)labelHud {
    
    UILabel *subhud = objc_getAssociatedObject(self, &kHud);
    if (subhud == nil) {
        subhud = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.center.y, self.view.frame.size.width - 40, 30)];
        subhud.textColor = [UIColor grayColor];
        subhud.font = [UIFont systemFontOfSize:14];
        subhud.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:subhud];
        
        objc_setAssociatedObject(self, &kHud, subhud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return subhud;
}

#pragma mark - 显示状态
- (void)showStatus:(NSString *)status {
    
    if (status == nil) {
        return;
    }
    self.labelHud.text = status;
}

#pragma mark - 消失
- (void)hide {
    if (self.labelHud) {
        
        __weak typeof(self) __weakSelf = self;
        [UIView animateWithDuration:1 animations:^{
            __weakSelf.labelHud.alpha = 0;
        } completion:^(BOOL finished) {
            [__weakSelf.labelHud removeFromSuperview];
        }];
    }
}
@end
