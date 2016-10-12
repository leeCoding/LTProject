//
//  LTStarView.h
//  LTProject
//
//  Created by Jonny on 2016/10/9.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBtn)(NSString *score);

@interface LTStarView : UIView

/**
  初始化
 */
- (instancetype)initWithFrame:(CGRect)frame clickBtn:(clickBtn)Block;

+ (instancetype)initStarViewFrame:(CGRect)rect clickBtn:(clickBtn)Block;

@end
