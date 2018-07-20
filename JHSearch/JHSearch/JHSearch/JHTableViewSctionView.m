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





@end
