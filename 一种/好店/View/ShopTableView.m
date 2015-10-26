//
//  ShopTableView.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "ShopTableView.h"
#import "HeadView.h"
#import "FootView.h"
#import "FootCell.h"
#import "FootViewController.h"
#import "MiddleViewController.h"
#import "UIView+UIViewController.h"
#import "Common.h"
#import "FoodShopModel.h"
#import "MBProgressHUD.h"
@implementation ShopTableView{

    HeadView *_headView;
    FootView *_footView;
    NSArray *_array;
    NSMutableData *_receivedData;
    NSString *_subjectUrlString;
    NSString *_subjectTitle;
    NSMutableArray *array;
    NSMutableArray *_subScenceArray;
    MBProgressHUD *_hud;
    

}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _loadData];
        [self _createView];
        self.backgroundColor = [UIColor whiteColor];
        [self showHUD:@"正在加载"];
        
        
    }
    return self;

}

- (void)awakeFromNib{
    [self _loadData];
    [self _createView];
    


}
#pragma mark - 创建视图
- (void)_createView{
  
    self.delegate = self;
    self.dataSource = self;
    self.shopsArray = [[NSArray alloc]init];
    _footView = [[FootView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 230)];
   // _footView.backgroundColor = [UIColor whiteColor];
    self.tableFooterView = _footView;
    UINib *nib = [UINib nibWithNibName:@"FootCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"footCell"];
    


}

#pragma mark - delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return array.count+1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FootCell *cell = [tableView dequeueReusableCellWithIdentifier:@"footCell"];
    if (indexPath.row == 0) {
        //图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - 45) / 2 -30, 10, 45, 45)];
        //内容
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth - 45)/2 + 20, 15, 60, 40)];
        label.font = [UIFont systemFontOfSize:13];
        label.backgroundColor = [UIColor clearColor];
        label.text = _subjectTitle;
        NSString *urlString = _subjectUrlString;
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        UIImage *image = [UIImage imageWithData:imgData];
        imageView.image = image;
        [cell addSubview:imageView];
        [cell addSubview:label];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        
        
    }
    else {
        cell.foodShopModel = array[indexPath.row - 1];
        
    
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    _headView = [[HeadView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 320)];
    return _headView;
}

// 头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 320;
}


#pragma mark - 加载数据

- (void)_loadData{
    
    
    //self.hidden = YES;
    
    NSString *urlString = @"http://api.yizhong.cccwei.com/api.php?srv=2008&cid=276405&uid=3625&tms=20150926112444&sig=a8eabfd912da969e&wssig=fe2067841ea31997&os_type=3&version=6&city_id=6";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置请求信息
    //(1)请求方式
    request.HTTPMethod = @"GET";
    //(2)请求超时
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
    self.hidden = NO;

    NSDictionary *jsonDic = [NSJSONSerialization  JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:nil];
    array = [[NSMutableArray alloc]init ];
    _subScenceArray = [[NSMutableArray alloc]init];
    NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
    NSDictionary *subjectDic = [dataDic objectForKey:@"subject"];
    NSDictionary *iconDic = subjectDic[@"icon"];
    _subjectTitle = subjectDic[@"title"];
    _subjectUrlString = iconDic[@"url"];
    //NSDictionary *dict = subjectDic[@"sub_subjects"];
   // _subjectTitle = dict[@"title"];
    
    
    for (NSDictionary *dic in subjectDic[@"sub_subjects"] ) {
        FoodShopModel *foodModel = [[FoodShopModel alloc]initWithDataDic:dic];
        [array addObject:foodModel];
        //获取子专题数据
        [_subScenceArray addObject:dic];
        
    }
    [self reloadData];
    
    //[self hideHUD];
    [self completeHUD:@"加载完成"];
    
    
    
}

#pragma mark - 点击单元格调用的方法
- (void)tableView:(UITableView *)tableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row != 0) {
        //点击单元格后跳转到subScence页面
        MiddleViewController *middleVC = [[MiddleViewController alloc]init];
        [self.viewController.navigationController pushViewController:middleVC animated:YES];
        
        
        //得到点击单元格所对应的专题
        NSDictionary *subScenceDic = _subScenceArray[indexPath.row - 1];
        NSString *shareUrlString = subScenceDic[@"share_url"];
    
        middleVC.shareUrlString = shareUrlString;
       
    }
}


#pragma mark - 显示加载页面
- (void)showHUD:(NSString *)title{
    if (_hud == nil) {
        _hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    [_hud show: YES];
    _hud.labelText = title;
    //灰色背景视图覆盖掉其他视图
    _hud.dimBackground = YES;
}

- (void)hideHUD{
    [_hud hide:YES];
}
- (void)completeHUD:(NSString *)title{

    _hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = title;
    //持续1秒隐藏
    //[_hud hide:YES afterDelay:1.5];
    [_hud hide:YES];
    
}

/*
 "subject": {
 "id": 2,
 "title": "\u5348\u9910",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/51e76c10f34d2047662697471c412a74.png",
 "width": "45",
 "height": "45"
 },
 "desc": "",
 "sub_subjects": [{
 "id": 35,
 "title": "\u597d\u5403\u4e0d\u505c\u5634\u7684\u97e9\u56fd\u6599\u7406",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/02\/a9ec2dc5adb37a756317f619216fc9a9.jpg!320",
 "width": 0,
 "height": 0
 },
 "desc": "\u56e0\u4e3a\u97e9\u5267\u800c\u706b\u7684\u97e9\u56fd\u7f8e\u98df\u73b0\u5728\u5f88\u5bb9\u6613\u5403\u5230\uff0c\u601d\u5bc6\u8fbe\u5473\u9053\u5c31\u5728\u8eab\u8fb9\u54e6\uff01",
 "share_url": "http:\/\/api.yizhong.cccwei.com\/index.php?m=Share&a=shareTopicList&topic_id=35",
 "sub_subjects": []
 }, {
 "id": 22,
 "title": "\u676d\u57ce\u7279\u8272\u9910\u5385\u63a8\u8350",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/02\/4ed70a7e2070756f2ec0eb92ab9a625a.jpg!320",
 "width": 0,
 "height": 0
 },
 "desc": "\u4e16\u754c\u4e4b\u5927\uff0c\u65e0\u5947\u4e0d\u6709\uff0c\u4e3a\u6c42\u65b0\u7acb\u5f02\u7684\u4f60\u641c\u7f57\u4e86\u676d\u5dde\u4e94\u5bb6\u7279\u8272\u9910\u5385\uff0c\u5feb\u6765\u627e\u627e\u4f60\u7684\u559c\u6b22\u5427\u3002",
 "share_url": "http:\/\/api.yizhong.cccwei.com\/index.php?m=Share&a=shareTopicList&topic_id=22",
 "sub_subjects": []
 }, {
 "id": 18,
 "title": "\u676d\u5dde\u676d\u5e2e\u83dc\u9910\u9986\u63a8\u8350",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/02\/76f7046106131a41d13cf60307d57a60.jpg!320",
 "width": 0,
 "height": 0
 },
 "desc": "\u676d\u5e2e\u83dc\u6e90\u8fdc\u6d41\u957f\uff0c\u662f\u4e2d\u56fd\u516b\u5927\u83dc\u7cfb\u4e4b\u4e00\u6d59\u83dc\u7684\u4e3b\u8981\u6d41\u6d3e\u3002\u6765\u5230\u7f8e\u4e3d\u7684\u676d\u5dde\uff0c\u9664\u4e86\u6e38\u89c8\u4f20\u5947\u7684\u65c5\u6e38\u666f\u70b9\uff0c\u4e5f\u5c11\u4e0d\u4e86\u54c1\u5c1d\u5927\u540d\u9f0e\u9f0e\u7684\u676d\u5e2e\u83dc\u3002",
 "share_url": "http:\/\/api.yizhong.cccwei.com\/index.php?m=Share&a=shareTopicList&topic_id=18",
 "sub_subjects": []
 }]
 },

 */



@end
























