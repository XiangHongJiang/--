//
//  XHDDOnlineFunPlayController.m
//  DDOnline
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineFunPlayController.h"
#import "XHDDOnlineFunPlayTableView.h"
#import "XHDDOnlineLiveTableView.h"

@interface XHDDOnlineFunPlayController ()<UIScrollViewDelegate>
/** *  管理的scrollView */
@property (nonatomic, weak) UIScrollView * scrollView;
/** *  管理的直播collectionView */
@property (nonatomic, weak) UITableView * liveTableView;
/** *  管理的番剧collectionView */
@property (nonatomic, weak) UITableView * funPlayTableView;
@end

@implementation XHDDOnlineFunPlayController

- (void)loadView{

    [super loadView];
    
    //1.设置ScrollView
    [self configScrollView];
    
    //2.加载直播视图
    [self loadLiveView];
    
    //3加载番剧视图
    [self loadFunPlayView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    

}
#pragma mark - setupUI
//设置scrollView
- (void)configScrollView{

    //1.scorllView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
    scrollView.contentInset = UIEdgeInsetsMake(JTopSpace, 0, JTopSpace, 0);
    scrollView.contentSize = CGSizeMake(JScreenWidth * 2, 0);
    scrollView.backgroundColor = JRandomColor;
    //设置属性
    self.scrollView = scrollView;
    
    //设置按页滚动
    scrollView.pagingEnabled = YES;
    
    //设置滚动条位置
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(-scrollView.bounds.size.height, 0, scrollView.bounds.size.height, 0);
    
    //设置代理
    scrollView.delegate = self;
}
//加载直播视图
- (void)loadLiveView{
    //1.liveTableView
    XHDDOnlineLiveTableView *liveTableView = [XHDDOnlineLiveTableView liveTableView];
    self.liveTableView = liveTableView;
    [self.scrollView addSubview:liveTableView];
    
    
    
    
}
//加载番剧视图
- (void)loadFunPlayView{
    //1.funPlayTableView

//    XHDDOnlineFunPlayTableView *funPlayTableView = [XHDDOnlineFunPlayTableView ]

}


@end
