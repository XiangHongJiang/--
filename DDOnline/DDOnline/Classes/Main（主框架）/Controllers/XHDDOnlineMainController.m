//
//  XHDDOnlineMainController.m
//  DDOnline
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineMainController.h"
#import "XHDDOnlineRootTabBarController.h"

@interface XHDDOnlineMainController ()

@end

@implementation XHDDOnlineMainController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //添加主TabBar视图控制器
    [self addMainTabBarController];
    
}
- (void)addMainTabBarController{

    XHDDOnlineRootTabBarController *rootTabBarCtrl = [[XHDDOnlineRootTabBarController alloc] init];
    rootTabBarCtrl.view.backgroundColor = [UIColor whiteColor];
    //显示tabBar控制的视图，默认第一页（视频页）
    /*
     这也设置的好处在于，还可以在此视图进行一些复杂的其他操作，便于管理
    */
    [self.view addSubview:rootTabBarCtrl.view];
    //防止被销毁
    [self addChildViewController:rootTabBarCtrl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
