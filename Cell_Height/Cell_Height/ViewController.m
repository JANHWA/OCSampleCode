//
//  ViewController.m
//  Cell_Height
//
//  Created by Justin on 2017/5/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSMutableArray *photoArray;
@property (strong, nonatomic) JHTestTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataArray = [[NSMutableArray alloc] init];
    self.photoArray = [[NSMutableArray alloc] init];
    
    [self createUI];
}

- (void)createUI {
    __weak typeof(self) weakSelf = self;
    self.tableView = [[JHTestTableView alloc] initInView:self.view
                                          tableViewStyle:UITableViewStyleGrouped
                                              cellForRow:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
                                                  
                                                  if (indexPath.section == 3 && indexPath.row == 1) {
                                                      
                                                      JHPhotoTableViewCell *cell = [JHPhotoTableViewCell showContentWithArray:self.photoArray
                                                                                                                    tableView:tableView
                                                                                                                    indexPath:indexPath
                                                                                                                   identifier:PhotoCellID];
                                                      cell.deleteBlock = ^NSUInteger(UIButton *sender,NSInteger index) {
                                                          NSLog(@"-------删除第%ld张图片---------",index);
                                                          [self delePhotoIndex:index];
                                                          [self.tableView reloadWithData:self.dataArray];
                                                          return index;
                                                      };
                                                     return cell;
                                                  } else {
                                                      
                                                      return [JHTableViewCell showContentWithArray:weakSelf.dataArray
                                                                                         tableView:tableView
                                                                                         indexPath:indexPath
                                                                                        identifier:CELLID];
                                                      
                                                  }
    }];
    [self.tableView didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
        NSLog(@"点击section：%ld --row:%ld --内容：%@",indexPath.section,indexPath.row,self.dataArray[indexPath.section][indexPath.row]);
    }];
}

- (IBAction)btnClick:(UIButton *)sender {
//    NSArray *titleArray = @[@/"0在细雨中呼喊",@"1北京法源寺",@"2曾国藩家书",@"3自在独行"];
    
    [self createPhotoArray];
    NSArray *titleArray = @[@[@"0在细雨中呼喊",@"3自在独行"],
                            @[@"0在细雨中呼喊"],
                            @[@"1北京法源寺",@"2曾国藩家书",@"3自在独行"],
                            @[@"0在细雨中呼喊",@"3自在独行"],
                            @[@"0在细雨中呼喊",@"1北京法源寺",@"2曾国藩家书",@"3自在独行"]];
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:titleArray];
    [self.tableView reloadWithData:self.dataArray];
}

- (void)createPhotoArray {
    
    for (NSInteger i = 1; i < 9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"image%ld.jpg",i];
        [self.photoArray addObject:imageName];
    }
    [self.tableView setPhotoArray:self.photoArray];
}

- (void)delePhotoIndex:(NSInteger)index {
    [self.tableView.photoArray removeObjectAtIndex:index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
