//
//  GoodViewController.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "GoodViewController.h"
#import "GoodsTableView.h"
#import "Common.h"
@interface GoodViewController ()
{
    GoodsTableView *_goodsTableView;
}
@end

@implementation GoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好物";
    _goodsTableView = [[GoodsTableView alloc]initWithFrame:CGRectMake(0, 64,kScreenWidth , kScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_goodsTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
