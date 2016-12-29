//
//  NSArray+Unit.h
//  LTProject
//
//  Created by Jonny on 16/9/20.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Unit)

/**
 *  获取数组总数
 *
 *  @return 总数
 */
- (NSInteger)lt_getCount;

/**
 *  根据索引取值
 *
 *  @param index 索引
 *
 *  @return 对象
 */
- (id)lt_getObjWithIdex:(NSInteger)index;

/**
 *  将数组按照特定字符串分割
 *
 *  @param separator 标示
 */
- (NSString *)lt_separatorArrayWithString:(NSString *)separator;
@end
