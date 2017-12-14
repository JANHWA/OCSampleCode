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

@property (strong, nonatomic) JHSegmentView *segmentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles = @[@"电影", @"音乐"];
    
    CGRect frame = CGRectMake(0, 0, titles.count * 60, 30);

    // 方式一：代理使用方式、不带消息红点
    self.segmentView = [[JHSegmentView alloc] initWithFrame:frame titles:titles round:NO toView:self.view delegate:self];
    self.segmentView.center = self.view.center;
    
    // 方式二：block使用方式、带消息红点
//    self.segmentView = [[JHSegmentView alloc] initWithFram:frame titles:titles round:YES toView:self.view selectedIndexBlock:^(JHSegmentView *segmentView, NSInteger index) {
//        self.messageLabel.text = [NSString stringWithFormat:@"点击第%ld个",index];
//        [segmentView showMessage:YES index:index];
//    }];
//    self.segmentView.center = self.view.center;
//    self.segmentView.showType = JHSegmentViewShowMessage;

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
