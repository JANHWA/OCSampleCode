//
//  ViewController.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/11.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "JHChoiceTableView.h"
#import "JHChoiceTableViewCell.h"
#import "Masonry.h"
#import "JHChoiceModel.h"

#define CELLID @"cellID"

@interface ViewController ()

@property (strong, nonatomic) JHChoiceTableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

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
        
        JHChoiceTableViewCell *cell = [JHChoiceTableViewCell showContentWithTableView:tableView indexPath:indexPath identifier:CELLID titleArray:weakSelf.dataArray];
        
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


@end
