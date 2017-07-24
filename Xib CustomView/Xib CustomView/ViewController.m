//
//  ViewController.m
//  Xib CustomView
//
//  Created by Justin on 2017/7/5.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) CMMotionManager *manager;
@property (assign, nonatomic) CGFloat z;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
        self.contentViw.buttonBlock = ^(UIButton *sender) {
    
            NSLog(@"--------------------------");
        };
//
//    CustomView *view = [[CustomView alloc] initWithFrame:CGRectMake(20, 200, 100, 100)];
//    [self.view addSubview:view];
//    
//    view.buttonBlock = ^(UIButton *sender) {
//      
//        NSLog(@"--------------------------");
//    };
    [self useGyroPush];
//    [self direction];
}

- (void)useGyroPush {
    __weak typeof(self) weakSelf = self;
    
    //初始化全局管理对象
    self.manager = [[CMMotionManager alloc] init];
    //    self.motionManager = manager;
    //判断陀螺仪可不可以，判断陀螺仪是不是开启
    
//    if ([self.manager isGyroAvailable] && [self.manager isGyroActive]){
    
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //告诉manager，更新频率是100Hz
        self.manager.gyroUpdateInterval = 0.01;
        //Push方式获取和处理数据
        
    [self.manager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        [weakSelf showTitleLabelWithZ:accelerometerData.acceleration.z];
    }];
}

- (void)direction {
    UIDevice *device = [UIDevice currentDevice];
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"螢幕朝上平躺");
              self.titleLabel.text = @"螢幕朝上平躺";
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"螢幕朝下平躺");
              self.titleLabel.text = @"螢幕朝下平躺";
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
              self.titleLabel.text = @"未知方向";
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"螢幕向左橫置");
            self.titleLabel.text = @"螢幕向左橫置";
            //imgView.transform = CGAffineTransformMakeRotation((CGFloat)(-90 * M_PI / 180.0));
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"螢幕向右橫置");
            self.titleLabel.text = @"螢幕向右橫置";
            //imgView.transform = CGAffineTransformMakeRotation((CGFloat)(90 * M_PI / 180.0));
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"螢幕直立");
               self.titleLabel.text = @"螢幕直立";
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"螢幕直立，上下顛倒");
            self.titleLabel.text = @"螢幕直立，上下顛倒";
            break;
            
        default:
            NSLog(@"無法辨識");
            self.titleLabel.text = @"無法辨識";
            break;
    }
}

- (void)showTitleLabelWithZ:(CGFloat)z {
    dispatch_async(dispatch_get_main_queue(), ^{
//        [self direction];
    self.titleLabel.text = [NSString stringWithFormat:@"%f",z];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
