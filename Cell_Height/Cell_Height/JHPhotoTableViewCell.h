//
//  JHPhotoTableViewCell.h
//  Cell_Height
//
//  Created by Justin on 2017/5/7.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSUInteger(^DeleteBlock)(UIButton *sender,NSInteger index);

@interface JHPhotoTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@property (copy, nonatomic) DeleteBlock deleteBlock;

+ (JHPhotoTableViewCell *)showContentWithArray:(NSArray *)array
                                     tableView:(UITableView *)tableView
                                     indexPath:(NSIndexPath *)indexPath
                                    identifier:(NSString *)identifier;

@end
