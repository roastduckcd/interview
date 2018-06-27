//
//  BlockRetainCycle.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/27.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "BlockRetainCycle.h"

@interface BlockRetainCycle ()

@property (nonatomic, copy) void(^myBlock)(void);
@property (nonatomic, assign) int age;

@end

@implementation BlockRetainCycle

- (void)blockCycle {
    self.age = 10;

    // 打破循环引用
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^(void) {
        __strong typeof(self) strongSelf = weakSelf;
        // 循环引用
//        NSLog(@"age is %d", self.age);
//        self.age = 20;
//        NSLog(@"age is %d", self.age);
        weakSelf.age = 30;
        NSLog(@"age is %d", weakSelf.age);
        weakSelf.age = 40;
        // 如果有延时或者异步操作，会取不到weakSelf，因为出block就释放了
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"age is %d", weakSelf.age);
//        });
        // 需要在block内部将weakSelf再强引用一下
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"age is %d", strongSelf.age);
        });
    };
    self.myBlock();
}


@end
