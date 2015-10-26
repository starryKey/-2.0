//
//  ExpModel.m
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "ExpModel.h"

@implementation ExpModel

- (id)initWithDataDic:(NSDictionary *)dataDic{

    self = [super initWithDataDic : dataDic];
    if (self) {
        _name = dataDic[@"name"];//名字
        NSDictionary *imageDic = dataDic[@"image"];//图片
        _url = imageDic[@"url"];
        
        _active_time = dataDic[@"active_time"];//时间
        NSString *string  = dataDic[@"distance"];//距离
        _distance = [string integerValue];
       _consumption_per_person = dataDic[@"consumption_per_person"];//人均
        
         _address = dataDic[@"address"];
        _share_url = dataDic[@"share_url"];
        
        
        
    }
    return self;

}

@end
