//
//  ViewController.m
//  StoryboardDemo
//
//  Created by Justin on 2017/8/10.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "JHSecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     if ([segue.identifier isEqualToString:@"SecondVC"]) {
         JHSecondViewController *vc = [segue destinationViewController];
         vc.name = @"这是第二个VC";
         NSLog(@"FirstVC===========segue:%@  sender:%@",segue,sender);
     } else {
         NSLog(@"sender:%@",sender);
     }
 }
- (IBAction)jh_ThirdVC:(UIButton *)sender {
    [self performSegueWithIdentifier:@"ThirdVC" sender:sender];
}


@end
