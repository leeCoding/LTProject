//
//  LTTouchID.h
//  LTProject
//
//  Created by Jonny on 16/9/12.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTTouchID : NSObject

+ (LTTouchID *)shareTouchID;

/**
 *  验证Touch ID
 *
 *  @param title      标题
 *  @param isSuccess  是否成功
 *  @param statuError 验证不通过错误状态
 */
- (void)lt_startShowTouchID:(NSString *)title success:(void(^)(BOOL isSuccess))isSuccess error:(void (^)(NSString *status))statuError;

@end
