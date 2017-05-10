//
//  JHCollectionReusableView.m
//  UICollectionView+Chemistry
//
//  Created by Justin on 2017/5/10.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHCollectionReusableView.h"
#import "Masonry.h"

@interface JHCollectionReusableView ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation JHCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor grayColor];
        [self addSubview:_label];
    }
    return _label;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
}

- (void)showContentWithTitle:(NSString *)title {
    self.label.text = title;
}


@end
