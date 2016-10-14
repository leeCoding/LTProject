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

@interface LTMainViewController ()
<
    LTCarouselViewDelegate
>
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
    
    // 轮播图
    LTCarouselView *carouse = [[LTCarouselView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) imageAry:@[@"banner_1",@"banner_2",@"banner_1",@"banner_2",@"banner_1",@"banner_2"] delegate:self];
    /*
    carouse.isShowTitle = NO;
    carouse.isAutoScroller = YES;
    carouse.timeInerval = 3;
    carouse.isShowPage = NO;
    */
    
    carouse.localImages = @[@"banner_1"];
    carouse.titles = @[@"不好"];
    carouse.titleFontSize = 8;
    
    [self.view addSubview:carouse];
}

#pragma mark - LTCarouselViewDelegate
- (void)carouselView:(LTCarouselView *)carouselView didSelectorImageAtIndex:(NSInteger)index {
    NSLog(@" 选择了%ld",index);
}

- (void)carouselView:(LTCarouselView *)carouselView slidingImageAtIndex:(NSInteger)index {
    
    NSLog(@" 当前页数 %ld",index);
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
