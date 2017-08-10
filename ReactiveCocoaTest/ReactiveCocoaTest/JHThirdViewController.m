//
//  JHThirdViewController.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/9.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "JHThirdViewController.h"

@interface JHThirdViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet JHCustomView *customView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) JHPerson *person;

@end

@implementation JHThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self protocolMethod];
    
    [self addKeyboardShowNotification];
    
    [self addKVO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

// 回调
- (void)protocolMethod {
    // 方式1
//    @weakify(self);
//    [[self.customView rac_signalForSelector:@selector(doneButtonClick:)] subscribeNext:^(RACTuple * _Nullable x) {
//        @strongify(self);
//        self.stateLabel.text = @"回调成功";
//    }];
    
    // 方式2
    self.customView.delegateSignal = [RACSubject subject];
    [self.customView.delegateSignal subscribeNext:^(UIButton *_Nullable x) {
        self.stateLabel.text = [x currentTitle];
    }];
}

// 添加通知
- (void)addKeyboardShowNotification {
    
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidChangeFrameNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        self.stateLabel.text = @"键盘Frame发生变化";
    }];
}

- (void)addKVO {
    
    self.person = [JHPerson createModel];
    
    @weakify(self);
    [RACObserve(self, self.person.name) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.stateLabel.text = x;
    }];
}
- (IBAction)jh_kvoButton:(UIButton *)sender {
    
    self.person.name = [NSString stringWithFormat:@"Jack%d",arc4random()%100];
}



@end
