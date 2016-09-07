//
//  Macro.h
//  LTProject
//
//  Created by Jonny on 16/9/6.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#ifndef Macro_h
#define Macro_h
/**
 *  宏管理
 */

/* 计算某个函数的运行时长 */
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@" Run Time: %f ", -[startTime timeIntervalSinceNow])



#endif /* Macro_h */
