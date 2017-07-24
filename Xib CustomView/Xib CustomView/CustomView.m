//
//  CustomView.m
//  Xib CustomView
//
//  Created by Justin on 2017/7/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    CustomView *view = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil].firstObject;
    view.frame = self.bounds;
    [self addSubview:view];
}

- (IBAction)button:(UIButton *)sender {
    
    if (_buttonBlock) {
        _buttonBlock(sender);
    }
}
@end
