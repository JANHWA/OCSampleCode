//
//  JHSecondViewController.m
//  StoryboardDemo
//
//  Created by Justin on 2017/8/10.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "JHSecondViewController.h"

@interface JHSecondViewController ()

@end

@implementation JHSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"SecondVC===========segue:%@  sender:%@",segue,sender);
}


@end
