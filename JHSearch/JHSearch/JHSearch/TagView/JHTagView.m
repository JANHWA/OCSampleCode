//
//  JHTagView.m
//  JHTagView
//
//  Created by HWA on 2018/7/3.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHTagView.h"
#import "JHTagCollectionViewCell.h"
#import "JHCollectionViewFlowLayout.h"

@interface JHTagView ()
<
UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource
>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation JHTagView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    
    [[NSBundle mainBundle] loadNibNamed:@"JHTagView" owner:self options:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
    
    JHCollectionViewFlowLayout *flowLayout = [[JHCollectionViewFlowLayout alloc] init];
    
    self.collectionView.collectionViewLayout = flowLayout;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JHTagCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
}

- (void)reloadTagViewWithTags:(NSArray *)tags {
    
    self.dataArray = tags.mutableCopy;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    
    self.bounds = self.collectionView.bounds;
    if ([self.delegate respondsToSelector:@selector(tagView:updateViewSize:)]) {
        [self.delegate tagView:self updateViewSize:self.collectionView.collectionViewLayout.collectionViewContentSize];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self layoutSubviews];
    });
}

//MARK: - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JHTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.title = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(tagView:collectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate tagView:self collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = self.dataArray[indexPath.row];
    CGSize size = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0],NSFontAttributeName, nil]];
    
    return CGSizeMake(size.width + 20, size.height + 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 5);
}

@end

