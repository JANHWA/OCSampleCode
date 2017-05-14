//
//  JHTwoViewController.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHTwoViewController.h"
#import "JHFriendsTableView.h"
#import "JHSectionHeaderView.h"

#define FriendsCellID @"friendsCellID"

@interface JHTwoViewController ()

@property (strong, nonatomic) JHFriendsTableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSMutableArray *titleArray;

@end

@implementation JHTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    [self createData];
}

#pragma mark - lazy Method
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

#pragma mark - initial Method
- (void)initView {
    __weak typeof(self) weakSelf = self;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[JHFriendsTableView alloc] initInView:self.view
                                             tableViewStyle:UITableViewStyleGrouped
                                                 cellForRow:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FriendsCellID forIndexPath:indexPath];
        cell.textLabel.text = weakSelf.dataArray[indexPath.section][indexPath.row];
        return cell;
    }];
    self.tableView.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:FriendsCellID];
}

#pragma mark - private Method

- (void)createData {
    NSArray *contentArray = @[@[@"北京",@"上海",@"广州",@"深圳"],
                              @[@"天津",@"重庆",@"武汉",@"杭州",@"苏州"],
                              @[@"南京",@"成都",@"无锡",@"厦门"]];
    [self.dataArray addObjectsFromArray:contentArray];
    for (NSInteger i = 0; i < contentArray.count; i++) {
        [self.titleArray addObject:@0];
    }
    [self.tableView setTitleArray:self.titleArray];
    [self.tableView reloadWithData:self.dataArray];
}

#pragma mark - public Method

#pragma mark - protocol Method


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
