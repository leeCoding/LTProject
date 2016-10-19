//
//  Macro.h
//  LTProject
//
//  Created by Jonny on 16/9/6.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/**
 *  宏管理
 */

/* 计算某个函数的运行时长 */
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@" Run Time: %f ", -[startTime timeIntervalSinceNow])

/* 主题颜色 */
#define _kMainColor [[UIColor alloc]initWithRed:48/255.f green:154/255.f blue:21/255.f alpha:1]

#endif /* Macro_h */
