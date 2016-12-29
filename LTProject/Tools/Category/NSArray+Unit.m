//
//  NSArray+Unit.m
//  LTProject
//
//  Created by Jonny on 16/9/20.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "NSArray+Unit.h"

@implementation NSArray (Unit)

/**
 *  获取数组总数
 *
 *  @return 总数
 */
- (NSInteger)lt_getCount {
    return self.count;
}

/**
 *  根据索引取值
 *
 *  @param index 索引
 *
 *  @return 对象
 */
- (id)lt_getObjWithIdex:(NSInteger)index {
    
    if (index >=[self lt_getCount]) {
        NSAssert(!(index >=[self lt_getCount]), @" ❗️ 数组取值越界！");
        return @"";

    } else {
      return [self objectAtIndex:index];
    }
}

/**
 *  将数组按照特定字符串分割
 *
 *  @param separator 标示
 */
- (NSString *)lt_separatorArrayWithString:(NSString *)separator {
    
    if (separator) {
        if ([self lt_getCount] > 0) {
            return [self componentsJoinedByString:separator];
        }
        NSAssert(([self lt_getCount] > 0), @" ❗️ 数组为空！");
        return @"";
    }else {
        NSAssert(separator, @" ❗️ 标示为空！");
        return @"";
    }
}


@end
