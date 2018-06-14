//
//  BlockIMP.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/14.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "BlockIMP.h"

typedef NSString *(^MyBlock)(NSString *str);

@interface BlockIMP ()

@end

@implementation BlockIMP

- (void)firstBlock {
    int a = 10;
    void (^block)(void) = ^(void) {
        NSLog(@"first block :: a = %d", a);
    };
    block();            //first block :: a = 10
    a = 20;
    block();            //first block :: a = 10
}

- (void)secondBlock {
    __block int a = 10;
    void (^block)(void) = ^(void) {
        NSLog(@"second block :: a = %d", a);
    };
    block();            //second block :: a = 10
    a = 20;
    block();            //second block :: a = 20
}

- (void)thirdBlock {
    static int a = 10;
    void (^block)(void) = ^(void) {
        NSLog(@"third block :: a = %d", a);
    };
    block();            //third block :: a = 10
    a = 20;
    block();            //third block :: a = 20
}

int a = 10;
- (void)fourthBlock {
    void (^block)(void) = ^(void) {
        NSLog(@"fourth block :: a = %d", a);
    };
    block();            //fourth block :: a = 10
    a = 20;
    block();            //fourth block :: a = 20
}

- (void)fifthBlcok {
    __block int a = 10;
    void (^block)(void) = ^(void) {
        NSLog(@"fifth block :: a = %d", a);
        a = 20;
        NSLog(@"fifth block :: a = %d", a);
    };
    block();            //fifth block :: a = 10
                        //fifth block :: a = 20
    a = 30;
    block();            //fifth block :: a = 30
                        //fifth block :: a = 20
}

@end
