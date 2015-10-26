//
//  ExpCell.h
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpModel.h"
@interface ExpCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *consumLabel;

@property (nonatomic, strong) ExpModel *expModel;

@end
