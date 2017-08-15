//
//  ViewController.m
//  UIActivityController
//
//  Created by Justin on 2017/7/19.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"

#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}
- (IBAction)shareButtonEvent:(UIButton *)sender {
    
    NSString *urlStr = @"www.baidu.com";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSString *title = @"VIVA";
//    UIImage *image = [UIImage imageNamed:@"lufei"];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[url,title] applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[UIActivityTypeAirDrop];
    [self presentViewController:activityViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
