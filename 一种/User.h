//
//  User.h
//  一种
//
//  Created by wol on 15/10/16.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TencentOpenAPI/TencentOAuth.h"

@interface User : NSObject

@property(nonatomic,copy)NSString *userName;
@property(nonatomic,strong)UIImageView *userImage;
@property(nonatomic,strong)UIViewController *presentViewController;
@property(nonatomic,strong)TencentOAuth *tenCentOAuth;

@property(nonatomic,assign)BOOL isLogined;
//单例
+ (User*)shareInstance;

//判断是否登录
- (BOOL)isLogin;
//手动修改用户资料
- (void)setUserMessageWith:(NSDictionary *)pDic;
//登录
- (void)goToLoginWithController:(UIViewController *)pController;
//登出
- (void)loginOut;

@end
