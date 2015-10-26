//
//  GoodsCell.m
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "GoodsCell.h"
#import "UIImageView+WebCache.h"
@implementation GoodsCell

- (void)awakeFromNib {
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setGoodsModel:(GoodsModel *)goodsModel{

    _goodsModel = goodsModel;
    
    _nameLabel.text = goodsModel.title;
    _commentLabel.text = goodsModel.introduction;
    
    NSString *stringUrl = goodsModel.guide_image ;
    //NSLog(@"图片URL：%@",stringUrl);
    [_imageV sd_setImageWithURL:[NSURL URLWithString:stringUrl]];

    
}

@end
