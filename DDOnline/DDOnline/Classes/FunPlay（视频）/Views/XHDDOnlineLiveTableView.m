//
//  XHDDOnlineLiveTableView.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineLiveTableView.h"
#import "XHDDOnlineLiveCell.h"
#import "XHDDOnlineLiveModel.h"

@interface XHDDOnlineLiveTableView()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation XHDDOnlineLiveTableView

+ (instancetype)liveTableView{

    //创建对象
    XHDDOnlineLiveTableView *liveTableView = [[XHDDOnlineLiveTableView alloc] init];
    //设置代理
    liveTableView.delegate = liveTableView;
    liveTableView.dataSource = liveTableView;
    //注册cell
    [liveTableView registerNib:[UINib nibWithNibName:@"XHDDOnlineLiveCell" bundle:nil] forCellReuseIdentifier:@"XHDDOnlineLiveCell"];

    return liveTableView;
  
}

- (void)setLiveDataArray:(NSArray *)liveDataArray{

    //设置数据源
    _liveDataArray = liveDataArray;
    //刷新数据
    [self reloadData];
}

#pragma mark - tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.liveDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //复用cell
    XHDDOnlineLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XHDDOnlineLiveCell" forIndexPath:indexPath];
    //赋值模型
    cell.liveModel = self.liveDataArray[indexPath.row];    
    //返回cell
    return cell;
    
}

@end
