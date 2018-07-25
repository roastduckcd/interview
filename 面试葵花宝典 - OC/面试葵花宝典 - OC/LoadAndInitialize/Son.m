//
//  Son.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/7/25.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "Son.h"

@implementation Son

+ (void)load {
    NSLog(@"子类load了");
}

+ (void)initialize {
    NSLog(@"子类lize");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
