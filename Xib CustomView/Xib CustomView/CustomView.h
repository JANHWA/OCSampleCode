//
//  CustomView.h
//  Xib CustomView
//
//  Created by Justin on 2017/7/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton *sender);

@interface CustomView : UIView

@property (copy, nonatomic) ButtonBlock buttonBlock;
@property (weak, nonatomic) IBOutlet UILabel *contentView;
- (IBAction)button:(UIButton *)sender;

@end
