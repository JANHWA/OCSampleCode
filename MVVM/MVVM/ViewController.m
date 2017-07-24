//
//  ViewController.m
//  MVVM
//
//  Created by Justin on 2017/6/4.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "ViewController.h"
#import "MVVMView.h"
#import "MVVMModel.h"
#import "MVVMViewModel.h"

@interface ViewController ()

@property (strong, nonatomic) MVVMView *mvView;
@property (strong, nonatomic) MVVMModel *model;
@property (strong, nonatomic) MVVMViewModel *vmModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mvView = [[MVVMView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mvView];
    
    self.model = [[MVVMModel alloc] init];
    self.model.title = @"初始值";
    
    self.vmModel = [[MVVMViewModel alloc] init];
    
    [self.mvView setWithModel:self.vmModel];
    [self.vmModel configModel:self.model];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
