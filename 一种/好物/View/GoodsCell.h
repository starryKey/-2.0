//
//  GoodsCell.h
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface GoodsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (nonatomic, strong)GoodsModel *goodsModel;

@end
