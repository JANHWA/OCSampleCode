//
//  JHSuggestTableViewCell.m
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHSuggestTableViewCell.h"
#import "JHTagView.h"

@interface JHSuggestTableViewCell ()
<
JHTagViewDelegate
>

@property (weak, nonatomic) IBOutlet JHTagView *tagView;

@end

@implementation JHSuggestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tagView.delegate = self;
}

- (void)showContentWithTags:(NSArray *)tags indexPath:(NSIndexPath *)indexPath {
    
    self.indexPath = indexPath;
    [self.tagView reloadTagViewWithTags:tags];
}

//MARK: - JHTagViewDelegate

- (void)tagView:(JHTagView *)tagView updateViewSize:(CGSize)size {
    
    UITableView *tableView = (UITableView *)self.superview;
    self.tagView.bounds = CGRectMake(0, 0, self .bounds.size.width, size.height);
    
    tableView.rowHeight = size.height + 16;
}

- (void)tagView:(JHTagView *)tagView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(suggestTableViewCell:didSelectItemAtIndexPath:)]) {
        
        NSIndexPath *indexP = [NSIndexPath indexPathForRow:indexPath.row inSection:self.indexPath.section];
        
        [self.delegate suggestTableViewCell:self didSelectItemAtIndexPath:indexP];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
