//
//  ScenceCell.h
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainShopModel.h"
@interface ScenceCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *scenceImage;
@property (weak, nonatomic) IBOutlet UILabel *scenceLabel;

@property (nonatomic, strong)MainShopModel *mainShopModel;

@end
