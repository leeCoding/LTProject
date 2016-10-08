//
//  NSUserDefaults+Unit.h
//  LTProject
//
//  Created by Jonny on 16/9/9.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  重写UserDefaults方法
 */
@interface NSUserDefaults (Unit)

/**
 *  同步
 */
+ (void)lt_synchronize;

/* 存Bool */
+ (void)lt_setBool:(BOOL)values key:(NSString *)key;

/* 获取Bool */
+ (BOOL)lt_boolForKey:(NSString *)key;

/* 存Float */
+ (void)lt_setFloat:(float)values key:(NSString *)key;

/* 获取Float */
+ (float)lt_floatForKey:(NSString *)key;

/* 存Double */
+ (void)lt_double:(double)values key:(NSString *)key;

/* 获取Double */
+ (double)lt_doubleForKey:(NSString *)key;

/* 存Object */
+ (void)lt_setObject:(id)values key:(NSString *)key;

/* 获取object */
+ (id)lt_objectForKey:(NSString *)key;

/* 存URL */
+ (void)lt_setURL:(NSURL *)url key:(NSString *)key;

/* 获取URL */
+ (NSURL *)lt_URLForKey:(NSString *)key;

/* 获取string */
+ (NSString *)stringForKey:(NSString *)key;

/* 获取Array */
+ (NSArray *)arrayForKey:(NSString *)key;

/* 获取Dictionary */
+ (NSDictionary *)dictionForKey:(NSString *)key;

/* 获取Data */
+ (NSData *)dataForKey:(NSString *)key;

/**
 *  清除对象
 *
 *  @param key 钥匙
 */
+ (void)lt_removeObjectForKey:(NSString *)key;

@end
