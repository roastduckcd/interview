//
//  BlockValueViewController.h
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/27.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlockValueViewController : UIViewController

@property (nonatomic, copy) void(^reverseValueBlock)(NSString *name);

@end

NS_ASSUME_NONNULL_END
