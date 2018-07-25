//
//  IBManager.m
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "IBManager.h"

@implementation IBManager

#pragma mark - 从 Storyboard
+ (nonnull __kindof UIViewController *)instanceViewControllerWithStoryboardID:(nonnull NSString *)ID inStoryboard:(NSString *)name {
    return [[IBManager fetchStoryboardWithName:name] instantiateViewControllerWithIdentifier:ID];
}

+ (UIStoryboard *)fetchStoryboardWithName:(nonnull NSString *)name {
    return [UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]];
}

#pragma mark - 从 xib ：xib 和 自定义类 名字必须相同
+ (nonnull __kindof UIViewController *)instanceViewControllerWithNibName:(nonnull NSString *)name {

    if ([name hasSuffix:@".xib"]) {
        name = [name stringByDeletingPathExtension];
    }

    return [[NSClassFromString(name) alloc] initWithNibName:name bundle:[NSBundle mainBundle]];
}

@end
