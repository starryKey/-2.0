//
//  ExpCell.m
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

/*
 @property (nonatomic,copy)NSString *active_time;//时间
 @property (nonatomic,copy)NSString *distance;//距离
 
 @property (nonatomic,copy)NSString *name;//店名
 @property (nonatomic,copy)NSString *url;//图片地址
 @property (nonatomic,copy)NSString *consumption_per_person;//人均消费
 @property (nonatomic,copy)NSString *address;//地址

 @property (weak, nonatomic) IBOutlet UIImageView *image;
 @property (weak, nonatomic) IBOutlet UILabel *addressLabel;
 @property (weak, nonatomic) IBOutlet UILabel *timeLabel;
 @property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
 @property (weak, nonatomic) IBOutlet UILabel *consumLabel;
 
 */


#import "ExpCell.h"
#import "UIImageView+WebCache.h"
@implementation ExpCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)setExpModel:(ExpModel *)expModel{

    _expModel = expModel;
    _addressLabel.text = expModel.address;
    _timeLabel.text = expModel.active_time;    
   _distanceLabel.text = [NSString stringWithFormat:@"%ld.%ldKM",expModel.distance / 1000 , expModel.distance % 1000 / 100];
    _consumLabel.text = [NSString stringWithFormat:@"￥%@/人均",expModel.consumption_per_person];
    
    NSString *stringUrl = expModel.url;
    //NSLog(@"图片URL：%@",stringUrl);
    [_image sd_setImageWithURL:[NSURL URLWithString:stringUrl]];
     
    
    
}

@end
