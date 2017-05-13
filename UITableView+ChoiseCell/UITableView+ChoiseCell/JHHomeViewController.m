//
//  JHHomeViewController.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHHomeViewController.h"

#import "JHOneViewController.h"
#import "JHTwoViewController.h"

#import "JHChoiceTableView.h"
#import "JHChoiceTableViewCell.h"
#import "Masonry.h"
#import "JHChoiceModel.h"

#define CELLID @"HomeCellID"

@interface JHHomeViewController ()



@property (strong, nonatomic) JHChoiceTableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation JHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
    [self createData];
   
}

- (void)initView {
    __weak typeof(self) weakSelf = self;
    self.tableView = [[JHChoiceTableView alloc] initInView:self.view tableViewStyle:UITableViewStylePlain cellForRow:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
        cell.textLabel.text = weakSelf.dataArray[indexPath.row];
        return cell;
    }];
    
    [self.tableView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
    [self.tableView didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
        [weakSelf jumpToViewControllerWith:indexPath];
    }];
}
- (void)createData {
    self.dataArray = [NSMutableArray arrayWithObjects:@"权限选择",@"cell的展开闭合", nil];
    [self.tableView reloadWithData:self.dataArray];
}

- (void)jumpToViewControllerWith:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JHOneViewController *oneVC = [[JHOneViewController alloc] init];
        [self.navigationController pushViewController:oneVC animated:YES];
    } else {
        JHTwoViewController *twoVC = [[JHTwoViewController alloc] init];
        [self.navigationController pushViewController:twoVC animated:YES];
    }
    
}

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
