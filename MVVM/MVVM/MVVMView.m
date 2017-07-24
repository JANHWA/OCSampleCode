//
//  MVVMView.m
//  MVVM
//
//  Created by Justin on 2017/6/4.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "MVVMView.h"

@interface MVVMView ()

@property (strong, nonatomic) MVVMViewModel *vmModel;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *button;

@end

@implementation MVVMView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 1000, 50)];
    self.label.textColor = [UIColor blackColor];
    self.label.text = @"label";
    [self addSubview:self.label];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(100, 200, 60, 30);
    [self.button setTitle:@"button" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.button];
}

- (void)setWithModel:(MVVMViewModel *)vm {
    self.vmModel = vm;
    [vm addObserver:self forKeyPath:@"contentStr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentStr"]) {
        NSString *title = change[NSKeyValueChangeNewKey];
        self.label.text = title;
    }
}

- (void)buttonClick:(UIButton *)sender {
    [self.vmModel printClick];
}

- (void)dealloc {
    [self.vmModel removeObserver:self forKeyPath:@"contentStr"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
