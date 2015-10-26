//
//  SetTableView.m
//  一种
//
//  Created by wol on 15/10/2.
//  Copyright (c) 2015年 wol. All rights reserved.
//

#import "SetTableView.h"
#import "SetCell.h"
@implementation SetTableView
{
    SetCell *_cell;
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
    //注册单元格
    UINib *nib = [UINib nibWithNibName:@"SetCell" bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:@"setCell"];
    
    long long fileSize = [self countFileSize];
    NSLog(@"文件的大小:%lld",fileSize);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 2;
    }
    return  1;
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 5;
}
/*
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self clearAction];
            long long fileSize = [self countFileSize];
            _cell.contentLabel.text = [NSString stringWithFormat:@"%.2fMB", (CGFloat)fileSize / 1024 / 1024];
        }
    }
}

*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [tableView dequeueReusableCellWithIdentifier:@"setCell"];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
        _cell.setLabel.text = @"清除缓存";
        //_cell.contentLabel.text = @"0.0KB";
        //_cell.contentLabel.tag = 101;
        long long fileSize = [self countFileSize];
        _cell.contentLabel.text = [NSString stringWithFormat:@"%.2fMB", (CGFloat)fileSize / 1024 / 1024];
       // [self performSelector:@selector(countFileSize) withObject:nil afterDelay:1];
}
        else if (indexPath.row == 1){
    
        _cell.setLabel.text = @"检查新版本";
        _cell.contentLabel.text = @"当前版本：v2.01";
    }
}
    else if(indexPath.section == 1){
    
        _cell.setLabel.text = @"关于";
        _cell.contentLabel.hidden = YES;
    }
    
    
    return _cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"清除缓存吗？"delegate:nil cancelButtonTitle:@"取消"otherButtonTitles:@"确定", nil];
//            [alert show];
            
          [self clearAction];
            NSLog(@"选中了单元格");
            long long fileSize = [self countFileSize];
            NSLog(@"文件的大小:%lld",fileSize);
            _cell.contentLabel.text = [NSString stringWithFormat:@"%.2fMB", (CGFloat)fileSize / 1024 / 1024];
            
            [self reloadData];
        }
        
    }
   

}

- (long long)countFileSize{
    NSString *homePath = NSHomeDirectory();
    NSArray *subFilePath = @[@"/Library/Caches/-056838379-qq.com.--/fsCachedData/",@"/Library/Caches/default/com.hackemist.SDWebImageCache.default/"];
    long long fileSize = 0;
    for (NSString *filePath in subFilePath)
    {
        // 获取SDWebImage的缓存文件夹路径
        NSString *subFile = [homePath stringByAppendingPathComponent:filePath];
        // 创建一个文件管理器  单例
        NSFileManager *fileManager = [NSFileManager defaultManager]; // 文件管理器
        
        // 获取某个路径下所有文件的文件名
        NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:subFile error:nil];
        // 遍历文件夹
        for (NSString *fileName in fileNames)
        {
            // 拼接文件路径
            NSString *file = [subFile stringByAppendingPathComponent:fileName];
            // 根据文件路径 获取文件的相关信息
            NSDictionary *dic =[fileManager attributesOfItemAtPath:file error:nil];
            fileSize += [dic[NSFileSize] longLongValue];
        }
    }
    return fileSize;
}


- (void)clearAction{
    
    // 内存清理
    NSString *homePath = NSHomeDirectory();
    NSLog(@"沙盒路径:%@",homePath);
    NSArray *subFilePath = @[@"/Library/Caches/-056838379-qq.com.--/fsCachedData/",@"/Library/Caches/default/com.hackemist.SDWebImageCache.default/"];
    for (NSString *filePath in subFilePath) {
        
        // 获取SDWebImage的缓存文件夹路径
        NSString *subFile = [homePath stringByAppendingPathComponent:filePath];
        // 创建一个文件管理器  单例
        NSFileManager *fileManager = [NSFileManager defaultManager]; // 文件管理器
        
        // 获取某个路径下所有文件的文件名
        NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:subFile error:nil];
        // 遍历文件夹
        for (NSString *fileName in fileNames)
        {
            // 拼接文件路径
            NSString *file = [subFile stringByAppendingPathComponent:fileName];
            // 删除文件
            [fileManager removeItemAtPath:file error:nil];
        }
        
        
    }
    

}


@end
