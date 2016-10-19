//
//  LTHttpRequestManager.m
//  LTProject
//
//  Created by Jonny on 16/8/4.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTHttpRequestManager.h"
#import "AFNetworking.h"
@implementation LTHttpRequestManager

/**
 *  Post 请求
 *
 *  @param url     接口
 *  @param parame  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)lt_post:(NSString *)url parame:(NSDictionary *)parame success:(void(^)(NSDictionary *result))success failure:(void(^)(NSString *msg))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:parame progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功数据 %@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error.description);
    }];
    
}

/**
 *  Get请求
 *
 *  @param url     接口
 *  @param parame  参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)lt_get:(NSString *)url parame:(NSDictionary *)parame success:(void(^)(NSDictionary *result))success failure:(void(^)(NSString *msg))failure {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:parame progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success (responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"错误 %@",error);
        failure(error.description);
 
    }];
    
}
@end
