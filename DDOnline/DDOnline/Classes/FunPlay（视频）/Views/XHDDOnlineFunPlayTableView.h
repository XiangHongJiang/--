//
//  XHDDOnlineFunPlayTableView.h
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHDDOnlineFunPlayTableView : UITableView
/** *  管理的直播的数据源 */
@property (nonatomic, copy) NSArray *funPlayDataArray;
/** *  创建加载视图 */
+ (instancetype)funPlayTableView;
@end
