//
//  UIGestureRecognizer+Action.m
//  Runtime
//
//  Created by Jonny on 2016/10/8.
//  Copyright © 2016年 Jonny. All rights reserved.
//

#import "UIGestureRecognizer+Action.h"
#import <objc/message.h>

static const int block_key;

@implementation UIGestureRecognizer (Action)

+ (instancetype)lt_gestureRecognizerWithBlock:(lt_GestureRecognizer)block {
    
    return [[self alloc]initGestureRecognizerWithBlock:block];
}

- (instancetype)initGestureRecognizerWithBlock:(lt_GestureRecognizer)block {
    
    self = [self init];
    [self addAction:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}

// 动态添加属性
- (void)addAction:(lt_GestureRecognizer)block {
    
    if (block) {
        
        objc_setAssociatedObject(self, &block_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

// 获取block 然后回调
- (void)invoke:(id)sender {
    
    lt_GestureRecognizer block = objc_getAssociatedObject(self, &block_key);
    if (block) {
        block(sender);
    }
}

@end
