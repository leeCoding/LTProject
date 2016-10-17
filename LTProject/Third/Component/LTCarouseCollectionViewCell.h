//
//  LTCarouseCollectionViewCell.h
//  LTProject
//
//  Created by Jonny on 2016/10/13.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTCarouseCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *bannerImageView;   ///< 图片
@property (nonatomic,strong)UILabel *titleLabel;            ///< 标题文字
@property (nonatomic,assign)CGFloat titleFontSize;          ///< 标题文字大小
@property (nonatomic,copy)NSString *textTitle;              ///< 标题文字
@property (nonatomic,strong)UIColor *titleFontColor;        ///< 标题颜色

// 是否显示标题
@property (nonatomic,assign)BOOL isShowTitle;

// 字体在位置
@property (nonatomic,assign)NSTextAlignment textAlignment;

@end
