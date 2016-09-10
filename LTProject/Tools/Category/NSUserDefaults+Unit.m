//
//  NSUserDefaults+Unit.m
//  LTProject
//
//  Created by Jonny on 16/9/9.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "NSUserDefaults+Unit.h"

@implementation NSUserDefaults (Unit)

/* 同步 */
+ (void)lt_synchronize {
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/* 存Bool */
+ (void)lt_setBool:(BOOL)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setBool:values forKey:key];
}

/* 获取Bool */
+ (BOOL)lt_boolForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

/* 存Float */
+ (void)lt_setFloat:(float)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setFloat:values forKey:key];
}

/* 获取Float */
+ (float)lt_floatForKey:(NSString *)key {
    return  [[NSUserDefaults standardUserDefaults] floatForKey:key];
}

/* 存Double */
+ (void)lt_double:(double)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setDouble:values forKey:key];
}

/* 获取Double */
+ (double)lt_doubleForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] doubleForKey:key];
}

/* 存Object */
+ (void)lt_setObject:(id)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:values forKey:key];
}

/* 获取object */
+ (id)lt_objectForKey:(NSString *)key {
    return  [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/* 存URL */
+ (void)lt_setURL:(NSURL *)url key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults]  setURL:url forKey:key];
}

/* 获取URL */
+ (NSURL *)lt_URLForKey:(NSString *)key {
    return  [[NSUserDefaults standardUserDefaults] URLForKey:key];
}

/* 获取string */
+ (NSString *)stringForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

/* 获取Array */
+ (NSArray *)arrayForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:key];
}

/* 获取Dictionary */
+ (NSDictionary *)dictionForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:key];
}

/* 获取Data */
+ (NSData *)dataForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] dataForKey:key];
}
/**
 *  清除对象
 *
 *  @param key 钥匙
 */
+  (void)lt_removeObjectForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}
@end
