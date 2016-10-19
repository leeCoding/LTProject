//
//  LT3DTouchViewController.m
//  LTProject
//
//  Created by Jonny on 2016/10/12.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LT3DTouchViewController.h"
#import "UIGestureRecognizer+Action.h"

@interface LT3DTouchViewController ()

@end

@implementation LT3DTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.title = @"扫一扫";
    __weak typeof(self) __weakSelf = self;
    [self.view addGestureRecognizer:[UITapGestureRecognizer lt_gestureRecognizerWithBlock:^(id gestureRecognizer) {
        [__weakSelf dismissViewControllerAnimated:YES completion:nil];
    }]];
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
