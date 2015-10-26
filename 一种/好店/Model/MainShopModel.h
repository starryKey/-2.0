//
//  MainShopModel.h
//  一种
//
//  Created by wol on 15/9/29.
//  Copyright (c) 2015年 wol. All rights reserved.
//

//icon =     {
//    height = 160;
//    url = "http://img.yizhong.cccwei.com/yizhong/yizhongapp/2015/09/07/e06e6917a4c6696c7f28abb303e03644.png";
//    width = 292;
//};
//id = 1;
//title = "\U7f8e\U98df";
//}

#import "BaseModel.h"

@interface MainShopModel : BaseModel

@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *title;

- (id)initWithDataDic:(NSDictionary *)dataDic;

@end
