//
//  LTMainViewController.m
//  LTProject
//
//  Created by Jonny on 16/9/7.
//  Copyright © 2016年 上海众盟软件科技股份有限公司. All rights reserved.
//

#import "LTMainViewController.h"
#import "NSUserDefaults+Unit.h"

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
    
    self.view.backgroundColor = [UIColor blackColor];
    
    NSLog(@" 缓存路径：%@",[LTExpression lt_getCachesPath]);
    NSLog(@" 资源路径：%@",[LTExpression lt_getLibraryPath]);
    NSLog(@" 文件路径：%@",[LTExpression lt_getDocumentPath]);

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
