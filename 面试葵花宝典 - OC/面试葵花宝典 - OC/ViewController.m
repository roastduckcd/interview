//
//  ViewController.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/7.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *ibBtn;
@property (nonatomic, assign) NSInteger sec;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
- (IBAction)present:(UIButton *)sender {
    TableViewController *tableVC = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:[NSBundle mainBundle]];
    [self presentViewController:tableVC animated:YES completion:nil];
}



@end
