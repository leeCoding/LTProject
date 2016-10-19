//
//  UIViewController+HUD.m
//  LTProject
//
//  Created by Jonny on 2016/9/28.
//  Copyright © 2016年 ZUBMO. All rights reserved.
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
        subhud.font = [UIFont systemFontOfSize:10];
        subhud.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:subhud];
        
        objc_setAssociatedObject(self, &kHud, subhud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return subhud;
}

#pragma mark - 显示状态 Show status
- (void)showStatus:(NSString *)status tapViewWithBlock:(tapViewWithBlock)block {
    
    [self addStatusAndImage:status image:nil tapViewWithBlock:block];
}

#pragma mark - 显示状态以及显示没有数据时的图片
- (void)showStatus:(NSString *)status imageView:(UIImage *)image tapViewWithBlock:(tapViewWithBlock)block {
    
    [self addStatusAndImage:status image:image tapViewWithBlock:block];
}

/* 添加点击手势 */
- (void)addTapGesture {
    
    // 添加全屏手势
    self.tapGestureBlock = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBlock)];
    [self.view addGestureRecognizer:self.tapGestureBlock];
}

/* 添加文字及图片 */
- (void)addStatusAndImage:(NSString *)status image:(UIImage *)image tapViewWithBlock:(tapViewWithBlock)block{
    
    if (status) {
        
     self.labelHud.text = status;
    }
    if (image) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 50) / 2, self.view.center.y - 50, 50, 50)];
        imageView.image = image;
        imageView.tag = 10086;
        [self.view addSubview:imageView];
    }
    if (block) {
        
        objc_setAssociatedObject(self, &kTapG, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    // 添加手势
    [self addTapGesture];
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
        UIImageView *imageView = [self.view viewWithTag:10086];
        if (imageView) {
            [imageView removeFromSuperview];
        }

    }
    
    [self.view removeGestureRecognizer: self.tapGestureBlock];
}
@end
