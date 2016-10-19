//
//  LTTouchID.m
//  LTProject
//
//  Created by Jonny on 16/9/12.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

/*
typedef NS_ENUM(NSInteger, LAError)
{
    //用户验证没有通过，比如提供了错误的手指的指纹
    LAErrorAuthenticationFailed = kLAErrorAuthenticationFailed,
    
    // 用户取消了Touch ID验证
    LAErrorUserCancel           = kLAErrorUserCancel,
    
    //用户不想进行Touch ID验证，想进行输入密码操作
    LAErrorUserFallback         = kLAErrorUserFallback,
    
    // 系统终止了验证
    LAErrorSystemCancel         = kLAErrorSystemCancel,
    
    // 用户没有在设备Settings中设定密码
    LAErrorPasscodeNotSet       = kLAErrorPasscodeNotSet,
    
    // 设备不支持Touch ID
    LAErrorTouchIDNotAvailable  = kLAErrorTouchIDNotAvailable,
    
    // 设备没有进行Touch ID 指纹注册
    LAErrorTouchIDNotEnrolled   = kLAErrorTouchIDNotEnrolled,
} NS_ENUM_AVAILABLE(10_10, 8_0);
*/

@implementation LTTouchID

+ (LTTouchID *)shareTouchID {
    static LTTouchID *touchID = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        touchID = [[self alloc]init];
    });
    return touchID;
}

- (void)lt_startShowTouchID:(NSString *)title success:(void(^)(BOOL isSuccess))isSuccess error:(void (^)(NSString *status))statuError {
    
    LAContext *lacontext = [[LAContext alloc]init];
    
    NSError *error;
    
    if ([lacontext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error: &error]) {
        
        [lacontext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:title reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                
                isSuccess(success);
            } else {
               
                switch (error.code) {
                    case kLAErrorUserCancel:
                        NSLog(@"用户取消了Touch ID验证");
                        statuError(@"用户取消了Touch ID验证");
                        break;
                    case kLAErrorAuthenticationFailed:
                        NSLog(@"用户验证没有通过，比如提供了错误的手指的指纹");
                        statuError(@"用户验证没有通过，比如提供了错误的手指的指纹");
                        break;
                    case kLAErrorUserFallback:
                        NSLog(@"用户不想进行Touch ID验证，想进行输入密码操作");
                        statuError(@"用户不想进行Touch ID验证，想进行输入密码操作");
                        break;
                    case kLAErrorSystemCancel:
                        NSLog(@"系统终止了验证");
                        statuError(@"系统终止了验证");
                        break;
                    case kLAErrorAppCancel:
                        NSLog(@"系统终止了验证");
                        statuError(@"系统终止了验证");
                        break;
                    case kLAErrorPasscodeNotSet:
                        NSLog(@"用户没有在设备Settings中设定密码");
                        statuError(@"用户没有在设备Settings中设定密码");
                        break;
                    case kLAErrorTouchIDNotAvailable:
                        NSLog(@"设备不支持Touch ID");
                        statuError(@"设备不支持Touch ID");
                        break;
                        
                    case kLAErrorTouchIDNotEnrolled:
                        NSLog(@"设备没有进行Touch ID 指纹注册");
                        statuError(@"设备没有进行Touch ID 指纹注册");
                        break;
                        
                    default:
                        break;
                }
                
            }
            
        }];
    };
}
@end
