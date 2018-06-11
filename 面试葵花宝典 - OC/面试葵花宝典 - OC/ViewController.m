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

@property (nonatomic, strong) UIButton *strongBtn;
@property (nonatomic, weak) UIButton *weakBtn;
@property (weak, nonatomic) IBOutlet UIButton *ibBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

/**
 为什么iboutlet属性可以使用weak修饰
 因为subview在加入view时已经被持有了
 */
- (void)checkIBOutletView {
    _strongBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _strongBtn.backgroundColor = [UIColor redColor];
    _strongBtn.tag = 100;
    [self.view addSubview:_strongBtn];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    _weakBtn = button;
    _weakBtn.backgroundColor = [UIColor purpleColor];
    _weakBtn.tag = 200;
        // 加入到view时，自动被view所持有，所以即使weak修饰也不会在方法后释放
        // 测试时发现控件引用计数器会+2，无论ib或xib
    [self.view addSubview:_weakBtn];

    [_strongBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [_weakBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)changeColor:(UIButton *)sender {
    if (sender.isSelected) {
        _weakBtn.backgroundColor = [UIColor redColor];
        _strongBtn.backgroundColor = [UIColor purpleColor];
    }else {
        _weakBtn.backgroundColor = [UIColor purpleColor];
        _strongBtn.backgroundColor = [UIColor redColor];
    }
    sender.selected = !sender.isSelected;
}


@end
