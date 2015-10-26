//
//  HeadCell.h
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainShopModel.h"
@interface HeadCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopName;

@property (nonatomic, strong) MainShopModel *shopModel;

@end
