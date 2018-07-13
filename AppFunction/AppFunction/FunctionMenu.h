//
//  FunctionMenu.h
//  AppFunction
//
//  Created by yang song on 2018/7/11.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FunctionMenu : NSObject

@property (nonatomic, copy) NSArray<NSString *> *functionNames;

- (instancetype)initWithData:(id)data;
@end
