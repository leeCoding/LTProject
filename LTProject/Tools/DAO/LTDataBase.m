//
//  LTDataBase.m
//  LTProject
//
//  Created by Jonny on 16/9/9.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTDataBase.h"

static LTDataBase *dataBase = nil;

@implementation LTDataBase

+ (LTDataBase *)shareDataBase {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataBase = [[self alloc]init];
    });
    
    return dataBase;
}

+ (void)createDataBase:(NSString *)dataBaseName {
    
    
}

@end
