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
    
    self.dataArray = [[NSMutableArray alloc] init];
    [self initView];
    [self createData];
}

#pragma mark - lazy Method

#pragma mark - initial Method
- (void)initView {
    
    self.tableView = [[JHChoiceTableView alloc] initInView:self.view tableViewStyle:UITableViewStylePlain cellForRow:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        JHChoiceTableViewCell *cell = [JHChoiceTableViewCell showContentWithTableView:tableView indexPath:indexPath identifier:CELLID titleArray:self.dataArray];
        [cell buttonBlock:^(UIButton *sender) {
            [self selectItemWithIndexPath:indexPath];
            
        }];
        return cell;
    }];
    
    [self.tableView didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
        NSLog(@"--------点击第%ld个",indexPath.row);
        [self selectItemWithIndexPath:indexPath];
    }];
}

#pragma mark - private Method
- (void)createData {
    
    for (NSUInteger i = 0; i < 3; i++) {
        JHChoiceModel *model = [[JHChoiceModel alloc] init];
        if (i == 0) {
            model.title = @"所有人";
            //            model.state = 1;
        } else if (i == 1) {
            model.title = @"仅自己";
            //            model.state = 0;
        } else {
            model.title = @"指定好友";
        }
        model.state = 0;
        [self.dataArray addObject:model];
    }
    [self.tableView reloadWithData:self.dataArray];
}

- (void)selectItemWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"--------点击第%ld个",indexPath.row);
    JHChoiceModel *selectdeModel = self.dataArray[indexPath.row];
    selectdeModel.state = 1;
    for (JHChoiceModel *model in self.dataArray) {
        if (selectdeModel != model) {
            model.state = 0;
        }
    }
    [self.tableView reloadWithData:self.dataArray];
}

#pragma mark - public Method

#pragma mark - protocol Method



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
