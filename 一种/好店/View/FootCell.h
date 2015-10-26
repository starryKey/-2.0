//
//  FootCell.h
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodShopModel.h"
@interface FootCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *FoodShopImage;
@property (weak, nonatomic) IBOutlet UILabel *FoodShopText;
@property (nonatomic, strong)FoodShopModel *foodShopModel;


@end
