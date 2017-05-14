//
//  JHSectionHeaderView.m
//  UITableView+ChoiseCell
//
//  Created by Justin on 2017/5/13.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHSectionHeaderView.h"

#import "Masonry.h"

@interface JHSectionHeaderView ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation JHSectionHeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}
#pragma mark - lazy Method
- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.layer.borderColor = [UIColor grayColor].CGColor;
        _button.layer.borderWidth = 1.0;
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

#pragma mark - initial Method
- (void)initView {
    [self addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark - private Method
- (void)buttonClick:(UIButton *)sender {
    if (_buttonBlock) {
        _buttonBlock(sender);
    }
}

#pragma mark - public Method
- (void)selectHeaderViewBlock:(ButtonBlock)buttonBlock {
    _buttonBlock = buttonBlock;
}

- (void)showHeaderViewTitle:(NSString *)title {
    [self.button setTitle:title forState:UIControlStateNormal];
}

#pragma mark - protocol Method


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}]
*/


@end
