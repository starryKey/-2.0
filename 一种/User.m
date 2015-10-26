//
//  User.m
//  一种
//
//  Created by wol on 15/10/16.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "User.h"

#import "LoginViewController.h"

@implementation User

//创建用户，用户为单例对象,创建单例对象的方法是，类对象每次执行这个方法时，都不会生成新的对象，即返回一个指向已经存在的对象的指针。那么必须把这个对象指针设置成全局的，即在整个生命周期内都可以存活的变量，所以加static，初始赋值nil，只有当nil时才让这个对象指针指向那个对象内存，如果之后再执行这个方法，就不在创建新的内存，而直接返回这个指针。用dispatch_once这个C语言是为了线程安全问题，因为如果两个线程都调用这个方法，那么可能会同时创建两个对象，（因为两个线程可能同时为nil），once方法可以保证代码只执行一次。
+ (User*)shareInstance{
    static User *instance = nil;
    
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [[[self class ]alloc ]init];
    });
    
    return instance;
}

//重写init方法
- (instancetype)init{
    if (self = [super init]) {
        //设置默认昵称和头像,初始为未登录状态
        self.userName = @"未登录";
        
        self.userImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar-placeholder@2x"]];
        self.isLogined = NO;
        //获取本地已经储存的用户资料
        NSDictionary *saveUserDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"saveUserDic"];
        if (saveUserDic) {
            self.userName = saveUserDic[@"userName"];
            self.userImage = saveUserDic[@"userImage"];
        }
    }
    return self;
}

- (BOOL)isLogin{
    return self.isLogined;
}

- (void)goToLoginWithController:(UIViewController *)pController{
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [pController presentViewController:loginVC animated:YES completion:nil];
    
    
}

- (void)loginOut{
    //退出后还原头像和昵称
   // self.userName = @"未登录";
   // self.userImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar-placeholder@2x"]];
}


@end
