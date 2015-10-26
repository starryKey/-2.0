//
//  SelectCityViewController.m
//  一种
//
//  Created by wol on 15/10/3.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "SelectCityViewController.h"
#import "StroeViewController.h"
@interface SelectCityViewController ()
{
    StroeViewController  *_stroeVC;
}
@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"城市列表";
    _stroeVC = [[StroeViewController alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)_pushAction{

   [ self.navigationController pushViewController:_stroeVC  animated:YES];
}


- (IBAction)bjingButton:(UIButton *)sender {
    //_stroeVC.navigationItem.leftBarButtonItem.title = @"北京";
    [self _pushAction];
}

- (IBAction)shaiButton:(UIButton *)sender {
    //_stroeVC.navigationItem.leftBarButtonItem.title = @"上海";
    [self _pushAction];
}

- (IBAction)gzhouButton:(UIButton *)sender {
   
    [self _pushAction];
}

- (IBAction)xmenButton:(id)sender {
    
    [self _pushAction];
}

- (IBAction)cduButton:(id)sender {
    [self _pushAction];
}

- (IBAction)hzhouButton:(id)sender {
    [self _pushAction];
}

- (IBAction)szhenButton:(id)sender {
    [self _pushAction];
}
@end
