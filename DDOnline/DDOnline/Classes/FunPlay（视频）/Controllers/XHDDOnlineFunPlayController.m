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
#import "XHDDOnlineFunPlayModel.h"
#import "XHDDOnlineLiveModel.h"

@interface XHDDOnlineFunPlayController ()<UIScrollViewDelegate>
/** *  管理的scrollView */
@property (nonatomic, weak) UIScrollView * scrollView;
/** *  管理的直播tableView */
@property (nonatomic, weak) XHDDOnlineLiveTableView * liveTableView;
/** *  管理的番剧tableView */
@property (nonatomic, weak) XHDDOnlineFunPlayTableView * funPlayTableView;
/** *  funPlayModel */
@property (nonatomic, strong) XHDDOnlineFunPlayModel *funPlayModel;
/** *  liveModel */
@property (nonatomic, strong) XHDDOnlineLiveModel *liveModel;
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
    
    //请求数据
    [self requestFunPlayData];
    
    //添加下拉刷新
    [self addRefresh];

}

#pragma mark - setupUI
/** 设置scrollView    */
- (void)configScrollView{

    //1.scorllView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(JMargin * 0.5, JTopSpace, JScreenWidth - JMargin, JScreenHeight - JTopSpace - JTabBarHeight)];
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = JColorNavBg;
    //设置属性
    self.scrollView = scrollView;
    //设置按页滚动
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    //设置滚动条位置
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    //设置代理
    scrollView.delegate = self;    
    scrollView.contentSize = CGSizeMake(JScreenWidth * 2, 0);
    
    
}
/** 加载直播视图  */
- (void)loadLiveView{
    //1.liveTableView
    XHDDOnlineLiveTableView *liveTableView = [XHDDOnlineLiveTableView liveTableView];    
    liveTableView.backgroundColor = JColorNavBg;
    self.liveTableView = liveTableView;
    [self.scrollView addSubview:liveTableView];
    
}
/** 加载番剧视图  */
- (void)loadFunPlayView{
    //1.funPlayTableView
    XHDDOnlineFunPlayTableView *funPlayTableView = [XHDDOnlineFunPlayTableView funPlayTableView];
    self.funPlayTableView = funPlayTableView;
    [self.scrollView addSubview:funPlayTableView];
    funPlayTableView.backgroundColor = JColorNavBg;
}
/** *  添加刷新 */
- (void)addRefresh{

    self.funPlayTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestFunPlayData)];
}
#pragma mark - requestData
/** 请求数据    */
- (void)requestFunPlayData{

   //防止循环引用对象
    __weak typeof (self) weakSelf = self;
    
    [XHNetHelp getDataWithPath:kFunPlayUrl andParams:nil andComplete:^(BOOL succeed, id result) {
       
        if (succeed) {//请求成功
            //解析
            NSDictionary *funPlayDict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers error:nil];
            
            //转模型
            XHDDOnlineFunPlayModel *funPlayModel = [XHDDOnlineFunPlayModel mj_objectWithKeyValues:funPlayDict];
            
            //赋值刷新
            weakSelf.funPlayTableView.funPlayModel = funPlayModel;
            
            //结束刷新
            [weakSelf.funPlayTableView.mj_header endRefreshing];
            
        }
        else{//请求失败
        
            NSLog(@"请求失败:%@",result);
        }
        
    }];
    
}

@end
