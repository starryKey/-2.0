//
//  AppDelegate.h
//  一种
//
//  Created by wol on 15/9/28.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TencentOpenAPI/TencentOAuth.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic)TencentOAuth *tencentOAuth;

@end

