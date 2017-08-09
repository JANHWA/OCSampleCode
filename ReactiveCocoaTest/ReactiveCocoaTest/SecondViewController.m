//
//  SecondViewController.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/9.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UITextField *redTextField;
@property (weak, nonatomic) IBOutlet UITextField *greenTextField;
@property (weak, nonatomic) IBOutlet UITextField *blueTextField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal *signalRed = [self blindSlider:_redSlider textField:_redTextField];
    RACSignal *signalGreen = [self blindSlider:_greenSlider textField:_greenTextField];
    RACSignal *signalBlue = [self blindSlider:_blueSlider textField:_blueTextField];
    
    RACSignal *changeValueSignal = [[RACSignal combineLatest:@[signalRed,signalGreen,signalBlue]] map:^id _Nullable(RACTuple * _Nullable value) {
        return [UIColor colorWithRed:[value[0] floatValue]  green:[value[1] floatValue] blue:[value[2] floatValue] alpha:1];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        RAC(self.view,backgroundColor) = changeValueSignal;
    });
    
}

- (RACSignal *)blindSlider:(UISlider *)slider textField:(UITextField *)textField {
    
    RACSignal *signalText = [[textField rac_textSignal] take:1];
    
    RACChannelTerminal *signalSlider = [slider rac_newValueChannelWithNilValue:nil];
    RACChannelTerminal *signalTextField = [textField rac_newTextChannel];
    
    [signalTextField subscribe:signalSlider];
    [[signalSlider map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"%.2f",[value floatValue]];
    }] subscribe:signalTextField];
    
    // 合并信号量
    return [[signalTextField merge:signalSlider] merge:signalText];
}


@end
