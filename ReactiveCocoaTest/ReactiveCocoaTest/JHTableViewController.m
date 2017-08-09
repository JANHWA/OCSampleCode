//
//  JHTableViewController.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/9.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "JHTableViewController.h"

@interface JHTableViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;


@end

static NSString *const CellID = @"CellID";

@implementation JHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
}

- (void)createData {
    NSArray *array = @[@"登录",@"调色板",@"通知、回调、KVO"];
    
    [self.dataArray addObjectsFromArray:array];
    [self.tableView reloadData];
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];

    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (indexPath.row) {
        case 0:
        {// 登录页
            ViewController *VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewControllerID"];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 1:
        {// 调色板
            SecondViewController *VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewControllerID"];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 2:
        {// 通知、回调、KVO
            JHThirdViewController *VC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JHThirdViewControllerID"];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
