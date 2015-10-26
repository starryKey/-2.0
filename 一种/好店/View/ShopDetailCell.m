//
//  ShopDetailCell.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "ShopDetailCell.h"
#import "UIImageView+WebCache.h"
@implementation ShopDetailCell

- (void)awakeFromNib {
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (void)setShopDetailModel:(ShopDetailModel *)shopDetailModel{

    _shopDetailModel = shopDetailModel;
    _name.text = shopDetailModel.name;
    _address.text = shopDetailModel.address;
    NSString *stringUrl = shopDetailModel.url;
    
  //  NSLog(@"图片URL：%@",stringUrl);
    [_image sd_setImageWithURL:[NSURL URLWithString:stringUrl]];
    _consumption.text = [NSString stringWithFormat:@"￥%@/人均",shopDetailModel.consumption_per_person];
    
    
}

@end
