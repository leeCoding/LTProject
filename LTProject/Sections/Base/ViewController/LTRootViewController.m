//
//  LTRootViewController.m
//  LTTools
//
//  Created by Jonny on 16/7/25.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTRootViewController.h"

@interface LTRootViewController ()

@end

@implementation LTRootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initData];
    
    [self initUI];
}

#pragma mark - 初始化数据
- (void)initData {
    
    
}

#pragma mark - 初始化视图
- (void)initUI {
    
    self.view.backgroundColor = _kMainColor;
    
    /* 设置导航线为空白
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    */
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
