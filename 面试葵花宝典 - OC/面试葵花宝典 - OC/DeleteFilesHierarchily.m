//
//  DeleteFilesHierarchily.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "DeleteFilesHierarchily.h"

@implementation DeleteFilesHierarchily

- (void)deleteFilesAtPath:(NSString *)path {

    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    ///
    NSError *err = nil;
    NSString *temp = paths.firstObject;
    path = [temp substringToIndex:temp.length - 10];

    NSArray *files = [manager contentsOfDirectoryAtPath:temp error:&err];


    BOOL isDir;
    for (NSString *path in files) {

        BOOL isExist = [manager fileExistsAtPath:path isDirectory:&isDir];
        // 需要是绝对路径
        BOOL isSus = [manager removeItemAtPath:path error:&err];
        NSLog(@"++==++%@", err.userInfo);
    }
}


@end
