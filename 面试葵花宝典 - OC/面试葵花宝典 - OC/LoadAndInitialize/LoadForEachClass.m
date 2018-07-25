//
//  LoadForEachClass.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/7/25.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "LoadForEachClass.h"

@implementation LoadForEachClass

+ (void)load {
    NSLog(@"父类load了");
}

+ (void)initialize {
    NSLog(@"父类lize");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
