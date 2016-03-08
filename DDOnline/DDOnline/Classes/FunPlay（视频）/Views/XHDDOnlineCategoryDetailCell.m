//
//  XHDDOnlineCategoryDetailCell.m
//  DDOnline
//
//  Created by qianfeng on 16/3/8.
//  Copyright (c) 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineCategoryDetailCell.h"

@interface XHDDOnlineCategoryDetailCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *total_countLabel;

@end

@implementation XHDDOnlineCategoryDetailCell

- (void)setModel:(id)model{
    
    _model = model;
    
    
}
@end
