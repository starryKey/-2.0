//
//  HeadCell.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "HeadCell.h"

@implementation HeadCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setShopModel:(MainShopModel *)shopModel{

    _shopModel = shopModel;
    _shopName.text = shopModel.title;
    NSString *urlString = shopModel.url;
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString: urlString]];
    UIImage *image = [UIImage imageWithData:imgData ];
    _shopImageView.image = image;
    
}

@end
