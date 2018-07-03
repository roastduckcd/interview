//
//  NSObject+GeneralConroller.h
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (GeneralConroller)

#pragma mark - Ui property
/** 最上层控制器 */
@property (nonatomic, strong, readonly) UIViewController *thisController;

@end
