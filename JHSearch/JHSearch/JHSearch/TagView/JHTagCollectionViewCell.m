//
//  JHTagCollectionViewCell.m
//  JHTagView
//
//  Created by HWA on 2018/7/3.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHTagCollectionViewCell.h"


@interface JHTagCollectionViewCell ()


@end


@implementation JHTagCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.tagBtn.layer.cornerRadius = 3.0;
    self.tagBtn.layer.masksToBounds = YES;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self.tagBtn setTitle:_title forState:UIControlStateNormal];
}

@end
