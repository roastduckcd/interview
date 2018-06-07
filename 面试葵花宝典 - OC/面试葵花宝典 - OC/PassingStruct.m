//
//  PassingStruct.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

struct MyStruct {
    int a;
    int b;
};
typedef struct MyStruct *my_struct;

#import "PassingStruct.h"

@interface MyObject : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) my_struct structure;
@end
@implementation MyObject
- (void)dealloc {
    free(self.structure);
}
@end



@interface PassingStruct ()

@property (nonatomic, strong) MyObject *myObj;

@end

@implementation PassingStruct

- (void)call {
    [self performSelector:@selector(logSomething:) withObject:self.myObj];
}

- (void)logSomething:(MyObject *)obj {
    NSLog(@"将结构体包装到一个对象中来实现传参: %d - %d", obj.structure -> a, obj.structure -> b);
}

- (MyObject *)myObj {
    if (!_myObj) {
        _myObj = [[MyObject alloc] init];
        _myObj.name = @"song";

        my_struct test = (my_struct)(malloc(sizeof(my_struct)));
        test -> a = 10;
        test -> b = 20;
        _myObj.structure = test;
    }
    return _myObj;
}

@end
