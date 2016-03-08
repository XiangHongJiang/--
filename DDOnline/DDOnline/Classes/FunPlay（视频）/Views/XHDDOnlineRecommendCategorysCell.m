//
//  XHDDOnlineRecommendCategorysCell.m
//  DDOnline
//
//  Created by qianfeng on 16/3/8.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineRecommendCategorysCell.h"
#import "XHDDOnlineRecommendCategoryDetailCell.h"
#import "XHDDOnlineMy3DLayout.h"

@interface XHDDOnlineRecommendCategorysCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView * collectionView;

@property (nonatomic, copy) NSArray *pictureArray;


@end

@implementation XHDDOnlineRecommendCategorysCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //1.创建collectionView
        [self creatCollectionView];
        
        
        //2.注册cell
        [self registCollectionView];

        
    }
    return  self;
}
//注册cell
- (void)registCollectionView{
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"XHDDOnlineRecommendCategoryDetailCell" bundle:nil] forCellWithReuseIdentifier:@"XHDDOnlineRecommendCategoryDetailCell"];
}
//创建collectionView
- (void)creatCollectionView{
    
    //    //1.创建布局对象
    //    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //
    //    //2.设置布局
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    flowLayout.minimumInteritemSpacing = 5;
    //    flowLayout.minimumLineSpacing = 5;
    
    //自定义布局
    XHDDOnlineMy3DLayout *layout = [[XHDDOnlineMy3DLayout alloc] init];
    
    //3.创建带布局的collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, JScreenHeight * 0.5, JScreenWidth, JScreenHeight * 0.5) collectionViewLayout:layout];
    
    
    [self.contentView addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.contentOffset = CGPointMake(JSelfW, 0);
    
    //4.设置代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
}

#pragma mark - 代理相关
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.pictureArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XHDDOnlineRecommendCategoryDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XHDDOnlineRecommendCategoryDetailCell" forIndexPath:indexPath];
    
    cell.categoryDetailModel = self.recommendCategory[indexPath.row];
    
    return cell;
    
}

#pragma mark -  关于循环
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    
    
    //无限循环....
    float currentOffset = _scrollView.contentOffset.x;//当前偏移量
    
    int numCount = (int)[self.collectionView numberOfItemsInSection:0];//总照片数 10
    float itemW = _scrollView.frame.size.width;//视图宽度
    
    if (numCount >= 3)
    {
        if (currentOffset < itemW / 2) {//当前偏移量小于视图宽度的一半，则出边界，让其显示最后一张
            [_scrollView setContentOffset:CGPointMake(currentOffset + itemW * numCount, 0)];
        }
        else if (currentOffset > itemW / 2 + itemW * numCount)
        {
            [_scrollView setContentOffset:CGPointMake(currentOffset - itemW *numCount, 0)];
        }
    }
}



@end
