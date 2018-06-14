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

    NSArray *files = [manager contentsOfDirectoryAtPath:temp error:&err];


    BOOL isDir;
    for (NSString *filename in files) {
        NSString *filepath = [temp stringByAppendingPathComponent:filename];
        BOOL isExist = [manager fileExistsAtPath:filepath isDirectory:&isDir];
        // 需要是绝对路径
        if (isExist) {
            BOOL isSus = [manager removeItemAtPath:filepath error:&err];
            if (isSus) {
                NSLog(@"++==++remove successfully");
            }else {
                NSLog(@"++==++%@", err.userInfo);
            }
        }else {
            NSLog(@"no such file");
        }
    }
}


@end
