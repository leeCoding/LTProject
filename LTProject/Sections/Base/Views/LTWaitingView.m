//
//  LTWaitingView.m
//  LTProject
//
//  Created by Jonny on 16/8/10.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTWaitingView.h"

#define LTWaitingViewBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]
#define LTWaitingViewItemMargin 10

@implementation LTWaitingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LTWaitingViewBackgroundColor;
        self.clipsToBounds = YES;
        self.mode = LTWaitingViewModeLoopDiagram;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
    if (progress >= 1) {
        [self removeFromSuperview];
    }
}

- (void)setFrame:(CGRect)frame
{
    //设置背景图为圆
    frame.size.width = 50;
    frame.size.height = 50;
    self.layer.cornerRadius = 25;
    [super setFrame:frame];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor whiteColor] set];
    
    switch (self.mode) {
        case LTWaitingViewModePieDiagram:
        {
            CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - LTWaitingViewItemMargin;
            
            CGFloat w = radius * 2 + LTWaitingViewItemMargin;
            CGFloat h = w;
            CGFloat x = (rect.size.width - w) * 0.5;
            CGFloat y = (rect.size.height - h) * 0.5;
            CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
            CGContextFillPath(ctx);
            
            [LTWaitingViewBackgroundColor set];
            CGContextMoveToPoint(ctx, xCenter, yCenter);
            CGContextAddLineToPoint(ctx, xCenter, 0);
            CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 1);
            CGContextClosePath(ctx);
            
            CGContextFillPath(ctx);
        }
            break;
            
        default:
        {
            CGContextSetLineWidth(ctx, 4);
            CGContextSetLineCap(ctx, kCGLineCapRound);
            CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.05; // 初始值0.05
            CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - LTWaitingViewItemMargin;
            CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
            CGContextStrokePath(ctx);
        }
            break;
    }
}
@end
