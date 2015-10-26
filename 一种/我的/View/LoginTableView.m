//
//  LoginTableView.m
//  一种
//
//  Created by wol on 15/10/3.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "LoginTableView.h"
#import "Common.h"
#import "LoginCell.h"
@implementation LoginTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _createView];
        
    }
    return self;
}
- (void)awakeFromNib{

    [self _createView];
}


- (void)_createView{

    self.delegate = self;
    self.dataSource = self;
    
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"LoginCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"loginCell"];
    self.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 120, kScreenWidth - 40, 30)];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitle:@"立即登录" forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:3];
     button.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:button];


    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loginCell"];
        
        if (indexPath.row == 0) {
            cell.ImgView.image = [UIImage imageNamed:@"naer.jpg"];
            cell.textField.placeholder = @"请输入11位手机号码";
        }
        if (indexPath.row == 1) {
            cell.ImgView.image = [UIImage imageNamed:@"naer.jpg"];
            cell.textField.placeholder = @"请输入6-16位密码";
            
        }

    return cell;
}


@end
