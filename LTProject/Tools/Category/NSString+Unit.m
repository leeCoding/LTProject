//
//  NSString+Unit.m
//  LTProject
//
//  Created by Jonny on 16/9/9.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "NSString+Unit.h"

@implementation NSString (Unit)

/**
 *  多参数返回
 *
 *  @param format 参数
 *
 *  @return string
 */
- (NSString *)appendString:(NSString *)format, ... {
    
    NSMutableString *string = [[NSMutableString alloc]init];
    va_list list;
    if (format) {
        va_start(list, format);
        string = [[[NSString alloc]initWithFormat:format arguments:list] copy];
        va_end(list);
    }
    return string;
}

@end
