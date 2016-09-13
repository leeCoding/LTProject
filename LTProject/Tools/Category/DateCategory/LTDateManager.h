//
//  LTDateManager.h
//  LTProject
//
//  Created by Jonny on 16/9/13.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *   该类用于处理各种时间
 */
@interface LTDateManager : NSObject

/**
 *  获取现在时间 年 月 日 时 分 秒
 *
 *  @return 现在时间 北京时间
 */
+ (NSString *)lt_getNowDate;

/**
 *  获取年
 *
 *  @return 今年
 */
+ (NSString *)lt_getNowYear;

/**
 *  获取年月
 *
 *  @return 今年、月
 */
+ (NSString *)lt_getNowYearAndMonth;

/**
 *  获取年月日
 *
 *  @return 今年、月、日
 */
+ (NSString *)lt_getNowYearAndMonthDay;

/**
 *  获取当前几点
 *
 *  @return 今天几点
 */
+ (NSString *)lt_getNowHourAndMinuteSecond;

/**
 *  根据时间格式返回对应的时间
 *
 *  @param dateFormat 格式
 *
 *  @return 时间
 */
+ (NSString *)lt_getDateWithFormatter:(NSString *)dateFormat;

/**
 *  返回时间戳
 */
+ (NSString *)lt_getTimestamp;

/**
 *  时间戳转换标准时间
 *
 *  @param timestamp 时间戳
 *
 *  @return 标准时间
 */
+ (NSString *)lt_timestampWithTimeStandard:(NSString *)timestamp;

/**
 *  标准时间转时间戳 使用时要注意传入的时间格式要和方法中的时间格式一致 否则会转换失败
 *
 *  @param timeStandard 标准时间
 *
 *  @return 时间戳
 */
+ (NSString *)lt_timeStandardWithTimestamp:(NSString *)timeStandard;



@end
