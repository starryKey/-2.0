//
//  HeadView.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "HeadView.h"
#import "Common.h"
#import "HeadCell.h"
#import "MyNetWorkQuery.h"
#import "MainShopModel.h"
#import "UIView+UIViewController.h"
#import "HeadViewController.h"
@implementation HeadView
{
    UICollectionView *_collectionView;
    NSMutableArray *array;
    NSMutableData *_receivedData;
}
- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout  alloc]init];
    //最小水平间隙
    flowLayout.minimumInteritemSpacing = 10;
    //最小竖直间隙
    flowLayout.minimumLineSpacing = 10;
    //单元格的大小
    flowLayout.itemSize = CGSizeMake((kScreenWidth - 10)/2, 100);
    _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 320) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    //从xib文件创建单元格时的注册方法
    UINib *nib = [UINib nibWithNibName:@"HeadCell" bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];

}

#pragma mark - <UICollectionViewDataSource,UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HeadCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.shopModel = array[indexPath.row];
    return cell;
}

#pragma mark - 读取数据
- (void)_loadData{
    NSString *urlString = @"http://api.yizhong.cccwei.com/api.php?srv=2008&cid=276405&uid=3625&tms=20150926112444&sig=a8eabfd912da969e&wssig=fe2067841ea31997&os_type=3&version=6&city_id=6";
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

    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:nil];
    array =  [[NSMutableArray alloc]init];
    NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
    for (NSDictionary *dic in dataDic[@"categories"]) {
        MainShopModel *shopModel = [[MainShopModel alloc]initWithDataDic:dic];
        [array addObject:shopModel];
        
    }
    //加载collectionView
    [_collectionView reloadData];
    
}

#pragma mark - 单元格被点击后调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array1 = @[@"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150925105424&sig=1a04f0c01bffbe5e&wssig=7c5733cb89e7219c&os_type=3&version=6&city_id=6&cate_id=1&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20",@"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150928163308&sig=de7482102e285fbb&wssig=e0c5daaae5218766&os_type=3&version=6&city_id=6&cate_id=2&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20",@"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150928163340&sig=75e9bc6b287aa435&wssig=e2605e9c0e29fa24&os_type=3&version=6&city_id=6&cate_id=3&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20",@"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150928163343&sig=655be884dae34bc4&wssig=f7f78d351d0ca3a5&os_type=3&version=6&city_id=6&cate_id=4&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20",@"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150928163346&sig=dcb07b7fc4be8d40&wssig=9e0f9b2c04721e93&os_type=3&version=6&city_id=6&cate_id=5&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20",@"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150928163348&sig=4ef970107f0948c4&wssig=02aa3f0ffebcf92f&os_type=3&version=6&city_id=6&cate_id=6&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20"];
    HeadViewController *headVC = [[HeadViewController alloc]init];
    [self.viewController.navigationController pushViewController:headVC animated:YES];
    
    if (indexPath.row == 0) {
        headVC.url = array1[0];
        headVC.title = @"美食";
    }else if (indexPath.row == 1){
    
        headVC.url = array1[1];
        headVC.title = @"咖啡厅";
    } else if (indexPath.row == 2){
    
        headVC.url = array1[2];
        headVC.title = @"书店";
    }else if (indexPath.row == 3){
    
        headVC.url = array1[3];
        headVC.title = @"酒吧";
    }else if (indexPath.row == 4){
    
        headVC.url = array1[4];
        headVC.title = @"健体塑性";
    }else {
    
        headVC.url = array1[5];
        headVC.title = @"休闲娱乐";
    }
    
}


@end
/*
 "data": {
 "categories": [{
 "id": 1,
 "title": "\u7f8e\u98df",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/e06e6917a4c6696c7f28abb303e03644.png",
 "width": "292",
 "height": "160"
 }
 }, {
 "id": 2,
 "title": "\u5496\u5561\u5385",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/afa371e8ed8e6eb23e17f006f05d51e9.png",
 "width": "292",
 "height": "160"
 }
 }, {
 "id": 3,
 "title": "\u4e66\u5e97",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/8909a9d4cdb2a9c99f8d81b4df1d326b.png",
 "width": "292",
 "height": "160"
 }
 }, {
 "id": 4,
 "title": "\u9152\u5427",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/f024d5ead3ed9fb98118c8211ed99986.png",
 "width": "292",
 "height": "160"
 }
 }, {
 "id": 5,
 "title": "\u5065\u4f53\u5851\u578b",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/04010bbb4cc3f4983c25e1942bae55fe.png",
 "width": "292",
 "height": "160"
 }
 }, {
 "id": 6,
 "title": "\u4f11\u95f2\u5a31\u4e50",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/07\/04ff62248a024f58e5e061aace8f8ec0.png",
 "width": "292",
 "height": "160"
 }
 }],
 

 */























