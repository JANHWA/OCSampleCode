//
//  JHFriendsTableView.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHFriendsTableView.h"
#import "JHSectionHeaderView.h"

@implementation JHFriendsTableView

#pragma mark - lazy Method

#pragma mark - initial Method

#pragma mark - private Method
- (void)setTitleArray:(NSMutableArray *)titleArray {
    _titleArray = [NSMutableArray arrayWithArray:titleArray];
}

#pragma mark - public Method

#pragma mark - protocol Method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.dataArray[section];
    if ([self.titleArray[section] boolValue]) {
        return array.count;
    }
    else {
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    __weak typeof(self) weakSelf = self;
    JHSectionHeaderView *headerView = [[JHSectionHeaderView alloc] init];
    headerView.backgroundColor = [UIColor cyanColor];
    [headerView showHeaderViewTitle:[NSString stringWithFormat:@"第%ld组",section]];
    [headerView selectHeaderViewBlock:^(UIButton *sender) {
        
        weakSelf.titleArray[section] = [weakSelf.titleArray[section] isEqual:@0]?@1:@0;
        NSIndexSet *set = [NSIndexSet indexSetWithIndex:section];
        [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    }];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
