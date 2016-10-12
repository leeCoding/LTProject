//
//  AppDelegate+_DTouch.m
//  LTProject
//
//  Created by Jonny on 2016/10/12.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "AppDelegate+_DTouch.h"

@implementation AppDelegate (_DTouch)


- (void)create3DTouch {
    
    // 图标
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc]initWithType:@"1" localizedTitle:@"扫一扫" localizedSubtitle:@"赶快扫一扫" icon:icon userInfo:@{}];
    [[UIApplication sharedApplication] setShortcutItems:@[item]];
    
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem  completionHandler:(void (^)(BOOL))completionHandler {
    
    if (shortcutItem.type.integerValue) {
        
        [[NSNotificationCenter  defaultCenter] postNotificationName:@"goTo3DTouch" object:self userInfo:@{@"type":@"1"}];
    }
}

@end
