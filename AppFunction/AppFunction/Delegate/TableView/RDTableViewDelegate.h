//
//  RDTableViewDelegate.h
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RDTableViewDelegate : NSObject < UITableViewDelegate >
/** 接收数据 */
@property (nonatomic, strong) NSArray *dataArr;


/**
 选中单元格后触发的事件

 @param actionBlock 利用block传递事件
 */
- (void)addActionWhenSelected:(void (^)(NSIndexPath *indexPath))actionBlock;
@end
