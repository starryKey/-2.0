//
//  LoginViewController.m
//  一种
//
//  Created by wol on 15/10/16.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "LoginViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "AppDelegate.h"
#import "User.h"
#import "UIImageView+WebCache.h"
#import "MyViewController.h"

@interface LoginViewController ()
{
    User *_user;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (IBAction)closeButtonAction:(id)sender {
    NSLog(@"点击了关闭按钮");
    //self.hidesBottomBarWhenPushed = YES;

   // [self dismissViewControllerAnimated:YES completion:nil];
    //MyViewController  *myView = [[MyViewController alloc] init];
    //[self.navigationController pushViewController:myView animated:YES];
    //[self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    

}

- (IBAction)QQLoginButtonAction:(id)sender {
    
    //获取tencentOauth
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    TencentOAuth *tencentOAuth = appDelegate.tencentOAuth;
    //授权信息 不要太多 否则用户会觉得烦
    NSArray* permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_INFO,
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                            kOPEN_PERMISSION_ADD_ALBUM,
                            kOPEN_PERMISSION_ADD_IDOL,
                            nil];
    
    
    //网路请求
    [tencentOAuth authorize:permissions];
    //关闭登录界面
    [self dismissViewControllerAnimated:NO completion:nil];
        

}

@end
