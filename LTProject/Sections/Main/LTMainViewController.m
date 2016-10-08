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

@interface LTMainViewController ()

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
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageView];
    
    UIImageView *imageView1 = [[UIImageView alloc]init];
    imageView1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView1];
    
//    __weak typeof(self) __weakSelf = self;
    
    /*  设置固定高 上左下边距为 0
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.view).with.offset(0);
        make.left.equalTo(__weakSelf.view).with.offset(0);
        make.right.equalTo(__weakSelf.view).with.offset(0);
        make.height.mas_equalTo(@200);
    }];
    */
    
    /*  固定宽高 居中显示
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(__weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(200, 200));
        
    }];
    */
    
    /*  设置固定高 上左下边距为 0
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.equalTo(__weakSelf.view).with.offset(0);
        make.left.equalTo(__weakSelf.view).with.offset(0);
        make.right.equalTo(__weakSelf.view).with.offset(0);
        make.height.equalTo(@200);
    }];
    */
    
    /*  距离上左下右 10 10 10 10
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(10, 10, 59, 10));
    }];
    */
    
    /* 两个视图之间布局
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(__weakSelf.view).with.offset(0);
        make.left.equalTo(__weakSelf.view).with.offset(0);
        make.right.equalTo(__weakSelf.view).with.offset(0);
        make.height.equalTo(@200);
    }];
    */
    
    /*
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(imageView.mas_bottom).with.offset(10);
        make.centerX.equalTo(imageView);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    */
    
    /*
    NSLog(@" %@",[LTDateManager lt_getNowDate]);
    NSLog(@" %@",[LTDateManager lt_getNowYear]);
    NSLog(@" %@",[LTDateManager lt_getNowYearAndMonth]);
    NSLog(@" %@",[LTDateManager lt_getNowYearAndMonthDay]);
    NSLog(@" %@",[LTDateManager lt_getNowHourAndMinuteSecond]);
    NSLog(@" %@",[LTDateManager lt_getTimestamp]);
    NSLog(@" %@",[LTDateManager lt_timestampWithTimeStandard:[LTDateManager lt_getTimestamp]]);
    NSLog(@" %@",[LTDateManager lt_timeStandardWithTimestamp:@"2016-09-13 15:09:00"]);
    */
    
    self.view.backgroundColor = [UIColor colorWithDisplayP3Red:100/255.f green:100/255.f blue:100/255.f alpha:1];
   
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
