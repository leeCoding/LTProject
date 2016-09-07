//
//  UIViewController+Utils.m
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

/**
 *  显示无数据提示
 *
 *  @param inView 设置显示 view
 */
- (void)showNoneImageInView:(UIView *)inView {
    
    [self hideTipNoneView];
    
    UIImageView *tipView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nodata"]];
    tipView.frame = CGRectMake((self.view.frame.size.width -160)/2, (self.view.frame.size.height -160)/2, 160, 160);
    tipView.tag = 10086;
    tipView.contentMode = UIViewContentModeCenter;
    [inView addSubview:tipView];
    [inView insertSubview:tipView atIndex:99];
}

/**
 *  隐藏tipView
 */
- (void)hideTipNoneView {
   
    if ([self.view viewWithTag:10086]) {
        [self.view willRemoveSubview:[self.view viewWithTag:10086]];
    }
}

@end
