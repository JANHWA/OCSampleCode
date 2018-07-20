//
//  JHSearchSuggestViewController.m
//  JHSearch
//
//  Created by HWA on 2018/7/20.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHSearchSuggestViewController.h"
#import "JHTableViewSctionView.h"

@interface JHSearchSuggestViewController ()

<UISearchBarDelegate,
UITableViewDataSource,
UITableViewDelegate,
JHSuggestTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray     *dataArray;

@end

@implementation JHSearchSuggestViewController

static NSString *const cellID = @"JHSuggestTableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JHSuggestTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    
    NSArray *tags1 = @[@"BMW",@"法拉利",@"兰博基尼",@"Hondasssssssssssss",@"BMW",@"法拉利",@"兰博基尼",@"兰博基尼",@"Hondaddddddddddddddd",@"BMW",@"法拉利",@"兰博基尼",@"兰博基尼"];
    NSArray *tags2 = @[@"BMW",@"法拉利",@"兰博基尼"];
    
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    
    [self.dataArray addObject:tags1];
    [self.dataArray addObject:tags2];
    [self.tableView reloadData];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //    [self.searchBar becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //    [self.searchBar resignFirstResponder];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_scrollViewDidScrollHandler) {
        _scrollViewDidScrollHandler(scrollView);
    }
}

//MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JHSuggestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    [cell showContentWithTags:self.dataArray[indexPath.section] indexPath:indexPath];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    JHTableViewSctionView *sectionView = [[JHTableViewSctionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44.0)];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}


//MARK: - JHSuggestTableViewCellDelegate

- (void)suggestTableViewCell:(JHSuggestTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *searchText = self.dataArray[indexPath.section][indexPath.row];
    if ([self.delegate respondsToSelector:@selector(searchSuggestViewController:suggestTableViewCell:searchText:)]) {
        [self.delegate searchSuggestViewController:self suggestTableViewCell:cell searchText:searchText];
    }
}


//MARK: - Setter & Getter


- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}



@end
