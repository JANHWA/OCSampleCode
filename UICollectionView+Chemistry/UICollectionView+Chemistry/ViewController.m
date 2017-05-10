//
//  ViewController.m
//  UICollectionView+Chemistry
//
//  Created by Justin on 2017/5/10.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "JHCollectionViewCell.h"
#import "Masonry.h"
#import "JHCollectionReusableView.h"

#define LEFTCELL @"LEFTCELL"
#define RIGHTCELL @"RIGHTCELL"
#define SECTIONHEADERVIEW @"sectionHeaderViewID"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *leftCollectionView;
@property (strong, nonatomic) UICollectionView *rightCollectionView;

@property (strong, nonatomic) NSMutableArray *leftArray;
@property (strong, nonatomic) NSMutableArray *rightArray;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createData];
    [self initView];
    
}
#pragma mark - lazy Method

#pragma mark - initial Method
- (void)initView {
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.minimumLineSpacing = 0;
    flowLayout1.minimumInteritemSpacing = 0;
    
    UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout2.minimumLineSpacing = 1;
    flowLayout2.minimumInteritemSpacing = 1;
    flowLayout2.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout2.headerReferenceSize = CGSizeMake(SCREENWIDTH - SCREENWIDTH * 0.25, 30);
    
    self.leftCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout1];
    self.leftCollectionView.delegate = self;
    self.leftCollectionView.dataSource = self;
    self.leftCollectionView.backgroundColor = [UIColor whiteColor];
    self.leftCollectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.leftCollectionView];
    
    self.rightCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout2];
    self.rightCollectionView.delegate = self;
    self.rightCollectionView.dataSource = self;
    self.rightCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.rightCollectionView];
    
    [self.leftCollectionView registerClass:[JHCollectionViewCell class] forCellWithReuseIdentifier:LEFTCELL];
    [self.rightCollectionView registerClass:[JHCollectionViewCell class] forCellWithReuseIdentifier:RIGHTCELL];
    [self.rightCollectionView registerClass:[JHCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SECTIONHEADERVIEW];
    
    [self.leftCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.left.bottom.equalTo(self.view);
        make.width.mas_equalTo(SCREENWIDTH * 0.25);
    }];
    
    [self.rightCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.leftCollectionView);
        make.left.equalTo(self.leftCollectionView.mas_right);
        make.right.equalTo(self.view);
    }];
}

#pragma mark - private Method
- (void)createData {
    
    self.leftArray = [[NSMutableArray alloc] init];
    self.rightArray = [[NSMutableArray alloc] init];
    
    NSArray *letfData = @[@"中国",@"美国",@"俄罗斯",@"德国",@"英国",@"日本",@"印度",@"中国",@"美国",@"俄罗斯",@"德国",@"英国",@"日本",@"印度"];
    [self.leftArray addObjectsFromArray:letfData];
    
    NSArray *rightData = @[@[@"歼10、歼20、歼31、运20",@"96式坦克、武直10",@"辽宁舰、052D驱逐舰",@"东风5B、东风31A",@"歼10、歼20、歼31、运20",@"96式坦克、武直10",@"辽宁舰、052D驱逐舰",@"东风5B、东风31A"],
                           @[@"大黄蜂、F22、F35",@"M1A1坦克,阿帕奇",@"尼米兹级航母、阿利伯克级",@"民兵三、战斧巡航导弹",@"大黄蜂、F22、F35",@"M1A1坦克,阿帕奇",@"尼米兹级航母、阿利伯克级"],
                           @[@"苏27、苏35、T50",@"T72坦克",@"库兹涅佐夫号航空母舰",@"白杨M洲际弹道导弹",@"苏27、苏35、T50",@"T72坦克",@"库兹涅佐夫号航空母舰"],
                           @[@"台风战机",@"豹-2坦克",@"勃兰登堡级现代化护卫舰"],
                           @[@"P51战斗机",@"鹞式战斗机",@"闪电战机"],
                           @[@"F15战机",@"爱宕级驱逐舰",@"P3c反潜巡逻机",@"苍龙级常规潜艇"],
                           @[@"苏27、米格29",@"维克兰特号",@"光辉战舰"],
                           @[@"辽宁舰、052D驱逐舰",@"东风5B、东风31A"],
                           @[@"大黄蜂、F22、F35",@"M1A1坦克,阿帕奇",@"尼米兹级航母、阿利伯克级",@"民兵三、战斧巡航导弹"],
                           @[@"苏27、苏35、T50",@"T72坦克",@"库兹涅佐夫号航空母舰",@"白杨M洲际弹道导弹",@"苏27、苏35、T50",@"T72坦克",@"苏27、苏35、T50",@"T72坦克"],
                           @[@"台风战机",@"豹-2坦克",@"勃兰登堡级现代化护卫舰",@"台风战机",@"豹-2坦克",@"勃兰登堡级现代化护卫舰",@"台风战机",@"豹-2坦克",@"勃兰登堡级现代化护卫舰"],
                           @[@"P51战斗机",@"鹞式战斗机",@"闪电战机"],
                           @[@"F15战机",@"爱宕级驱逐舰",@"P3c反潜巡逻机",@"苍龙级常规潜艇",@"F15战机",@"爱宕级驱逐舰",@"P3c反潜巡逻机",@"苍龙级常规潜艇",@"F15战机",@"爱宕级驱逐舰",@"P3c反潜巡逻机",@"苍龙级常规潜艇",@"F15战机",@"爱宕级驱逐舰",@"P3c反潜巡逻机",@"苍龙级常规潜艇"],
                           @[@"苏27、米格29",@"维克兰特号",@"光辉战舰"],];
    [self.rightArray addObjectsFromArray:rightData];

    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.leftCollectionView reloadData];
        [self.rightCollectionView reloadData];
    });
    
}

#pragma mark - public Method

#pragma mark - protocol Method
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if (collectionView == self.leftCollectionView) {
       return 1;
    }
    return self.rightArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView == self.leftCollectionView) {
       return self.leftArray.count;
    } else {
        NSArray *array = self.rightArray[section];
        return array.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.leftCollectionView) {
        JHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LEFTCELL forIndexPath:indexPath];
        [cell showContentTitle:self.leftArray[indexPath.row]];
        return cell;
    } else {
        JHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:RIGHTCELL forIndexPath:indexPath];
//        cell.layer.borderColor = [UIColor grayColor].CGColor;
//        cell.layer.borderWidth = 1;
        [cell showContentTitle:self.rightArray[indexPath.section][indexPath.row]];
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        JHCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SECTIONHEADERVIEW forIndexPath:indexPath];
        NSLog(@"senction:%ld------row:%ld",indexPath.section,indexPath.row);
        [header showContentWithTitle:self.leftArray[indexPath.section]];
        return header;
    } else {
        return nil;
    }
}

//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    UICollectionViewCell *cell = [self.rightCollectionView cellForItemAtIndexPath:indexPath];
//    layoutAttributes.frame = cell.bounds;
//    return layoutAttributes;
//}
//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREENWIDTH * 0.75 * 0.32, SCREENWIDTH * 0.75 * 0.333 * 0.333);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 10, 5, 12);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
