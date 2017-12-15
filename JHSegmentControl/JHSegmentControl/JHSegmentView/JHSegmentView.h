//
//  JHSegmentView.h
//  JHSegmentControl
//
//  Created by Justin on 14/12/2017.
//  Copyright © 2017 Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHSegmentView;

@protocol JHSegmentViewDataSource<NSObject>


@required
/**
 数据源代理

 @param segmentView segmentView视图
 @return 数据源（仅支持文字信息)
 */
- (NSArray <NSString *>*)titlesOfSegmentView:(JHSegmentView *)segmentView;

@end

@protocol JHSegmentViewDelegate<NSObject>

@optional

/**
 点击代理回调

 @param segmentView JHSegmentView控件对象
 @param index 点击所在的索引
 */
- (void)segmentView:(JHSegmentView *)segmentView didSelectedIndex:(NSInteger)index;

@end

/**
 点击block

 @param index 点击所在的索引
 */
typedef void(^DidSelectedIndexHandler)(JHSegmentView *segmentView ,NSInteger index);


typedef NS_ENUM(NSUInteger, JHSegmentViewType) {
    JHSegmentViewDefault, // 默认不带消息红点
    JHSegmentViewShowMessage, // 带消息红点
};


//MARK: - Interface

IB_DESIGNABLE
@interface JHSegmentView : UIView


/**
 数据源代理
 */
@property (weak, nonatomic) id<JHSegmentViewDataSource> dataSource;

/**
 代理
 */
@property (weak, nonatomic) id<JHSegmentViewDelegate> delegate;


/**
 显示类型
 */
@property (assign, nonatomic) JHSegmentViewType showType;


/**
 是否带圆角
 */
@property (assign, nonatomic) IBInspectable BOOL round;

/**
 滑动视图
 */
@property (strong, nonatomic) UIView *slideView;


/**
 segment按钮数组
 */
@property (strong, nonatomic) NSMutableArray <UIButton *> *buttons;



/**
 控制显示或隐藏消息红点

 @param showMessage 显示或隐藏
 @param index 所在的索引
 */
- (void)showMessage:(BOOL)showMessage index:(NSInteger)index;



/**
 初始化segmentView

 @param frame 位置和大小
 @param titles 标题数组
 @param round 是否带圆角
 @param view 显示坐在的视图
 @param delegate 代理
 @return 返回segmentView对象
 */
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles round:(BOOL)round toView:(UIView *)view delegate:(id<JHSegmentViewDelegate>)delegate;

/**
 初始化segmentView

 @param frame 位置和大小
 @param titles 标题数组
 @param round 是否带圆角
 @param view 显示所在的视图
 @param didSelectedHandler 点击回调
 @return 返回segmentView对象
 */
- (instancetype)initWithFram:(CGRect)frame titles:(NSArray *)titles round:(BOOL)round toView:(UIView *)view selectedIndexBlock:(DidSelectedIndexHandler) didSelectedHandler;




@end
