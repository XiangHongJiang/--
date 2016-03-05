//
//  XHDDOnlineRootNavigationController.m
//  DDOnline
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineRootNavigationController.h"
#import "RESideMenu.h"

@interface XHDDOnlineRootNavigationController ()

@end

@implementation XHDDOnlineRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)signInView{

    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count == 0) {
        
        //添加侧边栏按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"ic_filter_0_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(splite)];
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(scan)];
#warning 此处设置登录状态视图,与哔哩哔哩登录侧边栏相似
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:<#(nonnull UIView *)#>]
    }
    
    
    [super pushViewController:viewController animated:animated];
    
}
- (void)splite{
    
    //侧边栏展开
    [self.sideMenuViewController presentLeftMenuViewController];
}
//扫描
- (void)scan{

    JLog(@"进入扫描");
    
}

@end
