//
//  ScenceCell.m
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "ScenceCell.h"

@implementation ScenceCell

- (void)awakeFromNib {
    
}

- (void)setMainShopModel:(MainShopModel *)mainShopModel{

    _mainShopModel = mainShopModel;
    
    _scenceLabel.text = mainShopModel.title;
    //图像数据
    NSString *urlString = mainShopModel.url;
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString: urlString]];
    UIImage *image = [UIImage imageWithData:imgData ];
    _scenceImage.image = image;

}

@end
