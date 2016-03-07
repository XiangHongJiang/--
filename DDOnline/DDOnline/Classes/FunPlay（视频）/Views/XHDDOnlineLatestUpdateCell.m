//
//  XHDDOnlineLatestUpdateCell.m
//  DDOnline
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 JXHDev. All rights reserved.
//

#import "XHDDOnlineLatestUpdateCell.h"
#import "UIImageView+WebCache.h"

@interface XHDDOnlineLatestUpdateCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *onlineNumber;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *latestPlay;
@property (weak, nonatomic) IBOutlet UILabel *latestTime;

@end

@implementation XHDDOnlineLatestUpdateCell

- (void)awakeFromNib{

    self.onlineNumber.backgroundColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.000 alpha:0.500];
}

- (void)setLatestModel:(LatestList *)latestModel{

    _latestModel = latestModel;

    
#warning 赋值数据
    JLog(@"%p",latestModel);
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:latestModel.cover]];
    self.onlineNumber.text = [NSString stringWithFormat:@"%@人在看",latestModel.watchingCount] ;
    self.nameLabel.text = latestModel.title;
    self.latestPlay.text = [NSString stringWithFormat:@"第%@话",latestModel.total_count];
    self.latestTime.text = @"today";
    [self.onlineNumber sizeToFit];
}

@end
