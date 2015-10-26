//
//  ShopTableView.h
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableView : UITableView<UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate>

@property(nonatomic, strong) NSArray *shopsArray;

@end
