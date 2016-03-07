//
//  XHDDOnlineFunPlayLatestCell.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineFunPlayLatestCell.h"
#import "XHDDOnlineLatestUpdateCell.h"

@interface XHDDOnlineFunPlayLatestCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/** * CollectionView */
@property (nonatomic, weak) UICollectionView * collctionView;

@end

@implementation XHDDOnlineFunPlayLatestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //添加collectionView
        [self addCollectionView];
        
    }
    
    return self;
}
#pragma mark - 根据model刷新数据
- (void)setLatestModel:(LatestupdateModel *)latestModel{

    _latestModel = latestModel;
    [self.collctionView reloadData];

}
#pragma mark - setupUI
- (void)addCollectionView{
    //创建布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    
    //创建对象
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, JScreenWidth - JMargin, 320) collectionViewLayout:flowLayout];
    
    [self.contentView addSubview:collectionView];
    
    collectionView.backgroundColor = JColorLightGray;
    self.collctionView = collectionView;
    
    //设置代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    //注册item
    [collectionView registerNib:[UINib nibWithNibName:@"XHDDOnlineLatestUpdateCell" bundle:nil] forCellWithReuseIdentifier:@"XHDDOnlineLatestUpdateCell"];
    
    [collectionView registerClass:NSClassFromString(@"UICollectionViewCell") forCellWithReuseIdentifier:@"CollectionViewCell"];
}
#pragma mark - dalegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    JLog(@"%ld",self.latestModel.list.count);
    
    return self.latestModel.list.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XHDDOnlineLatestUpdateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XHDDOnlineLatestUpdateCell" forIndexPath:indexPath];
    
    //赋值数据
    cell.latestModel = self.latestModel.list[indexPath.row];
    
    
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
//
//    cell.backgroundColor = JRandomColor;
    
    return cell;
}
//返回每个item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((JScreenWidth - JMargin - 10 * 3) / 2, 150);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(0, 10, 0, 10);
}
@end
