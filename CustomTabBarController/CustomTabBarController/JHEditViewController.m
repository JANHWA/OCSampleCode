//
//  JHEditViewController.m
//  CustomTabBarController
//
//  Created by Justin on 2017/8/31.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHEditViewController.h"

@interface JHEditViewController ()
@property (weak, nonatomic) IBOutlet UIView *progressView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressViewWidth;

@end

@implementation JHEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)actionEvent:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    [self.progressView layoutIfNeeded];
    [UIView animateWithDuration:10 animations:^{
            weakSelf.progressViewWidth.constant = 0;
            [weakSelf.view layoutSubviews];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
