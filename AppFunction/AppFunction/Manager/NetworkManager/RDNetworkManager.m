//
//  RDNetworkManager.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RDNetworkManager.h"
#import "AFNetworking.h"

@interface RDNetworkManager ()

@end

@implementation RDNetworkManager

+ (void)GetByUrl:(NSString * _Nonnull )urlStr completionHandler:(void (^)(id result))actionBlock {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"下载进度：%@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSError *err;
        if ([responseObject isKindOfClass:[NSData class]]) {
            responseObject = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
            if (err) {
                NSLog(@"json解析出错：%@", err.userInfo);
            }
        }
        if (responseObject) {
            actionBlock(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载出错：%@", error.userInfo);
    }];
}

@end
