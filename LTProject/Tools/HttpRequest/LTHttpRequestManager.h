//
//  LTHttpRequestManager.h
//  LTProject
//
//  Created by Jonny on 16/8/4.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTHttpRequestManager : NSObject

/**
 *  Post 请求
 *
 *  @param url     接口
 *  @param parame  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)lt_post:(NSString *)url parame:(NSDictionary *)parame success:(void(^)(NSDictionary *result))success failure:(void(^)(NSString *msg))failure;

/**
 *  Get请求
 *
 *  @param url     接口
 *  @param parame  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)lt_get:(NSString *)url parame:(NSDictionary *)parame success:(void(^)(NSDictionary *result))success failure:(void(^)(NSString *msg))failure;

@end
