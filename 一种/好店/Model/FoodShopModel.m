//
//  FoodShopModel.m
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "FoodShopModel.h"

@implementation FoodShopModel

- (id)initWithDataDic:(NSDictionary *)dataDic{

    self = [super initWithDataDic:dataDic];
    if (self) {
    
       // _desc = dataDic[@"desc"];
        _desc = dataDic[@"title"];
        NSDictionary *icon = dataDic[@"icon"];
        _url = icon[@"url"];
    }
    return self;

}

//- (id)initDictionary:(NSDictionary *)jsonDic{
//    
//    if (self = [super initWithDataDic:jsonDic]) {
//        _desc = jsonDic[@"desc"];
//        NSDictionary *icon = jsonDic[@"icon"];
//        _url = icon[@"url"];
//        
//    }
//    
//    return self ;
//}

@end
