//
//  JHTableViewCell.h
//  Cell_Height
//
//  Created by Justin on 2017/5/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHTableViewCell : UITableViewCell


+ (JHTableViewCell *)showContentWithArray:(NSArray *)array
                                tableView:(UITableView *)tableView
                                indexPath:(NSIndexPath *)indexPath
                               Identifier:(NSString *)identifier;

@end
