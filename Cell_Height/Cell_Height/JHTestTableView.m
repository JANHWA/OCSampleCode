//
//  JHTestTableView.m
//  Cell_Height
//
//  Created by Justin on 2017/5/6.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHTestTableView.h"
#import "Masonry.h"

@implementation JHTestTableView

- (void)setPhotoArray:(NSMutableArray *)photoArray {
    
    _photoArray = [NSMutableArray arrayWithArray:photoArray];
    _photoArray = photoArray;
}

- (void)layoutView:(UIView *)view {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).insets(UIEdgeInsetsMake(0, 0, 100, 0));
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger rowCount = _photoArray.count > 4?2:(_photoArray.count == 0?0:1);
    return indexPath.section == 3 && indexPath.row == 1?(rowCount > 0?(rowCount * CellWidth + 3*(Margin)):0):30;
}

@end
