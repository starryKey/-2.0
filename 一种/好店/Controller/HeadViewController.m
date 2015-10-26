//
//  HeadViewController.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "HeadViewController.h"
#import "ShopDetailCell.h"
#import "MiddleViewController.h"
@interface HeadViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_detailsArray;
    NSMutableData *_receivedData;
}
@end

@implementation HeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self _createView];
    [self _loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
#pragma mark - 创建视图
- (void)_createView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}
#pragma mark - UITableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _detailsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ShopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopDetailCell"];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"ShopDetailCell" owner:nil options:nil];
        cell = [array  lastObject];
        cell.shopDetailModel = _detailsArray[indexPath.row];
        
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}

#pragma mark - 数据加载
- (void)_loadData{
    
    _tableView.hidden = YES;
    NSString *urlString = self.url;
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //!1)设置请求信息
    request.HTTPMethod = @"GET";
    //(2）请求的超时时间
    request.timeoutInterval = 60;
    [NSURLConnection connectionWithRequest:request delegate:self];

}

//1.传输失败会调用的协议方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}

//2.接收到响应头后会调用的协议方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
        //创建NSData，用来保存网络加载的数据
    _receivedData = [[NSMutableData alloc] init];
}

//3.接收到数据包时会调用的协议方法,此协议方法会被调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //拼接数据
    [_receivedData appendData:data];
}
//4.结束下载会调用的协议方法,
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    _tableView.hidden = NO;

    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:nil];
    _detailsArray = [[NSMutableArray alloc]init];
    NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
    for (NSDictionary *dic in dataDic[@"items"]) {
        ShopDetailModel *shopModel = [[ShopDetailModel alloc]initWithDataDic:dic];
        [_detailsArray addObject:shopModel];
    }
    [_tableView reloadData];
}

#pragma mark - 点击单元格跳转页面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //点击单元格后跳转到下一个页面
    MiddleViewController *middleVC = [[MiddleViewController alloc]init];
    [self.navigationController pushViewController:middleVC animated:YES];
    
    //得到点击单元格所对应的专题
    ShopDetailModel *detailModel = [[ShopDetailModel alloc]init];
    detailModel = _detailsArray[indexPath.row];
    NSString *shareUrlString = detailModel.shareUrl;
    middleVC.shareUrlString = shareUrlString;
}




@end
























