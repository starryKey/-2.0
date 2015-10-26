//
//  AppDelegate.m
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "AppDelegate.h"
#import "User.h"
#import "Common.h"
#import "UIImageView+WebCache.h"

#import "MyHeadView.h"
@interface AppDelegate ()<TencentSessionDelegate>
{
    User *_user;
}
@end
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //登录用户对象
    _user = [User shareInstance];
    //腾讯授权对象
    self.tencentOAuth =  [[TencentOAuth alloc]initWithAppId:kTencentAppID andDelegate:self];
    //读取本地已经存储的登录信息
    [self readAuthDataFromDefaults];
    //获取帐号基本信息,先创建观察者等待接收数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UserSetInfo:) name:kTencentUserInfor object:nil];
    
    //如果登录状态仍有效，则用户处于登录状态,进行用户的初始化
    if ([self.tencentOAuth isSessionValid]) {
        //若有效，则处于登录状态
        _user.isLogined = YES;
        //获取数据，异步。获取数据完毕后发送通知。
        [self.tencentOAuth getUserInfo];
        
    }

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma  mark - Tencent

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{


    return [TencentOAuth HandleOpenURL:url];
}

- (void)getUserInfoResponse:(APIResponse *)response{

}

//登陆成功
- (void)tencentDidLogin{
    NSLog(@"登陆成功！");
    MyHeadView *headView = [[MyHeadView alloc]init];
    headView.loginLabel.text = @"在线";
    [headView.headButton setBackgroundImage:[UIImage imageNamed:@"naer.jpg"] forState:UIControlStateNormal];
    [self reloadInputViews];
  //  UIImageView *_imageView;
  //  UIButton *_headButton;

}
//登出
- (void)tencentDidLogout{
    NSLog(@"登出");

}

-(void)tencentDidNotNetWork{
    NSLog(@"没有网络");

}
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    NSLog(@"没有登陆");
    
}


#pragma  mark 本地操作

- (void)readAuthDataFromDefaults{
    //读取登陆认证信息，包括帐号密码以及令牌
    TencentOAuth *tOAuth = self.tencentOAuth;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *tenCentInfo = [defaults objectForKey:@"TecentAuthData"];
    if ([tenCentInfo objectForKey:@"AccessTokenKey"] && [tenCentInfo objectForKey:@"ExpirationDateKey"] && [tenCentInfo objectForKey:@"openID"])
    {
        tOAuth.accessToken = [tenCentInfo objectForKey:@"AccessTokenKey"];
        tOAuth.expirationDate = [tenCentInfo objectForKey:@"ExpirationDateKey"];
        tOAuth.openId = [tenCentInfo objectForKey:@"openID"];
        NSLog(@"本地登录信息读取成功");
    }
}

- (void)saveAuthDataToDefaults{
    //保存登录认证信息，包括帐号密码以及令牌
    TencentOAuth *tOAuth = self.tencentOAuth;
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              tOAuth.accessToken, @"AccessTokenKey",
                              tOAuth.expirationDate, @"ExpirationDateKey",
                              tOAuth.openId, @"openID",
                              nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"TecentAuthData"];
    //同步保存
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)removeAuthDataFromDefaults{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"TecentAuthData"];
}

#pragma mark User类初始操作
-(void)UserSetInfo:(NSNotification *)notification
{
    //返回json格式的数据 需要json解析 得到用户的个人信息
    APIResponse *response = notification.userInfo[kTencentUserInfor];
    NSDictionary *dic = response.jsonResponse;
    //给单例用户设置头像和昵称
    
    if (dic[@"nickname"]) {
        _user.userName = dic[@"nickname"];
    }
    if (dic[@"figureurl_qq_2"]) {
        [_user.userImage sd_setImageWithURL:dic[@"figureurl_qq_2"]];
    }

}

@end
