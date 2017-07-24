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
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:nil applicationActivities:nil];
    
    [self presentViewController:activityViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
