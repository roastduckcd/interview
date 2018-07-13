//
//  RDTableViewDatasource.h
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RDTableViewDatasource : NSObject < UITableViewDataSource >
/** 数据源 */
//TODO: 可能是字典或其他对象
@property (nonatomic, strong) NSArray *dataArr;


@end
