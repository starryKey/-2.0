//
//  FootView.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "FootView.h"
#import "ScenceCell.h"
#import "ShopDetailModel.h"
#import "Common.h"
#import "MiddleViewController.h"
#import "UIView+UIViewController.h"
#import "HeadViewController.h"
@implementation FootView
{
    UICollectionView *_collectionView;
    NSMutableArray *array;
    NSMutableData *_receivedData;
    NSMutableArray *_scenceArray;
    
}
- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //最小水平间距
    flowLayout.minimumInteritemSpacing = 10;
    //最小竖直间距
    flowLayout.minimumLineSpacing = 10;
    //上下左右间距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 10);
    //单元格的大小
    flowLayout.itemSize = CGSizeMake((kScreenWidth - 5) / 3 - 10, 100);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //self.backgroundColor = [UIColor whiteColor];
    _collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:_collectionView];
    
    //从xib文件创建单元格时的注册方法
    UINib *nib = [UINib nibWithNibName:@"ScenceCell" bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"scenceCell"];


}
#pragma mark - <UICollectionViewDataSource,UICollectionViewDelegate>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio
{

    return array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ScenceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"scenceCell" forIndexPath:indexPath];
    cell.mainShopModel = array[indexPath.row];
    
    return cell;

}

// 单元格被点击后调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeadViewController *headVC = [[HeadViewController alloc]init];
    [self.viewController.navigationController pushViewController:headVC animated:YES];

    NSDictionary *dic = _scenceArray[indexPath.row];
    headVC.title = dic[@"title"];
    headVC.url = @"http://api.yizhong.cccwei.com/api.php?srv=2015&cid=276405&uid=3625&tms=20150925105424&sig=1a04f0c01bffbe5e&wssig=7c5733cb89e7219c&os_type=3&version=6&city_id=6&cate_id=1&scene_id=0&sort_type=0&since_id=0&page_num=1&page_size=20";
    
    
}

#pragma mark - 网络请求
- (void)_loadData{
    NSString *urlString = @"http://api.yizhong.cccwei.com/api.php?srv=2008&cid=276405&uid=3625&tms=20150926112444&sig=a8eabfd912da969e&wssig=fe2067841ea31997&os_type=3&version=6&city_id=6";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置请求信息
    //1.请求方式
    request.HTTPMethod = @"GET";
    //2.请求超时时间
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

    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingMutableContainers error:nil];
   // NSLog(@"解析的数据%@",jsonDic);
    array = [[NSMutableArray alloc]init];
    _scenceArray = [[NSMutableArray alloc]init];
    NSDictionary *dataDic = [jsonDic objectForKey:@"data"];
    for (NSDictionary *dic  in dataDic[@"scenes"]) {
        MainShopModel  *shopModel = [[MainShopModel alloc]initWithDataDic:dic];
        [array addObject:shopModel];
        [_scenceArray addObject:dic];
      //  NSLog(@"子视图中的数据:%@",dic);
    }
    [_collectionView reloadData];
    
}

/*
 "scenes": [{
 "id": 1,
 "title": "\u4e00\u4eba\u98df",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/10\/f134e8d00dab3d6c9c4673f1f715ea58.png",
 "width": "158",
 "height": "100"
 }
 }, {
 "id": 2,
 "title": "\u60c5\u4fa3\u665a\u9910",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/10\/41bc50b173b067a173d44d693ed40411.png",
 "width": "158",
 "height": "100"
 }
 }, {
 "id": 3,
 "title": "\u65c5\u884c\u5fc5\u5907",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/09\/10\/8b2c3f9bfc6837f2bc2245f80e82d4d4.png",
 "width": "158",
 "height": "100"
 }
 }, {
 "id": 4,
 "title": "\u6b63\u9910",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/08\/28\/237ea96b275b0156796c93b4c019d4a4.png",
 "width": "158",
 "height": "100"
 }
 }, {
 "id": 5,
 "title": "\u4e0b\u5348\u8336",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/08\/28\/281cf9157fe34939854ed7407107edee.png",
 "width": "158",
 "height": "100"
 }
 }, {
 "id": 6,
 "title": "\u6df1\u591c\u98df\u5802",
 "icon": {
 "url": "http:\/\/img.yizhong.cccwei.com\/yizhong\/yizhongapp\/2015\/08\/28\/db8e487a6653ecf17525c728c2b82163.png",
 "width": "158",
 "height": "100"
 }
 }]

 */














@end
