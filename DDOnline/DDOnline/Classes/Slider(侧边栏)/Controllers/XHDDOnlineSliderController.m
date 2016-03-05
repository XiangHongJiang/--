//
//  XHDDOnlineSliderController.m
//  DDOnline
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineSliderController.h"
#import "RESideMenu.h"

@interface XHDDOnlineSliderController ()

@end

@implementation XHDDOnlineSliderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击消失侧边栏
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.sideMenuViewController hideMenuViewController];

}

@end
