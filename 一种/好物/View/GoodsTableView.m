//
//  GoodsTableView.m
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "GoodsTableView.h"
#import "GoodsCell.h"
#import "NextViewController.h"
#import "UIView+UIViewController.h"
@implementation GoodsTableView
{
    NSArray *_array;
    NSMutableData *_receivedData;
    //NSString *_subjectUrlString;
   // NSString *_subjectTitle;
    NSMutableArray *array;
    NSMutableArray *_subScenceArray;
    GoodsModel *_goodsModel;


}
- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _loadData];
        [self _createView];
       
    }
    return self;
}

- (void)awakeFromNib{

   [self _loadData];
    [self _createView];
    
    
}

- (void)_createView{
    self.hidden = YES;
    self.delegate = self;
    self.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"GoodsCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"goodsCell"];

}

#pragma mark - delegate  datasouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return array.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 280;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    GoodsCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"goodsCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.goodsModel = array[indexPath.row];
    return cell;


}

#pragma mark - 网络请求

- (void)_loadData{

    NSString *urlString = @"http://api.yizhong.cccwei.com/api.php?srv=2001&cid=276405&uid=3625&tms=20150925105001&sig=3a8b30da3cdd1896&wssig=57717f05be847977&os_type=3&version=6&city_id=6&since_id=0&page_size=20";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"好物的url :%@",url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //设置请求信息
    //(1)请求方式
    request.HTTPMethod = @"GET";
    //(2)请求的超时时间
    request.timeoutInterval = 60;
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
}

#pragma mark - NSURLConnectionDataDelegate
//1.传输失败时回调用的方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}
//2.接到响应头后会调用的方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    //创建NSData，用来保存网络加载的数据
    _receivedData = [[NSMutableData alloc]init];
    
}
//3.接收到数据包时会调用的协议方法,此协议方法会被调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [_receivedData appendData:data];
}
//4结束下载时会调用的方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"好物里面解析的数据是:%@",jsonDic);
    array = [[NSMutableArray alloc]init];
    _subScenceArray = [[NSMutableArray alloc]init];
    NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
 
    for (NSDictionary *dic in dataDic[@"items"]) {
        NSLog(@"字典里解析的数据%@",dic);
        
        NSString *str = dic[@"id"];
        if ([str integerValue] != 321) {
             _goodsModel = [[GoodsModel alloc]initWithDataDic:dic];
            [array addObject:_goodsModel];
        }
        
        
        //获取子专题视图
        [_subScenceArray addObject:dic];
    }
    //加载
    [self  reloadData];
    self.hidden = NO;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NextViewController *nextVC = [[NextViewController alloc]init];
    [self.viewController.navigationController pushViewController:nextVC animated:YES];
    
    
    //得到点击单元格所对应的专题
    NSDictionary *subScenceDic = _subScenceArray[indexPath.row+1];
    NSString *shareUrlString = subScenceDic[@"buy_url"];
    
    //NSLog(@"链接是%@",shareUrlString);
    nextVC.buyUrl = shareUrlString;
    
    
    
}










@end
