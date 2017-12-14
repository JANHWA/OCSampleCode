//
//  ViewController.m
//  Tool
//
//  Created by Justin on 2017/12/4.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "HUD.h"
#import "Networking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)show:(UIButton *)sender {
    
    [HUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD dismiss];
    });
}
- (IBAction)dismiss:(UIButton *)sender {
    
    [[Networking shareManager] request];
}



@end
