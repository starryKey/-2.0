//
//  SetViewController.m
//  一种
//
//  Created by wol on 15/10/2.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableView.h"
@interface SetViewController ()
{
    SetTableView *_tableView;
}
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    
    _tableView = [[SetTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
