//
//  LTBaseTabBarViewController.m
//  LTProject
//
//  Created by Jonny on 16/8/4.
//  Copyright © 2016年 ZUBMO. All rights reserved.
//

#import "LTBaseTabBarViewController.h"
#import "LTMainViewController.h"

@interface LTBaseTabBarViewController ()

@property (nonatomic ,strong)NSArray *titles;
@property (nonatomic ,strong)NSArray *itemImages;
@property (nonatomic ,strong)NSArray *itemSelectorImages;

@end

@implementation LTBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initData];
    
    [self initView];
    
    [self setImageAndTitle];

}

#pragma mark - 初始化数据
- (void)initData {
    
    self.titles = @[@"Main",@"One",@"Two",@"Three",@"Four"];
    self.itemImages= @[@"tabBar_home_def",@"tabBar_fudao_def",@"tabBar_sanfz_def",@"tabBar_cepin_def",@"tabBar_quanzi_def",];
    self.itemSelectorImages= @[@"tabBar_home_sel",@"tabBar_fudao_sel",@"tabBar_sanfz_sel",@"tabBar_cepin_sel",@"tabBar_quanzi_sel",];
}

#pragma mark - 初始化视图
- (void)initView {
    
}

#pragma mark - 设置图片和标题
- (void)setImageAndTitle {
    
    NSMutableArray *navs = [[NSMutableArray alloc]init];
    for (int i = 0; i < self.titles.count; i++ ) {
        
        UINavigationController *nav = [self setViewContollerTabBarItemTitle:self.titles[i] defImage:self.itemImages[i] selectorImageName:self.itemSelectorImages[i] viewController:[LTMainViewController new]];
        [navs addObject:nav];
    }
    
    self.viewControllers = navs;
}

/**
 *  设置ViewController Item
 *
 *  @param title          标题
 *  @param imageName      默认图
 *  @param selImageName   选中图
 *  @param viewController 要设置的视图
 *
 *  @return 导航控制器
 */
- (UINavigationController *)setViewContollerTabBarItemTitle:(NSString *)title defImage:(NSString *)imageName selectorImageName:(NSString *)selImageName viewController:(UIViewController *)viewController {
    
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selImageName];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    return nav;
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
