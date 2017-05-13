//
//  JHSectionHeaderView.h
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton *sender);

@interface JHSectionHeaderView : UIView

@property (copy, nonatomic) ButtonBlock buttonBlock;

- (void)selectHeaderViewBlock:(ButtonBlock)buttonBlock;

- (void)showHeaderViewTitle:(NSString *)title;

@end
