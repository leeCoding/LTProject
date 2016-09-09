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

+ (void)lt_setBool:(BOOL)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setBool:values forKey:key];
}

+ (BOOL)lt_boolForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

+ (void)lt_setFloat:(float)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setFloat:values forKey:key];
}

+ (float)lt_floatForKey:(NSString *)key {
    return  [[NSUserDefaults standardUserDefaults] floatForKey:key];
}

+ (void)lt_double:(double)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setDouble:values forKey:key];
}

+ (double)lt_doubleForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] doubleForKey:key];
}

+ (void)lt_setObject:(id)values key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:values forKey:key];
}

+ (id)lt_objectForKey:(NSString *)key {
    return  [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)lt_setURL:(NSURL *)url key:(NSString *)key {
    [[NSUserDefaults standardUserDefaults]  setURL:url forKey:key];
}

+ (NSURL *)lt_URLForKey:(NSString *)key {
    return  [[NSUserDefaults standardUserDefaults] URLForKey:key];
}

/* 获取string */
+ (NSString *)stringForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

+ (NSArray *)arrayForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:key];
}

+ (NSDictionary *)dictionForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:key];
}

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
