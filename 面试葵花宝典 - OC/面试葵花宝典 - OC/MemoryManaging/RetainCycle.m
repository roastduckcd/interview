//
//  RetainCycle.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/14.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RetainCycle.h"

@interface RetainCycle ()

@property (nonatomic, strong) NSTimer *timer;


@end

@implementation RetainCycle


/**
 没有形成循环引用？
 */
- (void)createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showMsg:) userInfo:@"passing" repeats:NO];
    [self.timer fire];
}

- (void)showMsg:(id)info {
    NSLog(@"%@", info);
}

@end
