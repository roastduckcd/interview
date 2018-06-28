//
//  HowToUseBlock.h
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/28.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HowToUseBlock : NSObject
/** block用作属性 */
@property (nonatomic, copy) void(^propertyBlock)(NSString *name);

/**
 block用作参数
 */
- (void)argumentBlock:(void (^)(NSString *name))block;

/**
 block用作返回值
 如果block的返回值是对象本身，就是链式编程的方式
 */
- (HowToUseBlock * (^)(NSString *name))appendName;
@end
