//
//  XHDDOnlineFunPlayLatestCollectionView.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineFunPlayLatestCollectionView.h"
#import "XHDDOnlineLatestUpdateCell.h"

@interface XHDDOnlineFunPlayLatestCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation XHDDOnlineFunPlayLatestCollectionView

+ (instancetype)funPlayLatestCollectionView{

    //创建布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = JMargin;
    flowLayout.minimumInteritemSpacing = JMargin;
    
    //创建对象
    XHDDOnlineFunPlayLatestCollectionView *collectionView = [[XHDDOnlineFunPlayLatestCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    //设置代理
    collectionView.delegate = collectionView;
    collectionView.dataSource = collectionView;
    
    //注册item
    [collectionView registerNib:[UINib nibWithNibName:@"XHDDOnlineLatestUpdateCell" bundle:nil] forCellWithReuseIdentifier:@"XHDDOnlineLatestUpdateCell"];
    
    return collectionView;
}
#pragma mark - 设置布局
/*即将添加到父视图的时候确定尺寸*/
- (void)willMoveToSuperview:(UIView *)newSuperview{

    self.frame = newSuperview.bounds;
}
#pragma mark - dalegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.latestUpdateArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    XHDDOnlineLatestUpdateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XHDDOnlineLatestUpdateCell" forIndexPath:indexPath];
    
    //赋值数据
    
    
    return cell;
}
//返回每个item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(JScreenWidth - JMargin * 3, 150);
}


@end
