//
//  XHDDOnlineSliderController.m
//  DDOnline
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineSliderController.h"
#import "RESideMenu.h"

@interface XHDDOnlineSliderController ()<UITableViewDelegate, UITableViewDataSource>
/** *  cellImageNameArray */
@property (nonatomic, copy) NSArray *cellImageNameArray;
/** *  cellTitleArray */
@property (nonatomic, copy) NSArray *cellTitleArray;

@end

@implementation XHDDOnlineSliderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.configTableView
    [self configTableView];
    
}
#pragma mark - lazyLoad
- (NSArray *)cellImageNameArray{

    if (_cellImageNameArray == nil) {
        
        _cellImageNameArray = @[@"sidemenu_QA",@"sidemenu-software",@"sidemenu_blog",@"sidemenu_setting",@"sidemenu-night"];
    }
    return _cellImageNameArray;
}
- (NSArray *)cellTitleArray{

    if (_cellTitleArray == nil) {
        
        _cellTitleArray = @[@"我的下载",@"我的收藏",@"我的分享",@"设置",@"夜间模式"];
    }
    return _cellTitleArray;
}
#pragma mark - setupUI
//配置tableView
- (void)configTableView{
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sliderCellID"];
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //修改背景颜色
    self.view.backgroundColor = [UIColor colorWithWhite:218.0f/255.0f alpha:1.0f];
    
    self.tableView.rowHeight = 50;
    self.tableView.sectionHeaderHeight = JAdsViewHeight;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.cellTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //复用cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sliderCellID" forIndexPath:indexPath];
    
    //修改背景颜色
    cell.backgroundColor = [UIColor colorWithWhite:218.0f/255.0f alpha:1.0f];
    // Configure the cell...
    cell.imageView.image = [UIImage imageNamed:self.cellImageNameArray[indexPath.row]];
    cell.textLabel.text = self.cellTitleArray[indexPath.row];
    
    return cell;

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

        //添加表头视图
        UIView *headView = [[UIView alloc] init];
        headView.backgroundColor = JColorAlert;
        headView.frame = CGRectMake(0, 0, JScreenWidth, JAdsViewHeight);
    
    return headView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
#warning 跳转事件
    NSLog(@"%@",self.cellTitleArray[indexPath.row]);
}

@end
