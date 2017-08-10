//
//  JHCustomView.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/9.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "JHCustomView.h"

@implementation JHCustomView


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [[NSBundle mainBundle] loadNibNamed:@"JHCustomView" owner:self options:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
}

- (IBAction)doneButtonClick:(UIButton *)sender {
    
//    if ([self.delegate respondsToSelector:@selector(didSelectedDoneButton:)]) {
//        [self.delegate didSelectedDoneButton:sender];
//    }
    
    if (self.delegateSignal) {
        [self.delegateSignal sendNext:sender];
    }
    
}

@end
