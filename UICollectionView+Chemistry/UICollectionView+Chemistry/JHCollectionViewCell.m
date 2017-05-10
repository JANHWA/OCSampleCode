//
//  JHCollectionViewCell.m
//  UICollectionView+Chemistry
//
//  Created by Justin on 2017/5/10.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHCollectionViewCell.h"
#import "Masonry.h"

@interface JHCollectionViewCell ()

@property (strong, nonatomic) UIButton *titleBtn;

@end

@implementation JHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (UIButton *)titleBtn {
    if (_titleBtn == nil) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleBtn.enabled = NO;
        [_titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_titleBtn];
    }
    return _titleBtn;
}

- (void)initView {
    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


- (void)showContentTitle:(NSString *)title {
    
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}

@end
