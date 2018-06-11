//
//  ViewController.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "ViewController.h"
#import "DeleteFilesHierarchily.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DeleteFilesHierarchily *dd = [[DeleteFilesHierarchily alloc] init];
    [dd deleteFilesAtPath:@""];

}


@end
