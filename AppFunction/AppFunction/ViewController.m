//
//  ViewController.m
//  AppFunction
//
//  Created by yang song on 2018/7/3.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "ViewController.h"
#import "IBManager.h"
#import "NSObject+GeneralConroller.h"

#import "RDTableViewDelegate.h"
#import "RDTableViewDatasource.h"

#import "RDNetworkManager.h"
#import "FunctionMenu.h"


#define TopMargin (self.view.safeAreaInsets.top)
#define SelfURL (@"https://api.androidhive.info/volley/person_object.json")

@interface ViewController ()

@property (nonatomic, strong) UITableView *functionTable;
@property (nonatomic, strong) RDTableViewDelegate *tableDelegate;
@property (nonatomic, strong) RDTableViewDatasource *tableDatasource;
@property (nonatomic, strong) FunctionMenu *menu;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (@available(iOS 11.0, *)) {
        self.functionTable = [[UITableView alloc] initWithFrame:CGRectMake(0, TopMargin, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    } else {
            // Fallback on earlier versions
    }
    self.functionTable.separatorColor = [UIColor purpleColor];

    self.tableDelegate = [[RDTableViewDelegate alloc] init];
    self.functionTable.delegate = self.tableDelegate;
    __weak typeof(self) weakSelf = self;
    // self -> tableDelegate -> ActionBlock
    [self.tableDelegate addActionWhenSelected:^(NSIndexPath *indexPath) {
        [weakSelf selectedAt:indexPath];
    }];

    self.tableDatasource = [[RDTableViewDatasource alloc] init];
    self.functionTable.dataSource = self.tableDatasource;

    [self.view addSubview:self.functionTable];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [RDNetworkManager GetByUrl:SelfURL completionHandler:^(id result) {
        self.menu = [[FunctionMenu alloc] initWithData:result];
        self.tableDatasource.dataArr = self.menu.functionNames;
        [self.functionTable reloadData];
    }];
}


- (void)selectedAt:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0: {
            id flowVC = [IBManager instanceViewControllerWithNibName:@"FlowViewController.xib"];
            [self.thisController.navigationController pushViewController:flowVC animated:YES];
            break;
        }
        case 1: {
            id scrollVC = [IBManager instanceViewControllerWithNibName:@"RDImageScrollViewController"];
            [self.thisController.navigationController pushViewController:scrollVC animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
