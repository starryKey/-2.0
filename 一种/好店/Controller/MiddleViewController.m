//
//  MiddleViewController.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "MiddleViewController.h"
#import "Common.h"
@interface MiddleViewController ()
{
    
    UIWebView *_web;
    NSString *_urlString;
}
@end

@implementation MiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"专题列表";
    _web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth ,kScreenHeight)];
    [self.view addSubview:_web];
    //通过网址来加载网络请求
    NSURLRequest *request = [[NSURLRequest   alloc]initWithURL:[NSURL URLWithString:self.shareUrlString]];
    [_web loadRequest:request];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
