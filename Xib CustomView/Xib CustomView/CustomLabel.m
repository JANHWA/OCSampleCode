//
//  CustomLabel.m
//  Xib CustomView
//
//  Created by Justin on 2017/7/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setBordWidth:(CGFloat)bordWidth {
    if (_bordWidth != bordWidth) {
        _bordWidth = bordWidth;
        self.layer.borderWidth = _bordWidth;
    }
}

- (void)setBordColor:(UIColor *)bordColor {
    if (_bordColor != bordColor) {
        
        _bordColor = bordColor;
        self.layer.borderColor = bordColor.CGColor;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (_cornerRadius != cornerRadius) {
        _cornerRadius = cornerRadius;
        self.layer.cornerRadius = _cornerRadius;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
