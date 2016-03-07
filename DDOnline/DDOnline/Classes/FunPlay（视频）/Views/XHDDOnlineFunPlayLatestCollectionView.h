//
//  XHDDOnlineFunPlayLatestCollectionView.h
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHDDOnlineFunPlayLatestCollectionView : UICollectionView

/**
 *  latestUpdateArray
 */
@property (nonatomic, copy) NSArray *latestUpdateArray;

+ (instancetype)funPlayLatestCollectionView;

@end
