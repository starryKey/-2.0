//
//  MyHeadView.m
//  一种
//
//  Created by wol on 15/10/1.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "MyHeadView.h"
#import "Common.h"
#import "LoginViewController.h"
#import "UIView+UIViewController.h"

#import "User.h"
@implementation MyHeadView
{
    UIImageView *_imageView;
  //  UIButton *_headButton;
  //  UILabel *_loginLabel;
    
    User *_user;
}
- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self _createView];
    }
    return self;
}

- (void)awakeFromNib{
    [self _createView];

}
#pragma mark - 创建头视图
- (void)_createView{
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth,200)];
    _imageView.image = [UIImage imageNamed:@"mybg.jpg"];
    _imageView.userInteractionEnabled = YES;
    [self addSubview:_imageView];
    

    _headButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/2-30-5,200/2-30 , 60, 60)];
    [_headButton setBackgroundImage:[UIImage imageNamed:@"naer.jpg"] forState:UIControlStateNormal];
    [_imageView addSubview:_headButton];
    //设置button圆角
    [_headButton.layer setMasksToBounds:YES];
    [_headButton.layer setCornerRadius:30.0];
    _headButton.layer.shadowColor = [UIColor grayColor].CGColor;
    //添加点击事件
    [_headButton addTarget:self action:@selector(headButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    _loginLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-30, 200/2+30, 100, 60)];
    _loginLabel.text = @"登陆/注册";
    _loginLabel.font = [UIFont systemFontOfSize:15];
    [_imageView addSubview:_loginLabel];
    
}

- (void)headButtonAction{

    NSLog(@"点击了登陆头像");
    LoginViewController *login = [[LoginViewController alloc]init];
    [self.viewController.navigationController pushViewController:login animated:YES];

    
}



@end
