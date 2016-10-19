//
//  LTStarView.m
//  LTProject
//
//  Created by Jonny on 2016/10/9.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTStarView.h"

@interface LTStarView ()

@property (nonatomic,strong)NSMutableArray *btns;
@property (nonatomic,copy)clickBtn clickBtnBlock;

@end

@implementation LTStarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)initStarViewFrame:(CGRect)rect clickBtn:(clickBtn)Block {
    
    return [[self alloc]initWithFrame:rect clickBtn:Block];
}

- (instancetype)initWithFrame:(CGRect)frame clickBtn:(clickBtn)Block {
    
    if (self) {
        
        self = [super initWithFrame:frame];
        self.btns = [[NSMutableArray alloc]init];
        self.clickBtnBlock = Block;
        
        [self initUI];
    }
    
    return self;
}

#pragma mark - 初始化UI
- (void)initUI {
    
    for (int i = 0; i < 5; i++) {
        
        // x
        float btn_w = 30 ;
        float btn_x = 60 ;
        
        // 间隔
        float interval = (self.frame.size.width - ((btn_w * 5) + (btn_x * 2)))/4;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btn_x + (btn_w + interval) * i , 0, btn_w, btn_w);
        [btn setBackgroundImage:[UIImage imageNamed:@"21"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"12"] forState:UIControlStateSelected];
        btn.tag = i;
        btn.selected = YES;
        [btn addTarget:self action:@selector(clickStar:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        [self.btns addObject:btn];
    }
}

// 点击星星
- (void)clickStar:(UIButton *)btn {
    
    [self changeSelectorStatus:btn.tag];
    self.clickBtnBlock([NSString stringWithFormat:@"%ld",btn.tag+1]);
}

// 改变btn背景
- (void)changeSelectorStatus:(NSInteger)tag {
 
        for (int i = 0; i < (int)self.btns.count; i ++) {
            if (tag >= i) {
                UIButton *tempBtn = self.btns[i];
                tempBtn.selected = YES;
                [self.btns removeObjectAtIndex:i];
                [self.btns insertObject:tempBtn atIndex:i];
            } else {
                UIButton *tempBtn = self.btns[i];
                tempBtn.selected = NO;
                [self.btns removeObjectAtIndex:i];
                [self.btns insertObject:tempBtn atIndex:i];
            }
        }
}

@end
