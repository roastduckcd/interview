//
//  HowToUseBlock.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/28.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "HowToUseBlock.h"

@interface HowToUseBlock ()
@property (nonatomic, strong) NSMutableString *roleName;

@end

@implementation HowToUseBlock

- (void)argumentBlock:(void (^)(NSString *))block {
    block(@"绝代剑宿");
    self.roleName = [@"" mutableCopy];
}

- (HowToUseBlock *(^)(NSString *))appendName {
    return ^(NSString *name) {
        [self.roleName appendString:name];
        NSLog(@"返回值block:%@", self.roleName);
        return self;
    };
}

@end
