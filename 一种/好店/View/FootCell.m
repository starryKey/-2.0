//
//  FootCell.m
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "FootCell.h"
#import "UIImageView+WebCache.h"
@implementation FootCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setFoodShopModel:(FoodShopModel *)foodShopModel{

    _FoodShopText.text = foodShopModel.desc;
    NSString *urlString = foodShopModel.url;
    [_FoodShopImage sd_setImageWithURL:[NSURL URLWithString:urlString]];
    
}

@end
