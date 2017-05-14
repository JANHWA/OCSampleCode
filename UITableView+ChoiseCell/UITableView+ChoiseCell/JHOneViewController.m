//
//  JHOneViewController.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHOneViewController.h"
#import "JHChoiceTableView.h"
#import "JHChoiceTableViewCell.h"
#import "Masonry.h"
#import "JHChoiceModel.h"

#define CELLID @"cellID"

@interface JHOneViewController ()

@property (strong, nonatomic) JHChoiceTableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;


@end

@implementation JHOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
    [self createData];
}

#pragma mark - lazy Method

#pragma mark - initial Method
- (void)initView {
    __weak typeof(self) weakSelf = self;
    self.tableView = [[JHChoiceTableView alloc] initInView:self.view tableViewStyle:UITableViewStylePlain cellForRow:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        
        JHChoiceTableViewCell *cell = [JHChoiceTableViewCell showContentWithTableView:tableView
                                                                            indexPath:indexPath
                                                                           identifier:CELLID
                                                                           titleArray:weakSelf.dataArray];
        
        [cell buttonBlock:^(UIButton *sender) {
            [weakSelf selectItemWithIndexPath:indexPath];
        }];
        return cell;
    }];
    [self.tableView didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
        [weakSelf selectItemWithIndexPath:indexPath];
    }];
}

#pragma mark - private Method
- (void)createData {
    self.dataArray = [[NSMutableArray alloc] init];
    NSArray *array = @[@[@"所有人",@1],
                       @[@"仅自己",@0],
                       @[@"指定好友",@0]
                       ];
    
    for (NSUInteger i = 0; i < array.count; i++) {
        JHChoiceModel *model = [[JHChoiceModel alloc] init];
        model.title = array[i][0];
        model.state = [array[i][1] intValue];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadWithData:self.dataArray];
}

- (void)selectItemWithIndexPath:(NSIndexPath *)indexPath {
    JHChoiceModel *selectdeModel = self.dataArray[indexPath.row];
    selectdeModel.state = 1;
    for (JHChoiceModel *model in self.dataArray) {
        if (selectdeModel != model) { model.state = 0;}
    }
    [self.tableView reloadWithData:self.dataArray];
    NSLog(@"--------点击第%ld个",indexPath.row);
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
