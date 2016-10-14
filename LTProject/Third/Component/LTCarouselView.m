//
//  LTCarouselView.m
//  LTProject
//
//  Created by Jonny on 2016/10/13.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTCarouselView.h"
#import "LTCarouseCollectionViewCell.h"
#import "LTPageControl.h"

@interface LTCarouselView ()
<
    UICollectionViewDelegate,
    UICollectionViewDataSource
>

@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)LTPageControl *pageControl;

@end

@implementation LTCarouselView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame imageAry:(NSArray *)images {
    
    _localImages = images;
    return  [self initWithFrame:frame];
}

// 本地图片初始化
- (instancetype)initWithFrame:(CGRect)frame imageAry:(NSArray *)images delegate:(id<LTCarouselViewDelegate>)delegate {
    _localImages = images;
    self.delegate = delegate;
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame urlImageAry:(NSArray *)urlImages {
    
    _urlImages = urlImages;
    return  [self initWithFrame:frame];
}

// 网络图片初始化
- (instancetype)initWithFrame:(CGRect)frame urlImageAry:(NSArray *)urlImages delegate:(id<LTCarouselViewDelegate>)delegate {
    _urlImages = urlImages;
    self.delegate = delegate;
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initData];
        
        [self initUI];
    }
    return self;
}

#pragma mark - 初始化数据
- (void)initData {
    
    _timeInerval = 3.f;
    _isAutoScroller = YES;
    _isShowTitle = NO;
    _titleTextAlignment = NSTextAlignmentLeft;
    _isCycleScroller = YES;
    _isAnimationScroller = YES;
    _titleFontSize = 14;
    
    // 开始滚动
    [self autoActionScrollView];
}

#pragma mark - 初始化UI
- (void)initUI {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    [flowLayout setItemSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    // 轮播图容器
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[LTCarouseCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:self.collectionView];
    
    // 页数
    self.pageControl = [[LTPageControl alloc]initWithFrame:CGRectMake(0, self.collectionView.frame.size.height - 35, self.collectionView.frame.size.width, 35)];
    
    NSInteger numPage = 0;
    if (_urlImages != nil && _urlImages.count != 0) numPage = _urlImages.count;
    else numPage = _localImages.count;
    
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    [self addSubview:self.pageControl];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"开始触碰");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    NSLog(@"结束触碰");
}

// 标题位置
- (void)setTitleTextAlignment:(NSTextAlignment )titleTextAlignment {
    _titleTextAlignment = titleTextAlignment;
}

// 是否显示
- (void)setIsShowTitle:(BOOL)isShowTitle {
    _isShowTitle = isShowTitle;
    
}

// 设置时长
- (void)setTimeInerval:(CGFloat)timeInerval {
    _timeInerval = timeInerval;
    NSLog(@" %d",_isAutoScroller);
    [self setIsAutoScroller:self.isAutoScroller];
}

// 设置是否自动滚动
- (void)setIsAutoScroller:(BOOL)isAutoScroller {
    _isAutoScroller = isAutoScroller;
    [self removeAutoTimer];
    
    if (_isAutoScroller) {
        [self autoActionScrollView];
    }
}

// 设置是否循环滚动
- (void)setIsCycleScroller:(BOOL)isCycleScroller {
    _isCycleScroller = isCycleScroller;
    [self setIsAutoScroller:self.isAutoScroller];
}

// 设置是否动画滚动
- (void)setIsAnimationScroller:(BOOL)isAnimationScroller {
    _isAnimationScroller = isAnimationScroller;
    [self setIsAutoScroller:self.isAutoScroller];
}

// 是否显示页数
- (void)setIsShowPage:(BOOL)isShowPage {
    _isShowPage = isShowPage;
    _pageControl.hidden = _isShowPage;
}

// 设置标题字体大小
- (void)setTitleFontSize:(CGFloat)titleFontSize {
    _titleFontSize = titleFontSize;
}
// 设置本地图片
-(void)setLocalImages:(NSMutableArray *)localImages {
    _localImages = localImages;
    _urlImages = nil;
    self.pageControl.numberOfPages = _localImages.count;
    [self setIsAutoScroller:self.isAutoScroller];
    if (_localImages != nil && _urlImages != 0) {
        [self.collectionView reloadData];
    }
}

// 设置网络图片
- (void)setUrlImages:(NSMutableArray *)urlImages {
    _urlImages = urlImages;
    _localImages = nil;
    self.pageControl.numberOfPages = _urlImages.count;
    [self setIsAutoScroller:self.isAutoScroller];
    
     //不为空时刷新表，设置网络图片
    if (_urlImages != nil && _urlImages.count != 0) {
        [self.collectionView reloadData];
    }
}

// 设置占位图
- (void)setPlaceholderImage:(UIImage *)placeholderImage {
    _placeholderImage = placeholderImage;
    if (_placeholderImage) {
        [self.collectionView reloadData];
    }
}

// 设置标题数组
- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    if (_titles != nil && _titles.count != 0) {
        if (_titles.count == _localImages.count || _titles.count == _urlImages.count) {
            [self.collectionView reloadData];
        } else {
            NSLog(@" Warning ❕❕❕ 标题数组要和图片数组一致");
        }
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (_urlImages != nil && _urlImages.count != 0) return _urlImages.count;
    
    return _localImages == nil ? 0 : _localImages.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LTCarouseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    if (_urlImages !=nil && _urlImages.count != 0) {
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_urlImages[indexPath.row]]];
        UIImage *image = [UIImage imageWithData:imageData];
        
        // 如果网络图片为空的话就设置占位图
        image == nil ? (_placeholderImage == nil ? (cell.bannerImageView.image = nil) : (cell.bannerImageView.image =_placeholderImage)) :(cell.bannerImageView.image = image);
        
    } else {
        
        if ([_localImages[indexPath.row] isKindOfClass:[NSString class]]) {
            cell.bannerImageView.image = [UIImage imageNamed:_localImages[indexPath.row]];
            
        } else {
            cell.bannerImageView.image = _localImages[indexPath.row];
        }
    }
    cell.textAlignment = self.titleTextAlignment;
    cell.isShowTitle = self.isShowTitle;
    cell.titleFontSize = self.titleFontSize;
    
    if (_titles != nil && _titles.count != 0) {
        
        cell.titleLabel.text = _titles[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(carouselView:didSelectorImageAtIndex:)]) {
        [self.delegate carouselView:self didSelectorImageAtIndex:indexPath.row];
    }
}

#pragma mark - 开启定时器滚动
- (void)autoActionScrollView {
    
    // 图片数组不等于空 且设置为自动播放
    
    if (_urlImages != nil && _urlImages.count != 0) {
        
        if (_isAutoScroller)[self addAutoTimer];
        
    } else {
     
        if (_isAutoScroller && _localImages != nil && _localImages.count != 0) {
            [self addAutoTimer];
        }
    }
}

- (void)addAutoTimer {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:_timeInerval target:self selector:@selector(actionScrollView) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
#pragma mark - 开始滚动
- (void)actionScrollView {
    
    //1）获取当前正在展示的位置
    NSIndexPath *currentIndexPath=[[self.collectionView indexPathsForVisibleItems]lastObject];
   
    //2）计算出下一个需要展示的位置
    NSInteger nextItem=currentIndexPath.item + 1;
    
    //3)当item等于数组总数item 归零
    
    if (_urlImages != nil && _urlImages.count != 0) {
        if (nextItem ==_urlImages.count) {
            nextItem = 0;
            [self isCycleScrollerRemoveTimer];
        }
        
    }else {
        
        if (nextItem ==_localImages.count) {
            nextItem = 0;
            // 如果不是循环滚动就清除定时器
            [self isCycleScrollerRemoveTimer];
        }
    }
    //4)设置index
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:0];
    
    //5）通过动画滚动到下一个位置
     [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:_isAnimationScroller];
}

- (void)isCycleScrollerRemoveTimer {
    // 如果不是循环滚动就清除定时器
    if (!_isCycleScroller) {
        [self removeAutoTimer];
    }
}

#pragma mark - 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float index  = scrollView.contentOffset.x/self.collectionView.frame.size.width;
    self.pageControl.currentPage = index;
}

/// 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self removeAutoTimer];
}

/// 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self autoActionScrollView];
}

#pragma mark - 结束滑动
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    float index  = scrollView.contentOffset.x/self.collectionView.frame.size.width;
    self.pageControl.currentPage = index;
    
    // 滑动回调
    if ([self.delegate respondsToSelector:@selector(carouselView:slidingImageAtIndex:)]) {
        [self.delegate carouselView:self slidingImageAtIndex:index];
    }
}

#pragma mark - 移除定时器
- (void)removeAutoTimer {
    [_timer invalidate];
    _timer = nil;
}

#pragma mark - 获取版本号
- (NSString *)getVersion {
    
    return @"1.0.0";
}
@end
