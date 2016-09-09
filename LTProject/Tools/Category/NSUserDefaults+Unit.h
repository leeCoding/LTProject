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
+(void)lt_synchronize;

+ (void)lt_setBool:(BOOL)values key:(NSString *)key;

+ (BOOL)lt_boolForKey:(NSString *)key;

+ (void)lt_setFloat:(float)values key:(NSString *)key;

+ (float)lt_floatForKey:(NSString *)key;

+ (void)lt_double:(double)values key:(NSString *)key;

+ (double)lt_doubleForKey:(NSString *)key;

+ (void)lt_setObject:(id)values key:(NSString *)key;

+ (id)lt_objectForKey:(NSString *)key;

+ (void)lt_setURL:(NSURL *)url key:(NSString *)key;

+ (NSURL *)lt_URLForKey:(NSString *)key;

+ (NSString *)stringForKey:(NSString *)key;

+ (NSArray *)arrayForKey:(NSString *)key;

+ (NSDictionary *)dictionForKey:(NSString *)key;

+ (NSData *)dataForKey:(NSString *)key;

+ (void)lt_removeObjectForKey:(NSString *)key;

@end
