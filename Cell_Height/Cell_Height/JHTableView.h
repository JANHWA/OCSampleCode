//
//  JHTableView.h
//  Cell_Height
//
//  Created by Justin on 2017/5/6.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef UITableViewCell *(^CellCalledBlock)(UITableView *tableView,NSIndexPath *indexPath);

typedef void(^didSelectBlock)(NSIndexPath *indexPath);

@interface JHTableView : NSObject<UITableViewDelegate,UITableViewDataSource>

/**
 数据源
 */
@property (strong, nonatomic) NSMutableArray *dataArray;

/**
 列表视图
 */
@property (strong, nonatomic) UITableView *tableView;


//__________________________________________________________________________________________________
//这是一条华丽的分割线，以下是方法。


/**
 初始化方法

 @param view 显示所在的视图
 @param style 分组、不分组（默认不分组）
 @param cellCalled cell的回调
 @return 返回对象
 */
- (instancetype)initInView:(UIView *)view
            tableViewStyle:(UITableViewStyle)style
           CellCalledBlock:(CellCalledBlock)cellCalled;


/**
 点击cell的回调方法

 @param didSelectIndexPath block
 */
- (void)didSelectRowAtIndexPath:(didSelectBlock)didSelectIndexPath;

/**
 布局方法

 @param view 视图所在的父视图
 */
- (void)layoutView:(UIView *)view;

/**
 刷新列表

 @param array 数据源
 */
- (void)reloadWithData:(NSArray *)array;

@end
