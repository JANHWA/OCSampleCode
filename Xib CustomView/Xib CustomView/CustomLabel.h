//
//  CustomLabel.h
//  Xib CustomView
//
//  Created by Justin on 2017/7/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE @interface CustomLabel : UILabel

@property (assign, nonatomic) IBInspectable CGFloat bordWidth;
@property (assign, nonatomic) IBInspectable UIColor *bordColor;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;

@end
