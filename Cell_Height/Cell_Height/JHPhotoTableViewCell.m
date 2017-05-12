//
//  JHPhotoTableViewCell.m
//  Cell_Height
//
//  Created by Justin on 2017/5/7.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHPhotoTableViewCell.h"
#import "JHCollectionViewCell.h"

#define COLLECTIONCELLID @"COLLECTIONCELLID"

@implementation JHPhotoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];

    }
    return self;
}

- (void)createDataArray:(NSArray *)array {
    
    _dataArray = [NSMutableArray arrayWithArray:array];
    [self.collectionView reloadData];
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    
    _dataArray = dataArray;
}

+ (JHPhotoTableViewCell *)showContentWithArray:(NSArray *)array
                                tableView:(UITableView *)tableView
                                indexPath:(NSIndexPath *)indexPath
                                    identifier:(NSString *)identifier {
    
    JHPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JHPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    [cell createDataArray:array];
    return cell;
}


- (void)initView {
    
    self.backgroundColor = [UIColor yellowColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.minimumLineSpacing = Margin;
//    flowLayout.minimumInteritemSpacing = Margin;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.contentView addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.userInteractionEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[JHCollectionViewCell class] forCellWithReuseIdentifier:COLLECTIONCELLID];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:COLLECTIONCELLID forIndexPath:indexPath];
    
    cell.btnBlock = ^(UIButton *sender) {
        if (_deleteBlock) {
            NSUInteger index = _deleteBlock(sender,indexPath.row);
            [self.dataArray removeObjectAtIndex:index];
            [self.collectionView reloadData];
        }
    };
    [cell showContentWithImageName:self.dataArray[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CellWidth, CellWidth);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(Margin, Margin, Margin, Margin);
}


//- collectionview


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
