//
//  RunloopTest.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/12.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RunloopTest.h"

@interface RunloopTest ()

@end


@implementation RunloopTest

- (void)usingRunloop {
    //1. 创建线程，每个线程都对应一个runloop，只是子线程默认未开启runloop
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"current thread = %@", [NSThread currentThread]);
    }];
    //2. 创建runloop
    // 本身是懒加载的
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    //3. 创建timer/source/observer，加入到runloop，保证runloop不会退出
    // NSTimer scheduled···方法会自动开启runloop，就不要再创建。但是alloc创建的timer需要。
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer is = %@", timer);
//    }];
    NSPort *port = [NSPort port];
    //3.1 添加timer到runloop
//    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    [runloop addPort:port forMode:NSDefaultRunLoopMode];

    //4. 执行runloop
    [runloop run];
    //5. 执行线程
    [thread start];
}

@end
