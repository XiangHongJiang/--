//
//  XHDDOnlineRootTabBarController.m
//  DDOnline
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 JXHDev. All rights reserved.
//
/**
 侧边栏控制器，用于侧边栏的视图展示及功能实现
 */
#import "XHDDOnlineRootTabBarController.h"
#import "XHDDOnlineRootNavigationController.h"

@interface XHDDOnlineRootTabBarController ()

@end

@implementation XHDDOnlineRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //1.添加带导航的视图控制器
    [self addSubCtrlWithNav];
}
//添加
- (void)addSubCtrlWithNav{

    //管理的子视图控制器的名字数组，用于快速创建
    NSArray *vcNameArray = @[@"FunPlay", @"Joke", @"Chat", @"Mine"];
    NSArray *titleNameArray = @[@"DD一看", @"DD一乐", @"DD一聊", @"Zone"];
    for (int i = 0; i < vcNameArray.count; i ++) {
        //拼接名字
        NSString *name = [NSString stringWithFormat:@"XHDDOnline%@Controller", vcNameArray[i]];
        //获取类
        Class clazz = NSClassFromString(name);
        //创建控制器
        UIViewController *vc = [[clazz alloc] init];
        
        //获取标题
        NSString *title = titleNameArray[i];
        //获取图片
        NSString *imageName = [NSString stringWithFormat:@"TabBar_Client_%d_n",i+1];
        NSString *selectedImageName = [NSString stringWithFormat:@"TabBar_Client_%d_p",i+1];
        //添加带导航的控制器：设置标题，图片
        [self addNavToViewController:vc withTitle:title imageName:imageName selectedImageName:selectedImageName];
        
    }
    
}
//添加设置
- (void)addNavToViewController:(UIViewController *)viewController withTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    //创建导航
    XHDDOnlineRootNavigationController *nav = [[XHDDOnlineRootNavigationController alloc] initWithRootViewController:viewController];
    //设置标题
    viewController.navigationItem.title = title;
    //设置Item图标
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //添加
    [self addChildViewController:nav];
    
}

@end
