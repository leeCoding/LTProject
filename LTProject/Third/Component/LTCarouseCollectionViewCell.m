//
//  LTCarouseCollectionViewCell.m
//  LTProject
//
//  Created by Jonny on 2016/10/13.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTCarouseCollectionViewCell.h"

@interface LTCarouseCollectionViewCell()

@property (nonatomic ,strong)UIView *labelBackgroundView;

@end

@implementation LTCarouseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        [self initUI];
    }
    
    return self;
}

#pragma mark - 初始化UI
- (void)initUI {
    
    _bannerImageView = [[UIImageView alloc]init];
    _bannerImageView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bannerImageView];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    
    _labelBackgroundView = [[UIView alloc]init];
    _labelBackgroundView.backgroundColor = [UIColor grayColor];
    _labelBackgroundView.alpha = .7;
    [_labelBackgroundView addSubview:_titleLabel];
    [self addSubview:_labelBackgroundView];
}

- (void)setTitleLabel:(UILabel *)titleLabel {
    _titleLabel = titleLabel;
}

- (void)setBannerImageView:(UIImageView *)bannerImageView {
    _bannerImageView = bannerImageView;
}

- (void)setIsShowTitle:(BOOL)isShowTitle {
    _isShowTitle = isShowTitle;
    _titleLabel.hidden = isShowTitle;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _titleLabel.textAlignment = textAlignment;
}

- (void)setTitleFontSize:(CGFloat)titleFontSize {
    _titleFontSize = titleFontSize;
    _titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
}

- (void)setTextTitle:(NSString *)textTitle {
    _textTitle = textTitle;
    _titleLabel.text = [NSString stringWithFormat:@"    %@",_textTitle];
}

- (void)setTitleFontColor:(UIColor *)titleFontColor {
    _titleFontColor = titleFontColor;
    _titleLabel.textColor = _titleFontColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    float height = CGRectGetHeight(self.frame);
    float Width = CGRectGetWidth(self.frame);
    float labelHeight = 30;
    
    _bannerImageView.frame = CGRectMake(0, 0, Width, height);
    _labelBackgroundView.frame = CGRectMake(0, height - labelHeight, Width, labelHeight);
    _titleLabel.frame = CGRectMake(0, 0, Width - 100, labelHeight);
}

@end
