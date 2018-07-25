//
//  LoadForEachClass+Test.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/7/25.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "LoadForEachClass+Test.h"

@implementation LoadForEachClass (Test)

+ (void)load {
    NSLog(@"分类load了");
}

+ (void)initialize {
    NSLog(@"分类lize");
}

@end
