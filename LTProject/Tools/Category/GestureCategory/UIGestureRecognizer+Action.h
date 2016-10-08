//
//  UIGestureRecognizer+Action.h
//  Runtime
//
//  Created by Jonny on 2016/10/8.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^lt_GestureRecognizer)(id  gestureRecognizer);

// 手势添加分类
@interface UIGestureRecognizer (Action)

+ (instancetype)lt_gestureRecognizerWithBlock:(lt_GestureRecognizer)block;

@end
