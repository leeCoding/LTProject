//
//  LTCarouseCollectionViewCell.m
//  LTProject
//
//  Created by Jonny on 2016/10/13.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTCarouseCollectionViewCell.h"

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
    _bannerImageView.backgroundColor = [UIColor purpleColor];
    [self addSubview:_bannerImageView];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.backgroundColor = [UIColor grayColor];
    _titleLabel.alpha = .7;
    [self addSubview:_titleLabel];
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
-(void)layoutSubviews {
    [super layoutSubviews];
    
    float height = CGRectGetHeight(self.frame);
    float Width = CGRectGetWidth(self.frame);
    
    _bannerImageView.frame = CGRectMake(0, 0, Width, height);
    _titleLabel.frame = CGRectMake(0, height - 35, Width, 35);
    
}

@end
