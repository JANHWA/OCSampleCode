//
//  JHCollectionViewCell.m
//  Cell_Height
//
//  Created by Justin on 2017/5/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHCollectionViewCell.h"

#import "Masonry.h"

@implementation JHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    self.imageV = [[UIImageView alloc] init];
    _imageV.contentMode = UIViewContentModeScaleToFill;
    self.imageV.userInteractionEnabled = YES;
    [self.contentView addSubview:self.imageV];
    
    self.deleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.deleBtn];
    
    [self.deleBtn setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [self.deleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.imageV);
        make.width.height.mas_equalTo(@20);
    }];
    
}

- (void)btnClick:(UIButton *)sender {
    if (_btnBlock) {
        _btnBlock(sender);
    }
}

- (void)showContentWithImageName:(NSString *)imageName {
    
    self.imageV.image = [UIImage imageNamed:imageName];
}

@end
