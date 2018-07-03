//
//  TableViewController.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/6/28.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "TableViewController.h"

#define NormalCellID @"normalCellID"


@interface TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;


@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorColor = [UIColor purpleColor];
//    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:NormalCellID];
    [self.view addSubview:self.table];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:NormalCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];

    return cell;
}


@end
