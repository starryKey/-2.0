//
//  NextViewController.m
//  一种
//
//  Created by wol on 15/10/1.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "NextViewController.h"
#import "Common.h"
@interface NextViewController ()
{
    UIWebView *_web;
    
    
}
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"网页的链接是%@",self.buyUrl);
    
    _web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth ,kScreenHeight)];
    [self.view addSubview:_web];
    //通过网址来加载网络请求
    NSURLRequest *request = [[NSURLRequest  alloc]initWithURL:[NSURL URLWithString:self.buyUrl]];
    [_web loadRequest:request];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
