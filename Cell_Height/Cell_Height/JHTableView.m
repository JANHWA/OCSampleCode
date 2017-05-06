//
//  JHTableView.m
//  Cell_Height
//
//  Created by Justin on 2017/5/6.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHTableView.h"
#import "Masonry.h"


@interface JHTableView()

@property (assign, nonatomic) UITableViewStyle style;

/**
 cell的回调，返回cell的对象
 */
@property (copy, nonatomic) CellCalledBlock cellCalled;

/**
 点击cell的回调
 */
@property (copy, nonatomic) didSelectBlock didSelectIndexPath;

@end

@implementation JHTableView

#pragma mark - lazy Method

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_style];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - initial Method

- (instancetype)initInView:(UIView *)view
            tableViewStyle:(UITableViewStyle)style
           CellCalledBlock:(CellCalledBlock)cellCalled
{
    self = [super init];
    if (self) {
        _style = style;
        _cellCalled = cellCalled;
        
        [view addSubview:self.tableView];
        [self layoutView:view];
    }
    return self;
}

#pragma mark - private Method

#pragma mark - public  Method
- (void)didSelectRowAtIndexPath:(didSelectBlock)didSelectIndexPath {
    _didSelectIndexPath = didSelectIndexPath;
}

- (void)layoutView:(UIView *)view {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)reloadWithData:(NSArray *)array {
     __weak typeof(self) weakSelf = self;
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:array];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
    });
}

#pragma mark - protocol Method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = _cellCalled(tableView,indexPath);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_didSelectIndexPath) {
        _didSelectIndexPath(indexPath);
    }
}

@end
