//
//  LTDateManager.m
//  LTProject
//
//  Created by Jonny on 16/9/13.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTDateManager.h"

@implementation LTDateManager

/**
 *  年 月 日 时 分 秒
 *
 *  @return 年 月 日 时 分 秒
 */
+ (NSString *)lt_getNowDate {
    
    return [self lt_getDateWithFormatter:@"yyyy-MM-dd HH:mm:ss"];
}

/**
 *  获取年
 *
 *  @return 今年
 */
+ (NSString *)lt_getNowYear {
    
    return [self lt_getDateWithFormatter:@"yyyy"];
}

/**
 *  获取年月
 *
 *  @return 今年、月
 */
+ (NSString *)lt_getNowYearAndMonth {
    
    return [self lt_getDateWithFormatter:@"yyyy-MM"];
}

/**
 *  获取年月日
 *
 *  @return 今年、月、日
 */
+ (NSString *)lt_getNowYearAndMonthDay {
  
    return [self lt_getDateWithFormatter:@"yyyy-MM-dd"];
}

/**
 *  获取当前几点
 *
 *  @return 今天几点
 */
+ (NSString *)lt_getNowHourAndMinuteSecond {
    
    return [self lt_getDateWithFormatter:@"HH:mm:ss"];
}

/**
 *  根据时间格式返回对应的时间
 *
 *  @param dateFormat 格式
 *
 *  @return 时间
 */
+ (NSString *)lt_getDateWithFormatter:(NSString *)dateFormat {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:[NSDate date]];
}

/**
 *  返回时间戳
 */
+ (NSString *)lt_getTimestamp {
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    /** 精确到毫秒
     *  NSTimeInterval a =[dat timeIntervalSince1970]*1000;
     */
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f",timeInterval];
}

/**
 *  时间戳转换标准时间
 *
 *  @param timestamp 时间戳
 *
 *  @return 标准时间
 */
+ (NSString *)lt_timestampWithTimeStandard:(NSString *)timestamp {
    
    double lastactivityInterval = [timestamp doubleValue];

    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lastactivityInterval];
    return  [formatter stringFromDate:date];
}

/**
 *  标准时间转时间戳
 *
 *  @param timeStandard 标准时间
 *
 *  @return 时间戳
 */
+ (NSString *)lt_timeStandardWithTimestamp:(NSString *)timeStandard {
    
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM:ss"];
    
    // 格式化器把标准时间转成 date
    NSDate *date = [formatter dateFromString:timeStandard];
    NSLog(@" %@",timeStandard);
    return [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]];
    
}

@end
