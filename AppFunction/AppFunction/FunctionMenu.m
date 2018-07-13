//
//  FunctionMenu.m
//  AppFunction
//
//  Created by yang song on 2018/7/11.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "FunctionMenu.h"

@implementation FunctionMenu

- (instancetype)initWithData:(id)data
{
    self = [super init];
    if (self) {
        [self parseData:data];
    }
    return self;
}

#pragma mark - private
- (void)parseData:(id)data {
    if ([data isKindOfClass:[NSArray class]]) {
        self.functionNames = data;
    }else if ([data isKindOfClass:[NSDictionary class]]) {
        self.functionNames = data[@"menu"];
    }
}

@end
