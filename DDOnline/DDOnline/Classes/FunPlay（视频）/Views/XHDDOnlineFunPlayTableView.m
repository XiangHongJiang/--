//
//  XHDDOnlineFunPlayTableView.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineFunPlayTableView.h"
#import "XHDDOnlineFunPlayLatestCell.h"

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
    [funPlayTableView registerNib:[UINib nibWithNibName:@"XHDDOnlineCategorysCell" bundle:nil] forCellReuseIdentifier:@"XHDDOnlineCategorysCell"];
    
    return funPlayTableView;
}

- (void)setFunPlayModel:(XHDDOnlineFunPlayModel *)funPlayModel{
    _funPlayModel = funPlayModel;
    
    //刷新数据
    [self reloadData];
}

- (void)willMoveToSuperview:(UIView *)newSuperview{

    self.frame = CGRectMake(newSuperview.frame.size.width, 0,newSuperview.frame.size.width, newSuperview.frame.size.height);
}
#pragma mark - tableView Delegate
/** 返回组数    */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.funPlayModel.result.categories.count + 2;
}
/**  返回行数   */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;//self.funPlayDataArray.count;
}
/**  返回tableViewCell    */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section == 0) {//第0组
    
        XHDDOnlineFunPlayLatestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XHDDOnlineFunPlayLatestCell"];
        if (cell == nil) {
            
            cell = [[XHDDOnlineFunPlayLatestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XHDDOnlineFunPlayLatestCell"];
        }
        cell.latestModel = self.funPlayModel.result.latestUpdate;
 
        return cell;
    }
    
    else{
//        cell = [tableView dequeueReusableCellWithIdentifier:@"XHDDOnlineCategorysCell"];
        
     UITableViewCell *cell = [[UITableViewCell alloc] init];
        
     cell.textLabel.text = @"test";
        
        return cell;
    }


}
/** 返回重复利用的组头*/
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    UIView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"reuseHeadView"];
//    
//    if (view == nil) {
//        
//        view = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"reuseHeadView"];
//       
//    }
//    
//    return view;
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return @"123";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}
@end
