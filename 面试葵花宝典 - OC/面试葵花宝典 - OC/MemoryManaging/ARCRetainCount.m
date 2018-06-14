//
//  ARCRetainCount.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/13.
//  Copyright © 2018 yangsong. All rights reserved.
//
/*
 *  retainCount 的值不用过多关注，因为OC的数据类型对象实例化后的count不一定能得到预期的值
 *  MRC内存管理规则记住：retain 和 release 要成对。
 */

#import "ARCRetainCount.h"
#import <UIKit/UIKit.h>


@interface ARCRetainCount ()

@end

@implementation ARCRetainCount


/**
 不可变数据类型的retainCount数值不为1
 */
- (void)getRetainCountOfImmutable {
    // 可以正常获取到count
    NSString *str = [NSString stringWithFormat:@"hello beauty"];
    NSLog(@"**==**retain count = %@", [str valueForKey:@"retainCount"]);
    // 获取到的count异常  // 18446744073709551615
    NSString *str1 = @"hello beauty";
    NSLog(@"**==**retain count = %@", [str1 valueForKey:@"retainCount"]);


    NSSet *arr = [[NSSet alloc] init];
    [arr retain];
    NSLog(@"**==**retain count = %lu", [arr retainCount]);

    // 非数据类型对象可以看到正常的count
    UIView *view = [[UIView alloc] init];
    NSLog(@"**==**retain count = %lu", [view retainCount]);


    [arr release];
    [arr release];

    [view release];
}

/**
 可变数据类型的retainCount 可以正常得到
 */
- (void)getRetainCountOfMutable {
    NSMutableString *mStr = [NSMutableString stringWithFormat:@"hello kitty"];

    NSLog(@"**==**retain count = %lu", [mStr retainCount]);
}


@end
