//
//  Fanshejizhi.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "Fanshejizhi.h"
#import <objc/message.h>


@implementation Fanshejizhi

- (void)usingClassFromString {

    NSLog(@"系统反射机制:%@", NSStringFromSelector(@selector(usingClassFromString)));
    NSLog(@"RD反射机制:%@", RD_NSStringFromSelector(@selector(usingClassFromString)));
}

NSString * RD_NSStringFromSelector(SEL selector){
    const char *sel_str = sel_getName(selector);
    return [NSString stringWithUTF8String:sel_str];
}

@end
