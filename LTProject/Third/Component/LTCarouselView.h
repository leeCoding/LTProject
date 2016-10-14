//
//  LTCarouselView.h
//  LTProject
//
//  Created by Jonny on 2016/10/13.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  LTCarouseView Version 1.0.0
 *  如果你有问题，请联系我。
 *  If you have questions, Please contact me.
 *  QQ:740712231
 *  Email:nscode@sina.com
 *  GitHub:https://github.com/leeCoding
 *
**/

@protocol LTCarouselViewDelegate;

@interface LTCarouselView : UIView

@property (nonatomic,assign)id<LTCarouselViewDelegate> delegate;

/**************************** 个性化 Set personalized. ****************************/

@property (nonatomic,assign)NSTextAlignment titleTextAlignment; ///< 标题位置，默认左边。  Title point, Default is left.

@property (nonatomic,assign)BOOL isShowTitle; ///< 是否显示，默认显示标题。 Whether or not shown title , Default is show.

@property (nonatomic,assign)CGFloat timeInerval; ///< 轮播间隔时长，默认是3秒。 Setting the interval time, Default is 3 seconds.

@property (nonatomic,assign)BOOL isAutoScroller; ///< 是否自动滚动，默认是YES。 Whether to automatically, Default is Yes.

@property (nonatomic,assign)BOOL isCycleScroller; ///< 是否循环滚动，默认是YES。 Whether to cycle, Default is Yes.

@property (nonatomic,assign)BOOL isAnimationScroller; ///< 是否动画滚动，默认是YES。 Whether the have animation，Default is Yes.

@property (nonatomic,assign)BOOL isShowPage; ///< 是否显示页数，默认是YES。 Whether to show page，Default is Yes.

@property (nonatomic,assign)CGFloat titleFontSize; ///< 设置标题文字大小。Setting title font size.

/**************************** 设置数据 ／ Setting data. ****************************/

@property (nonatomic,strong)NSArray *urlImages; ///< 设置网络图片数组。 Setting url array.

@property (nonatomic,strong)NSArray *localImages; ///< 本地数组。Setting local image array.

@property (nonatomic,strong)UIImage *placeholderImage; ///< 设置占位图。Setting placeholder image，if there is no picture.

@property (nonatomic,strong)NSArray *titles; ///< 设置标题数组。 Setting title array.  

/**********************************************************************************/

/// 初始化方法。 Initialization method.
- (instancetype)initWithFrame:(CGRect)frame imageAry:(NSArray *)images;

- (instancetype)initWithFrame:(CGRect)frame imageAry:(NSArray *)images delegate:(id<LTCarouselViewDelegate>)delegate;

- (instancetype)initWithFrame:(CGRect)frame urlImageAry:(NSArray *)urlImages;

- (instancetype)initWithFrame:(CGRect)frame urlImageAry:(NSArray *)urlImages delegate:(id<LTCarouselViewDelegate>)delegate;

/// 获取版本号
- (NSString *)getVersion;

@end

/* Delegate method */

@protocol LTCarouselViewDelegate <NSObject>

@optional

// 当前选择的索引。 Select the current index block, return index.
- (void)carouselView:(LTCarouselView *)carouselView didSelectorImageAtIndex:(NSInteger)index;

// 滑动回调。Sliding block，return index。
- (void)carouselView:(LTCarouselView *)carouselView slidingImageAtIndex:(NSInteger)index;

@end
