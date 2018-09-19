//
//  NSObject+Properties.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/8/20.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "NSObject+Properties.h"
#import <objc/message.h>

static const char *name_key = "name";
static const char *age_key = "age";

@implementation NSObject (Properties)

- (NSString *)name {
    return objc_getAssociatedObject(self, name_key);
}
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, name_key, name, OBJC_ASSOCIATION_RETAIN);
}

- (NSInteger)age {
    return [objc_getAssociatedObject(self, age_key) integerValue];
}
- (void)setAge:(NSInteger)age {
    objc_setAssociatedObject(self, age_key, @(age), OBJC_ASSOCIATION_ASSIGN);
}

@end
