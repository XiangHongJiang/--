//
//  XHDDOnlineCategorysCell.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright (c) 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineCategorysCell.h"
#import "XHDDOnlineCategoryDetailCell.h"

@interface XHDDOnlineCategorysCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/** * CollectionView */
@property (nonatomic, weak) UICollectionView * collctionView;
@end

@implementation XHDDOnlineCategorysCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //添加collectionView
        [self addCollectionView];
        
    }
    
    return self;
}
#pragma mark - setupUI
- (void)addCollectionView{
    
    //创建布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    
    //创建对象
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, JScreenWidth - JMargin,200) collectionViewLayout:flowLayout];
    
    [self.contentView addSubview:collectionView];
    
    
    self.collctionView = collectionView;
    collectionView.bounces = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    //设置代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    //注册item
    [collectionView registerNib:[UINib nibWithNibName:@"XHDDOnlineCategoryDetailCell" bundle:nil] forCellWithReuseIdentifier:@"XHDDOnlineCategoryDetailCell"];
}
#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XHDDOnlineCategoryDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XHDDOnlineCategoryDetailCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(120, 200);
}

@end
