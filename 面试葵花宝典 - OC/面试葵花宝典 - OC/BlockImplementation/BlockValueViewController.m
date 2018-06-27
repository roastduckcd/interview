//
//  BlockValueViewController.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/27.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "BlockValueViewController.h"

@interface BlockValueViewController ()

@end

@implementation BlockValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.reverseValueBlock(@"反向传值");
}
- (void)viewDidAppear {
    [super viewDidAppear:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
