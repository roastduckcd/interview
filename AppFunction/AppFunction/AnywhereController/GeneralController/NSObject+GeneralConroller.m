//
//  NSObject+GeneralConroller.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "NSObject+GeneralConroller.h"
#import <objc/message.h>

@implementation NSObject (GeneralConroller)

#pragma mark - setter getter lazyloading

/**
 运行时添加属性
 */
- (UIViewController *)thisController {

    UIViewController *tempVC = (UIViewController *)objc_getAssociatedObject(self, @"thisController");
    tempVC = [self fetchCurrentControllerInWindow:nil];
    return tempVC;
}

#pragma mark - Private method
/*
 *  从根控制器开始，由根节点到子节点获取控制器
 *  如果是当前控制器，则无子节点
 */
/**
 从window的根控制器开始遍历，注意可能有不同的window
 默认主窗口

 @param window 需要遍历的window
 */
- (__kindof UIViewController *)fetchCurrentControllerInWindow:(UIWindow *)window {
    if (!window) {
        window = [[UIApplication sharedApplication] keyWindow];
    }

    UIViewController *resultController = [self nextViewControllerForThisContrller:window.rootViewController];
    return resultController;
}
/**
 遍历获取当前控制器modal的控制器，如果为nil，说明是应用最上层控制器
 基于UIKit

 @param thisController 当前遍历到的控制器
 @return 最上层控制器
 */
- (__kindof UIViewController *)nextViewControllerForThisContrller:(UIViewController *)thisController {

    UIViewController *nextViewContrller = nil;
    if ([thisController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *temp = (UITabBarController *)thisController;
        nextViewContrller = temp.selectedViewController;

    }else if ([thisController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *temp = (UINavigationController *)thisController;
        nextViewContrller = temp.topViewController;

    } else {

        nextViewContrller = [thisController presentedViewController];
    }

    if (nextViewContrller) {

        [self nextViewControllerForThisContrller:nextViewContrller];
    }
//TODO: 直接获取navi
    return nextViewContrller;
}

@end
