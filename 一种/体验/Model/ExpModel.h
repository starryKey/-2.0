//
//  ExpModel.h
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//
/*
 "id": 146,
 "name": "\u53cd\u5149\u955c\u4e50\u961f\u201c\u5e7b\u955c2015\u5168\u56fd\u5de1\u6f14\u201d\u676d\u5dde\u7ad9",
 "image": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/19\/a1fef80cc5e607280fe41d0a9f6d0fc3.jpg",
 "width": 604,
 "height": 260
 },
 "address": "\u676d\u5dde\u4e07\u5858\u8def262\u53f7\u4e07\u7cd6\u6c47\u57ce\u5e02\u751f\u6d3b\u5e7f\u573a\u5357\u697c2F",
 "coordinate": "120.130879,30.285355",
 "start_time": 0,
 "end_time": 0,
 "active_time": "10\/16",
 "phone": "",
 "read_count": 0,
 "consumption_per_person": "100-120",
 "distance": 22814,
 "detail_url": "http:\/\/api.yizhong.cccwei.com\/index.php?m=Share&a=activityDetail&activity_id=146",
 "share_url": "http:\/\/api.yizhong.cccwei.com\/index.php?m=Share&a=shareActivityDetail&activity_id=146"

 */

#import "BaseModel.h"

@interface ExpModel : BaseModel

@property (nonatomic,copy)NSString *active_time;//时间

@property (nonatomic,assign)NSInteger distance;//距离
@property (nonatomic,copy)NSString *name;//店名
@property (nonatomic,copy)NSString *url;//图片地址
@property (nonatomic,copy)NSString *consumption_per_person;//人均消费
@property (nonatomic,copy)NSString *address;//地址
@property(nonatomic, copy)NSString *share_url;
- (id)initWithDataDic:(NSDictionary *)dataDic;


@end
