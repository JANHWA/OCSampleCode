//
//  JHChoiceTableViewCell.h
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/11.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton *sender);

@interface JHChoiceTableViewCell : UITableViewCell

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UILabel *titleLabel;

@property (copy, nonatomic) ButtonBlock buttonBlock;

+ (JHChoiceTableViewCell *)showContentWithTableView:(UITableView *)tableView
                                          indexPath:(NSIndexPath *)indexPath
                                         identifier:(NSString *)identifier
                                         titleArray:(NSArray *)titleArray;

- (void)buttonBlock:(ButtonBlock)buttonBlock;

@end
