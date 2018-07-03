//
//  ViewController.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "ViewController.h"

#import "RDTableViewDelegate.h"
#import "RDTableViewDatasource.h"

#define TopMargin (self.view.safeAreaInsets.top)
#define SelfURL (http:\/\/appFunction/functionMenu)

@interface ViewController ()

@property (nonatomic, strong) UITableView *functionTable;
@property (nonatomic, strong) RDTableViewDelegate *tableDelegate;
@property (nonatomic, strong) RDTableViewDatasource *tableDatasource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    self.functionTable = [[UITableView alloc] initWithFrame:CGRectMake(0, TopMargin, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    self.functionTable.separatorColor = [UIColor purpleColor];
    self.tableDelegate = [[RDTableViewDelegate alloc] init];
    self.functionTable.delegate = self.tableDelegate;
    self.tableDatasource = [[RDTableViewDatasource alloc] init];
    self.functionTable.dataSource = self.tableDatasource;

    [self.view addSubview:self.functionTable];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


@end
