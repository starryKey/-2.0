//
//  MyNetWorkQuery.h
//  天气预报
//
//  Created by kangkathy on 15/8/28.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNetWorkQuery : NSObject

@property(nonatomic,strong)NSDictionary *dic;

+ (void)requestData:(NSString *)urlString HTTPMethod:(NSString *)method  params:(NSMutableDictionary *)params completionHandle:(void(^)(id result))completionblock errorHandle:(void(^)(NSError *error))errorblock;

@end
