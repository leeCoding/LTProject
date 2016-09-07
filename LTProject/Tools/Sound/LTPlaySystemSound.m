//
//  LTPlaySystemSound.m
//  LTProject
//
//  Created by Jonny on 16/8/18.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTPlaySystemSound.h"

@implementation LTPlaySystemSound

/* 从ID中播放系统声音 */
+ (void)lt_playSystemSound:(AudioID)audioID {
    
    AudioServicesPlaySystemSound(audioID);
}

/* 播放系统震动*/
+ (void)lt_playSystemSoundVibrate {
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
