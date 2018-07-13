//
//  RDTableViewDelegate.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RDTableViewDelegate.h"

typedef void(^ActionBlock)(NSIndexPath *indexPath);

@interface RDTableViewDelegate ()

@property (nonatomic, copy) ActionBlock selectedBlock;

@end

@implementation RDTableViewDelegate

- (void)addActionWhenSelected:(void (^)(NSIndexPath *indexPath))actionBlock {
    self.selectedBlock = actionBlock;
}

#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    self.selectedBlock(indexPath);
}

@end
