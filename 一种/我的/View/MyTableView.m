//
//  MyTableView.m
//  一种
//
//  Created by wol on 15/10/1.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "MyTableView.h"
#import "MyHeadView.h"
#import "Common.h"
#import "MyCell.h"
#import "SetViewController.h"
#import "UIView+UIViewController.h"
@implementation MyTableView
{
    MyHeadView *_headView;
    NSArray *_imageArray;
    NSArray *_labelArray;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{

    self = [super initWithFrame:frame style:style];
    if (self ) {
        [self _createView];
    }
    return self;
}

- (void)awakeFromNib{

    [self _createView];
    
}
#pragma mark - 创建视图
- (void)_createView{
    self.delegate = self;
    self.dataSource = self;
    _headView = [[MyHeadView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, 200)];
    [self addSubview:_headView];
    _imageArray = [[NSArray alloc]init];
    _imageArray = @[@"Comment@2x.png",@"more_fav@2x.png",@"Profile@2x.png"];
    _labelArray = [[NSArray alloc]init];
    _labelArray = @[@"我的评论",@"我的收藏",@"发个便签"];
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"MyCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"myCell"];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
      return 200;
    }
    return 5;
    
}
 
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return _headView;
    }
    return nil;

}
#pragma mark - dataSourceDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (indexPath.section == 0) {
        cell.myImage.image = [UIImage imageNamed:_imageArray[indexPath.row]];
        cell.myLabel.text = _labelArray[indexPath.row];
    }
    if (indexPath.section ==1) {
        cell.myImage.image = [UIImage imageNamed:@"more_set@2x.png"];
        cell.myLabel.text = @"设置";

    }
    return cell;

}

- (void)tableView:(UITableView *)tableView  didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
       SetViewController *setVC = [[SetViewController alloc]init];
       [self.viewController.navigationController pushViewController :setVC animated:YES];

    }

}



@end
