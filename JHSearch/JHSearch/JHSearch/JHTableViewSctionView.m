//
//  JHTableViewSctionView.m
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHTableViewSctionView.h"

@interface JHTableViewSctionView ()
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation JHTableViewSctionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    [[NSBundle mainBundle] loadNibNamed:@"JHTableViewSctionView" owner:self options:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
}

- (IBAction)clickButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(sectionView:didSelectButton:section:)]) {
        [self.delegate sectionView:self didSelectButton:sender section:self.section];
    }
}

- (void)showSectionContentWithSection:(NSInteger)section {
    
    self.section = section;
    if (section == 0) {
        self.rightButton.hidden = YES;
        self.titleLabel.text = @"热门搜索";
    } else {
        self.titleLabel.text = @"搜索历史";
    }
}



@end
