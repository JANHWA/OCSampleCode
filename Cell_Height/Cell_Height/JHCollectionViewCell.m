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

- (void)initView {
    
    self.imageV = [[UIImageView alloc] init];
    self.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imageV];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

@end
