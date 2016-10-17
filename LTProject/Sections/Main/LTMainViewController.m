//
//  LTMainViewController.m
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTMainViewController.h"
#import "NSUserDefaults+Unit.h"
#import "LTTouchID.h"
#import "LTDateManager.h"
#import "LTHttpRequestManager.h"
#import "LTStarView.h"
#import "LT3DTouchViewController.h"
#import "LTCarouselView.h"
#import "SDCycleScrollView.h"

@interface LTMainViewController ()
<
    LTCarouselViewDelegate
>

@property (nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end

@implementation LTMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initUI];
}

#pragma mark - 初始化数据
- (void)initData {
    
}

#pragma mark - 初始化视图
- (void)initUI {
    
    self.navigationController.navigationBar.translucent = NO;
//    self.view.backgroundColor = [UIColor blackColor];
    
    [self addObserver];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc]init];
    imageView1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView1];
    

    self.view.backgroundColor = [UIColor whiteColor];

    
    /*
    /// 星星评分
    LTStarView *starView = [[LTStarView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100) clickBtn:^(NSString *score) {
        NSLog(@" 分数 %@",score);
    }];
    
    [self.view addSubview:starView];
    */
    
    NSArray *url = @[@"http://e-learning.gzshell.com:9000/lms_data/lms/storage/users_picture/38_57c7935a7db99.jpg",
                     @"http://e-learning.gzshell.com:9000/lms_data/lms/storage/users_picture/fbf7dc8e18fce0072802e0874cdc2ea2.png",
                     @"http://elearning.star-riverliquor.com:9810/lms_data/lms/storage/courses_picture/SRDC-HY-000002.jpg",
                     @"http://elearning.star-riverliquor.com:9810/lms_data/lms/storage/courses_picture/SRDC-ADMIN-000004.jpg"];
    // 轮播图
    LTCarouselView *carouse = [[LTCarouselView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) urlImageAry:url delegate:self];
    /*
    carouse.isShowTitle = NO;
    carouse.timeInerval = 3;
    carouse.isShowPage = NO;
    */
    carouse.isAutoScroller = YES;
    carouse.placeholderImage = [UIImage imageNamed:@"12"];
    carouse.titleFontColor = [UIColor whiteColor];
    carouse.titles = @[@"1",@"2",@"3",@"4"];
    [self.view addSubview:carouse];
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200) imageURLStringsGroup:url];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _cycleScrollView.titleLabelTextFont = [UIFont systemFontOfSize:14];
    _cycleScrollView.hidesForSinglePage = NO;
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _cycleScrollView.pageControlDotSize = CGSizeMake(10, 10);
    //    _cycleScrollView.titlesGroup = @[@"学习",@"测评"];
    _cycleScrollView.autoScroll = YES;
    _cycleScrollView.infiniteLoop = YES;
    _cycleScrollView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:_cycleScrollView];
}

#pragma mark - LTCarouselViewDelegate
- (void)carouselView:(LTCarouselView *)carouselView didSelectorImageAtIndex:(NSInteger)index {
    NSLog(@" 选择了%ld",index);
}

- (void)carouselView:(LTCarouselView *)carouselView slidingImageAtIndex:(NSInteger)index {
    
    NSLog(@" 当前滚动页数 %ld",index);
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
}

#pragma mark - 添加观察者
- (void)addObserver {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goTo:) name:@"goTo3DTouch" object:nil];
}

- (void)goTo:(NSNotification *)not {
    
    if ([not.userInfo[@"type"] isEqualToString:@"1"]) {
        
        LT3DTouchViewController *touch = [LT3DTouchViewController new];
        touch.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:touch animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
