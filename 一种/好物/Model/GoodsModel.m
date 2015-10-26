//
//  GoodsModel.m
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//
/*
 data =     {
 count = 20;
 items =         (
 {
 author =                 {
 avatar = "http://img.yizhong.cccwei.com/yizhong/2015/04/29/ee0055bf0ec0e1ffce72987f11d0c5cc.jpg";
 id = 59;
 nickname = tyon;
 };
 "buy_url" = "https://detail.tmall.com/item.htm?spm=a230r.1.14.15.XyEBH5&id=521741757483&ns=1&abbucket=17&skuId=3109172330950";
 categories =                 (
 {
 id = 1;
 title = "\U54c1\U8d28";
 }
 );
 content = "";
 "guide_image" = 0;
 id = 321;
 introduction = "\U60ca\U8273\Uff01\U5f53\U7528\U9910\U6210\U4e3a\U4e00\U9053\U98ce\U666f\Uff0c\U8fd9\U6837\U7684\U827a\U672f\U9910\U5177\Uff0c\U592a\U53ef\U7231\U4e86\Uff01";
 "publish_time" = 1443582328;
 title = "\U6c34\U679c\U52a8\U6f2b\U9676\U74f7\U9910\U5177";
 },
 {
 author =                 {
 avatar = "http://img.yizhong.cccwei.com/yizhong/2015/05/04/d01b20d3a49d6a170f6c43e6737782e3.jpg";
 id = 64;
 nickname = koke;
 };
 "buy_url" = "https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-8286595245.65.odapgw&id=520101034247";
 categories =                 (
 {
 id = 1;
 title = "\U54c1\U8d28";
 }
 );
 content = "";
 "guide_image" =                 {
 height = 569;
 url = "http://img.yizhong.cccwei.com/yizhong/yizhongapp/2015/09/29/6cdaf96faae2875a30e5991475326cb1.jpg";
 width = 750;
 };
 id = 320;
 introduction = "\U4e00\U6b3e\U70ab\U5f69\U7684\U624b\U673a\U58f3\Uff0c\U4e0d\U4ec5\U767d\U5929\U597d\U7528\Uff0c\U665a\U4e0a\U4e5f\U53ef\U4ee5\U8ba9\U4f60\U6709\U6781\U9ad8\U7684\U56de\U5934\U7387\U54e6\U3002";
 "publish_time" = 1443510161;
 title = "\U591c\U5149\U6d41\U6c99\U624b\U673a\U58f3";
 },

 */



#import "GoodsModel.h"

@implementation GoodsModel

- (id)initWithDataDic:(NSDictionary *)dataDic{

    self = [super initWithDataDic:dataDic];
    if (self) {
        _title =  dataDic[@"title"];
        _introduction = dataDic[@"introduction"];
        NSDictionary *urlDic = dataDic[@"guide_image"];
        _guide_image = urlDic[@"url"];
        
        
    }
    
    return self;

}


@end
