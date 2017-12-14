//
//  JHSegmentView.m
//  JHSegmentControl
//
//  Created by Justin on 14/12/2017.
//  Copyright © 2017 Justin. All rights reserved.
//

#import "JHSegmentView.h"

#define WIDTH self.bounds.size.width
#define HEIGHT self.bounds.size.height

#define DURATION 0.3

#define DAMPING 0.5

#define VELOCITY 0.3

@interface JHSegmentView ()

@property (copy, nonatomic) DidSelectedIndexHandler didSelectedIndexHandler;

@property (weak, nonatomic) id<JHSegmentViewDelegate> delegate;

@property (assign, nonatomic) BOOL showMessage;

@property (strong, nonatomic) NSMutableArray <UIView *> *views;

@end


@implementation JHSegmentView

- (NSMutableArray<UIButton *> *)buttons {
    if (_buttons == nil) {
        _buttons = [[NSMutableArray alloc] init];
    }
    return _buttons;
}

- (NSMutableArray<UIView *> *)views {
    if (_views == nil) {
        _views = [[NSMutableArray alloc] init];
    }
    return _views;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles round:(BOOL)round toView:(UIView *)view delegate:(id<JHSegmentViewDelegate>)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        [self configViewWithFrame:frame titles:titles round:round toView:view];
    }
    return self;
}

- (instancetype)initWithFram:(CGRect)frame titles:(NSArray *)titles round:(BOOL)round toView:(UIView *)view selectedIndexBlock:(DidSelectedIndexHandler) didSelectedHandler {
    self = [super initWithFrame:frame];
    if (self) {
        self.didSelectedIndexHandler = didSelectedHandler;
        [self configViewWithFrame:frame titles:titles round:round toView:view];
        
    }
    return self;
}


/**
 配置视图

 @param frame 视图的位置、大小
 @param titles 标题数组
 @param round 角是否带圆
 */
- (void)configViewWithFrame:(CGRect)frame titles:(NSArray *)titles round:(BOOL)round toView:(UIView *)view {
    // 默认类型不带消息红点
    self.showType = JHSegmentViewDefault;
    
    [view addSubview:self];
   
    self.slideView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH/titles.count, HEIGHT)];
    // 滑块默认蓝色背景
    self.slideView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.slideView];
    self.backgroundColor = [UIColor grayColor];
    
    // 是否带圆角
    if (round) {
        self.slideView.layer.cornerRadius = HEIGHT * 0.5;
        self.slideView.layer.masksToBounds = YES;
        
        self.layer.cornerRadius = HEIGHT * 0.5;
        self.layer.masksToBounds = YES;
    }
    
    __weak typeof(self) weakSelf = self;
    [titles enumerateObjectsUsingBlock:^(NSString  *_Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(idx * (WIDTH/titles.count), 0, WIDTH/titles.count, HEIGHT);
        button.tag = 100 + idx;
        button.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [strongSelf.buttons addObject:button];
        
        [button addTarget:strongSelf action:@selector(segmentClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
    
}

- (void)showMessage:(BOOL)showMessage index:(NSInteger)index {

    _showMessage = showMessage;
    if (self.showType == JHSegmentViewShowMessage) {
        [self.views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (index == idx) {
                obj.hidden = !_showMessage;
            }
        }];
    } else {
        // 非JHSegmentViewShowMessage类型时的断言
        NSAssert(self.showType == JHSegmentViewShowMessage, @"请先设置显示类型为：JHSegmentViewShowMessage，然后才能调用此方法！！！");
    }
   
}


- (void)setShowType:(JHSegmentViewType)showType {
    _showType = showType;
    if (_showType == JHSegmentViewShowMessage) {
        [self configMessageView];
    } else {
        __weak typeof(self) weakSelf = self;
        if ([self.views count] > 0) {
            [self.views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj removeFromSuperview];
                __strong typeof(weakSelf) strongSelf = weakSelf;
                if (idx == strongSelf.views.count - 1) {
                    *stop = YES;
                    if (*stop) {
                        [strongSelf.views removeAllObjects];
                    }
                }
            }];
        }
    }
}


/**
 创建消息红点
 */
- (void)configMessageView {
    __weak typeof(self) weakSelf = self;
    
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        UIView *messageView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(obj.frame) - 10, obj.center.y - 2, 6, 6)];
        [strongSelf.views addObject:messageView];
        messageView.hidden = YES;
        messageView.layer.cornerRadius = 3;
        messageView.layer.masksToBounds = YES;
        messageView.backgroundColor = [UIColor redColor];
        [self addSubview:messageView];
    }];
}

/**
 按钮点击事件
 */
- (void)segmentClick:(UIButton *)sender {
    
    CGPoint clickPoint = sender.center;
    __weak typeof(self) weakSelf = self;
    // 滑块动画
    [UIView animateWithDuration:DURATION delay:0.0 usingSpringWithDamping:DAMPING initialSpringVelocity:VELOCITY options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.slideView.center = clickPoint;
    } completion:^(BOOL finished) {
        
    }];
    
    
    if (_didSelectedIndexHandler) {
        _didSelectedIndexHandler(self,sender.tag - 100);
    }
    
    if ([self.delegate respondsToSelector:@selector(segmentView:didSelectedIndex:)]) {
        [self.delegate segmentView:self didSelectedIndex:sender.tag - 100];
    }
}


@end
