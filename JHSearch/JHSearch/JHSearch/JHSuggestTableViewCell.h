//
//  JHSuggestTableViewCell.h
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHSuggestTableViewCell;

@protocol JHSuggestTableViewCellDelegate<NSObject>

@optional
- (void)suggestTableViewCell:(JHSuggestTableViewCell *)cell didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


@end


@interface JHSuggestTableViewCell : UITableViewCell

@property (strong, nonatomic) UITableView *tableView;

@property (weak, nonatomic) id<JHSuggestTableViewCellDelegate> delegate;

@property (strong, nonatomic) NSIndexPath *indexPath;

- (void)showContentWithTags:(NSArray *)tags tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;



@end
