//
//  ViewController.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "ViewController.h"
#import "HowToUseBlock.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *ibBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    HowToUseBlock *how = [[HowToUseBlock alloc] init];
    how.propertyBlock = ^(NSString *name) {
        NSLog(@"属性block:%@", name);
    };
    how.propertyBlock(@"blady");

    [how argumentBlock:^(NSString *name) {
        NSLog(@"参数block:%@", name);
    }];

    HowToUseBlock * (^myBlock)(NSString *name) = [how appendName];
    myBlock(@"尘外孤标意琦行");

    how.appendName(@"流苏晚晴").appendName(@"剑非道");

    
}


@end
