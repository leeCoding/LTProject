//
//  LTWaitingView.h
//  LTProject
//
//  Created by Jonny on 16/8/10.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    LTWaitingViewModeLoopDiagram, // 环形
    LTWaitingViewModePieDiagram // 饼型
} LTWaitingViewMode;
@interface LTWaitingView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) int mode;

@end
