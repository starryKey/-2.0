//
//  StroeViewController.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "StroeViewController.h"
#import "MyNetWorkQuery.h"
#import "MainShopModel.h"
#import "SelectCityViewController.h"
#import "Common.h"
@interface StroeViewController ()

@end

@implementation StroeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一种";
    _tableView = [[ShopTableView alloc]initWithFrame:CGRectMake(0, 64,kScreenWidth , kScreenHeight)  style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    self.tabBarController.tabBarItem.title = @"好店";
   // [self _loadData];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"杭州" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)leftItemAction{
   // SelectCityViewController *selectVC = [[SelectCityViewController alloc]init];
   // [self.navigationController  pushViewController:selectVC animated:YES];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}




- (void)_loadData{
    //_tableView.hidden = YES;
    
    NSString *urlString = @"http://api.yizhong.cccwei.com/api.php?srv=2008&cid=276405&uid=3625&tms=20150926112444&sig=a8eabfd912da969e&wssig=fe2067841ea31997&os_type=3&version=6&city_id=6";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [MyNetWorkQuery requestData:urlString HTTPMethod:@"GET" params:nil completionHandle:^(id result) {
        
        NSDictionary *dataDic = [result objectForKey:@"data"];
        for (NSDictionary *dic in dataDic[@"categories"]) {
            MainShopModel *shopModel = [[MainShopModel alloc] initWithDataDic:dic];
            [array addObject:shopModel];
            
        }
        // 通过通知传递Block 得到的Array
        [[NSNotificationCenter defaultCenter] postNotificationName:@"array" object:array];
        [_tableView reloadData];
        
    } errorHandle:^(NSError *error) {
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MySetArray:) name:@"array" object:nil];
    
    
}

- (void)MySetArray: (NSNotification *)array{
    
    NSLog(@"%@",array);
}




@end
