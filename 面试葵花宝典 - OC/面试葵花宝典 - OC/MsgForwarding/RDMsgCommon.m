//
//  RDMsgCommon.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/8/13.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RDMsgCommon.h"

@implementation RDMsgCommon

- (void)showMsg:(NSString *)msg {
    NSLog(@"通用消息转发： %@", msg);
}

- (void)callSomething:(NSString *)msg {
    NSLog(@"通用消息转发： %@", msg);
}

- (void)eat {
    NSLog(@"通用消息转发： ");
}

@end
