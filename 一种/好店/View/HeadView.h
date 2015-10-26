//
//  HeadView.h
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property(nonatomic,strong)NSArray *shopsArray;

@end
