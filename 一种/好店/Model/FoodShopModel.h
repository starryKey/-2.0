//
//  FoodShopModel.h
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "BaseModel.h"

@interface FoodShopModel : BaseModel

@property (nonatomic,copy)NSString *desc;
@property (nonatomic,copy)NSString *url;

- (id)initWithDataDic:(NSDictionary *)dataDic;

//- (id)initDictionary:(NSDictionary *)jsonDic;


@end
