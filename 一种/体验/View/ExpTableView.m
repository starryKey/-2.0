//
//  ExpTableView.m
//  一种
//
//  Created by wol on 15/9/30.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "ExpTableView.h"
#import "ExpCell.h"
#import "ExpDetailViewController.h"
#import "UIView+UIViewController.h"
@implementation ExpTableView{
    NSArray *_array;
    NSMutableData *_receivedData;
   // NSString *_subjectUrlString;
   // NSString *_subjectTitle;
    NSMutableArray *array;
    NSMutableArray *_subScenceArray;
    
    ExpCell *_cell;
    
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
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
#pragma mark - 创建视图
- (void)_createView{
    
    self.hidden = YES;
    self.delegate = self;
    self.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"ExpCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"expCell"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return array.count;
    //return 10;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _cell  = [tableView dequeueReusableCellWithIdentifier:@"expCell" forIndexPath:indexPath];
    _cell.backgroundColor = [UIColor clearColor];
    _cell.expModel = array[indexPath.row];
    return _cell;


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}


#pragma mark - 数据加载
- (void)_loadData{
    
    
   
    NSString *urlString = @"http://api.yizhong.cccwei.com/api.php?srv=2022&cid=276405&uid=3625&tms=20150925104600&sig=116d02021cd94dcf&wssig=b2ca2e932793eea0&os_type=3&version=6&city_id=6&since_id=0&page_size=20&coordinate=120.363733,30.327005";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //设置请求信息
    //(1)请求方式
    request.HTTPMethod = @"GET";
    //(2)请求的超时时间
    request.timeoutInterval = 60;
    [NSURLConnection connectionWithRequest:request delegate:self];

    
}

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
    
    self.hidden = NO;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:nil];
    array =  [[NSMutableArray alloc]init];
    _subScenceArray = [[NSMutableArray alloc]init];
    NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
    for (NSDictionary *dic in dataDic[@"items"]) {
        ExpModel *expModel = [[ExpModel alloc]initWithDataDic:dic];
        [array addObject:expModel];
        //获取子专题视图
        [_subScenceArray addObject:dic];
    }
    //加载
    [self  reloadData];
    
    
}


//单元格被点击后调用的方法


- (void)tableView:(UITableView *)tableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ExpDetailViewController *detailVC = [[ExpDetailViewController alloc]init];
    
    [self.viewController.navigationController pushViewController :detailVC animated:YES];
    
    
    //得到点击单元格所对应的专题
    NSDictionary *subScenceDic = _subScenceArray[indexPath.row];
    NSString *shareUrlString = subScenceDic[@"share_url"];
    
    //NSLog(@"链接是%@",shareUrlString);
    detailVC.shareUrlString = shareUrlString;

}





@end
