//
//  ViewController.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/5/29.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    RACSignal *loginEnable = [[RACSignal combineLatest:@[self.accountTextField.rac_textSignal,self.passwordTextField.rac_textSignal]] map:^id _Nullable(RACTuple * _Nullable value) {
        return @([value[0] length] > 6 && [value[1] length] > 6);
    }];
    
    self.loginButton.rac_command = [[RACCommand alloc] initWithEnabled:loginEnable signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal empty];
    }];

    // 监听accountTextField文本变化
    [[self.accountTextField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(__kindof UITextField * _Nullable x) {
        NSLog(@"====================account:%@",x.text);
    }];
    
    // 监听passwordTextField文本变化
    [self.passwordTextField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"++++++++++++password:%@",x);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


@end
