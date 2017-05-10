//
//  ViewController.m
//  UITableView+Chemistry
//
//  Created by Justin on 2017/5/10.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define LEFTCELLID @"leftCellID"
#define RIGHTCELLID @"rightCellID"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *leftTableView;
@property (strong, nonatomic) UITableView *rightTableView;

@property (strong, nonatomic) NSMutableArray *leftArray;
@property (strong, nonatomic) NSMutableArray *rightArray;
@property (assign, nonatomic) BOOL isFirstDisplay;
@property (assign, nonatomic) BOOL isClikLeftTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createData];
    [self initView];
}

- (void)initView {
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.leftTableView];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    
    self.rightTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.rightTableView];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(SCREENWIDTH * 0.25);
    }];
    
    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.leftTableView);
        make.left.equalTo(self.leftTableView.mas_right);
        make.right.equalTo(self.view);
    }];
}

- (void)createData {
    self.leftArray = [[NSMutableArray alloc] init];
    self.rightArray = [[NSMutableArray alloc] init];
    self.isFirstDisplay = YES;
    
    NSArray *letfData = @[@"中国",@"美国",@"俄罗斯",@"德国",@"英国",@"日本",@"印度"];
    [self.leftArray addObjectsFromArray:letfData];
    
    NSArray *rightData = @[@[@"歼10、歼20、歼31、运20",@"96式坦克、武直10",@"辽宁舰、052D驱逐舰",@"东风5B、东风31A"],
                           @[@"大黄蜂、F22、F35",@"M1A1坦克,阿帕奇",@"尼米兹级航母、阿利伯克级",@"民兵三、战斧巡航导弹"],
                           @[@"苏27、苏35、T50",@"T72坦克",@"库兹涅佐夫号航空母舰",@"白杨M洲际弹道导弹"],
                           @[@"台风战机",@"豹-2坦克",@"勃兰登堡级现代化护卫舰"],
                           @[@"P51战斗机",@"鹞式战斗机",@"闪电战机"],
                           @[@"F15战机",@"爱宕级驱逐舰",@"P3c反潜巡逻机",@"苍龙级常规潜艇"],
                           @[@"苏27、米格29",@"维克兰特号",@"光辉战舰"],
                           ];
    [self.rightArray addObjectsFromArray:rightData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.leftTableView) {
        return 1;
    } else {
        return self.rightArray.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return self.leftArray.count;
    } else {
        NSArray *array = self.rightArray[section];
        return array.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LEFTCELLID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LEFTCELLID];
        }
        cell.textLabel.text = self.leftArray[indexPath.row];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RIGHTCELLID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:RIGHTCELLID];
        }
        cell.textLabel.text = self.rightArray[indexPath.section][indexPath.row];
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.rightTableView) {
        return self.leftArray[section];
    }
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    } else {
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.rightTableView) {
        NSIndexPath *indexPath = [[self.rightTableView indexPathsForVisibleRows ] objectAtIndex:0];
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.rightTableView) {
        NSIndexPath *indexPath = [[self.rightTableView indexPathsForVisibleRows ] objectAtIndex:0];
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableView && _isFirstDisplay) {
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        _isFirstDisplay = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
