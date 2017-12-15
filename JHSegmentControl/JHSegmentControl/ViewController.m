//
//  ViewController.m
//  JHSegmentControl
//
//  Created by Justin on 14/12/2017.
//  Copyright © 2017 Justin. All rights reserved.
//

#import "ViewController.h"
#import "JHSegmentView.h"

@interface ViewController ()<JHSegmentViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 方式一：代理使用方式
    [self test_1];
    
    // 方式二：block使用方式
//    [self test_2];
    
   
}

- (void)test_1 {
    NSArray *titles = @[@"电影", @"音乐", @"图书"];
    
    CGRect frame = CGRectMake(0, 0, titles.count * 60, 30);
    
    JHSegmentView *segmentView = [[JHSegmentView alloc] initWithFrame:frame titles:titles round:NO toView:self.view delegate:self];
    segmentView.center = self.view.center;
}

- (void)test_2 {
    
    NSArray *titles = @[@"电影", @"音乐", @"图书"];
    CGRect frame = CGRectMake(0, 0, titles.count * 60, 30);
    
    JHSegmentView *segmentView = [[JHSegmentView alloc] initWithFram:frame titles:titles round:YES toView:self.view selectedIndexBlock:^(JHSegmentView *segmentView, NSInteger index) {
        self.messageLabel.text = [NSString stringWithFormat:@"点击第%ld个",index];
        // 显示红点
        [segmentView showMessage:YES index:index];
    }];
    segmentView.center = self.view.center;
    // 设置带消息提示红点
    segmentView.showType = JHSegmentViewShowMessage;
}


//MARK: - JHSegmentViewDelegate

- (void)segmentView:(JHSegmentView *)segmentView didSelectedIndex:(NSInteger)index {
    self.messageLabel.text = [NSString stringWithFormat:@"点击第%ld个",index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
