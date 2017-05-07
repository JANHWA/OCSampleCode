//
//  ViewController.m
//  Cell_Height
//
//  Created by Justin on 2017/5/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#import "JHTableViewCell.h"
#import "JHTestTableView.h"

#define CELLID @"CELLID"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) JHTestTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    [self createUI];
}

- (void)createUI {
    __weak typeof(self) weakSelf = self;
    self.tableView = [[JHTestTableView alloc] initInView:self.view
                                          tableViewStyle:UITableViewStyleGrouped
                                              cellForRow:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [JHTableViewCell showContentWithArray:weakSelf.dataArray
                                           tableView:tableView
                                           indexPath:indexPath
                                          identifier:CELLID
                ];
    }];
    [self.tableView didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
        NSLog(@"点击section：%ld --row:%ld --内容：%@",indexPath.section,indexPath.row,self.dataArray[indexPath.section][indexPath.row]);
    }];
}

- (IBAction)btnClick:(UIButton *)sender {
//    NSArray *titleArray = @[@/"0在细雨中呼喊",@"1北京法源寺",@"2曾国藩家书",@"3自在独行"];
    
    NSArray *titleArray = @[@[@"0在细雨中呼喊",@"3自在独行"],
                            @[@"0在细雨中呼喊"],
                            @[@"1北京法源寺",@"2曾国藩家书",@"3自在独行"],
                            @[@"0在细雨中呼喊",@"3自在独行"],
                            @[@"0在细雨中呼喊",@"1北京法源寺",@"2曾国藩家书",@"3自在独行"]];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:titleArray];
    [self.tableView reloadWithData:self.dataArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
