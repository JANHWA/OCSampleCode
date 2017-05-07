//
//  JHTestTableView.m
//  Cell_Height
//
//  Created by Justin on 2017/5/6.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHTestTableView.h"
#import "Masonry.h"

@implementation JHTestTableView

- (void)layoutView:(UIView *)view {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).insets(UIEdgeInsetsMake(0, 0, 200, 0));
    }];
}

@end
