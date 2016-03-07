//
//  XHDDOnlineFunPlayTableView.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineFunPlayTableView.h"

@interface XHDDOnlineFunPlayTableView()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation XHDDOnlineFunPlayTableView

+ (instancetype)funPlayTableView{

    //创建对象
    XHDDOnlineFunPlayTableView *funPlayTableView = [[XHDDOnlineFunPlayTableView alloc] init];
    //设置代理
    funPlayTableView.delegate = funPlayTableView;
    funPlayTableView.dataSource = funPlayTableView;
    //注册cell
    [funPlayTableView registerNib:[UINib nibWithNibName:@"XHDDOnlineFunPlayCell" bundle:nil] forCellReuseIdentifier:@"XHDDOnlineFunPlayCell"];
    
    return funPlayTableView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{

    self.frame = CGRectMake(newSuperview.frame.size.width, 0,newSuperview.frame.size.width, newSuperview.frame.size.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;//self.funPlayDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    NSLog(@"-------Bounds------%@",NSStringFromCGRect(self.frame));
    cell.textLabel.text = @"test";
    
    return cell;

}

@end
