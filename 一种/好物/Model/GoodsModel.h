//
//  GoodsModel.h
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//
/*
 "id": 319,
 "title": "\u51e0\u4f55\u73bb\u7483\u6302\u82b1\u74f6",
 "introduction": "\u7f8e\u8f6e\u7f8e\u5942\u7684\u51e0\u4f55\u4e16\u754c\uff0c\u6700\u7b80\u5355\u7684\u8bbe\u8ba1\u4e5f\u80fd\u5f00\u51fa\u82b1\u6765\u3002",
 "guide_image": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/23\/349ac9ccfce7fc90ee66fecf61ba4a6d.png",
 "width": 583,
 "height": 392
 },
 "author": {
 "id": 60,
 "nickname": "qq_liga",
 "avatar": "http:\/\/img.yizhong.cccwei.com\/yizhong\/2015\/04\/30\/a212692c5a0c1e9159d1f815aad8051b.jpg"
 },
 "buy_url": "https:\/\/item.taobao.com\/item.htm?spm=a230r.1.14.40.jYyE2H&id=40767342641&ns=1&abbucket=17#detail",
 "publish_time": 1442981323,
 "categories": [{
 "id": "1",
 "title": "\u54c1\u8d28"
 }],
 "content": ""
 },
 */



#import "BaseModel.h"

@interface GoodsModel : BaseModel

@property (nonatomic, copy)NSString *title;  //标题
@property (nonatomic, copy)NSString *introduction;//简介
@property (nonatomic, copy)NSString *guide_image;//图片

- (id)initWithDataDic:(NSDictionary *)dataDic;

@end
