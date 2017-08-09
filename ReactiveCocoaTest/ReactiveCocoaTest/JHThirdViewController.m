//
//  JHThirdViewController.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/9.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "JHThirdViewController.h"

@interface JHThirdViewController ()<JHCustomViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet JHCustomView *customView;

@end

@implementation JHThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self protocolMethod];
}

// 回调
- (void)protocolMethod {
    [[self.customView rac_signalForSelector:@selector(doneButtonClick:)] subscribeNext:^(RACTuple * _Nullable x) {
        self.stateLabel.text = @"回调成功";
        NSLog(@"===============X:%@",x);
    }];
}

- (void)didSelectedDoneButton:(UIButton *)sender {
    NSLog(@"------------------");
}


@end
