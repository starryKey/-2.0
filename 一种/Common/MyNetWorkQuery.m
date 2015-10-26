//
//  MyNetWorkQuery.m
//  天气预报
//
//  Created by kangkathy on 15/8/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MyNetWorkQuery.h"


@implementation MyNetWorkQuery

+ (void)requestData:(NSString *)urlString HTTPMethod:(NSString *)method params:(NSMutableDictionary *)params completionHandle:(void (^)(id))completionblock errorHandle:(void (^)(NSError *))errorblock{
    
    //1.拼接URL
   
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    //2.创建网络请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 60;
    request.HTTPMethod = method;
    
    
    //5.发送异步网络请求
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError) {
            //出现错误时回调block
            errorblock(connectionError);
            
            return;
        }
        
        if (data) {
            
            //解析JSON
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
//            //把JSON解析后的数据返回给调用者,回调block
             completionblock(jsonDic);
          
            
        }
        
        
    
        
    }];
    

    
    
    
    
    
}

@end
