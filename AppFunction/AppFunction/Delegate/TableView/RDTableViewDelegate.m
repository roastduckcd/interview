//
//  RDTableViewDelegate.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RDTableViewDelegate.h"
#import "FlowViewController.h"
#import "IBManager.h"
#import "NSObject+GeneralConroller.h"

@implementation RDTableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    FlowViewController *flowVC = [IBManager instanceViewControllerWithNibName:@"FlowViewController"];
    [self.thisController.navigationController pushViewController:flowVC animated:YES];
}

@end
