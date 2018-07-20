//
//  JHTagCollectionViewCell.m
//  JHTagView
//
//  Created by HWA on 2018/7/3.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHTagCollectionViewCell.h"


@interface JHTagCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *tagBtn;

@end


@implementation JHTagCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.tagBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.tagBtn.layer.cornerRadius = 10.0;
//    self.tagBtn.layer.borderWidth = 1.0;
    self.tagBtn.layer.masksToBounds = YES;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    [self.tagBtn setTitle:_title forState:UIControlStateNormal];
}

@end
