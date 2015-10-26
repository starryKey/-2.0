//
//  ExpViewController.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "ExpViewController.h"
#import "ExpTableView.h"
#import "ExpModel.h"
#import "Common.h"
@interface ExpViewController ()
{
    ExpTableView *_expTableView;
    
    NSArray *_array;
    NSMutableData *_receivedData;
    NSMutableArray *array;
    NSMutableArray *_subScenceArray;

}
@end

@implementation ExpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
    
    self.title = @"体验";
   
    _expTableView = [[ExpTableView alloc]initWithFrame:CGRectMake(0, 64,kScreenWidth , kScreenHeight)  style:UITableViewStylePlain];
    [self.view addSubview:_expTableView];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}







@end
