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
static const void *kTapG = @"k_TapG";
static const void *kProTapG = @"k_Pro_TapG";

@interface UIViewController ()

@property (nonatomic,strong)UILabel *labelHud;
@property (nonatomic,strong)UITapGestureRecognizer *tapGestureBlock;

@end

@implementation UIViewController (HUD)


- (void)setTapGestureBlock:(UITapGestureRecognizer *)tapGestureBlock {
    
    objc_setAssociatedObject(self, &kProTapG, tapGestureBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)tapGestureBlock {
    
    return  objc_getAssociatedObject(self, &kProTapG);
}

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

#pragma mark - 显示状态 Show status
- (void)showStatus:(NSString *)status tapViewWithBlock:(tapViewWithBlock)block {
    
    if (status == nil) {
        return;
    }
    
    self.labelHud.text = status;
    
    if (block) {
        
        objc_setAssociatedObject(self, &kTapG, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    // 添加全屏手势
    self.tapGestureBlock = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBlock)];
    [self.view addGestureRecognizer:self.tapGestureBlock];
}

#pragma mark - 回调  Click return
- (void)tapBlock {
    
    tapViewWithBlock block = objc_getAssociatedObject(self, &kTapG);
    if (block) {
        block();
    }
}
#pragma mark - 消失 Tips hide
- (void)hide {
    
    if (self.labelHud) {
        
        __weak typeof(self) __weakSelf = self;
        [UIView animateWithDuration:1 animations:^{
            __weakSelf.labelHud.alpha = 0;
        } completion:^(BOOL finished) {
            [__weakSelf.labelHud removeFromSuperview];
        }];
    }
    
    [self.view removeGestureRecognizer: self.tapGestureBlock];
}
@end
