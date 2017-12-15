//
//  JHSecondViewController.m
//  JHSegmentControl
//
//  Created by Justin on 15/12/2017.
//  Copyright © 2017 Justin. All rights reserved.
//

#import "JHSecondViewController.h"
#import "JHSegmentView.h"

@interface JHSecondViewController ()<JHSegmentViewDelegate, JHSegmentViewDataSource>

@property (weak, nonatomic) IBOutlet JHSegmentView *segmentView;


@end

@implementation JHSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.segmentView.delegate = self;
    self.segmentView.dataSource = self;
    
    self.segmentView.showType = JHSegmentViewShowMessage;
    [self.segmentView showMessage:YES index:3];
}

//MARK: - JHSegmentViewDataSource

- (NSArray <NSString *>*)titlesOfSegmentView:(JHSegmentView *)segmentView {
    return @[@"视频", @"音乐", @"图书", @"电影"];
}

//MARK: - JHSegmentViewDelegate

- (void)segmentView:(JHSegmentView *)segmentView didSelectedIndex:(NSInteger)index {
    NSLog(@"点击第%ld个",index);
}


@end
