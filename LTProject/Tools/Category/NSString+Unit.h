//
//  NSString+Unit.h
//  LTProject
//
//  Created by Jonny on 16/9/9.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Unit)


- (NSString *)appendString:(NSString *)format,... NS_FORMAT_FUNCTION(1,2);

@end
