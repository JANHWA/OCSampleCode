//
//  JHTableViewSctionView.h
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHTableViewSctionView;


@protocol JHTableViewSctionViewDelegate<NSObject>

@optional
- (void)sectionView:(JHTableViewSctionView *)sectionView didSelectButton:(UIButton *)sender section:(NSInteger)section;


@end

@interface JHTableViewSctionView : UIView

@property (assign, nonatomic) NSInteger section;

@property (weak, nonatomic) id<JHTableViewSctionViewDelegate> delegate;

- (void)showSectionContentWithSection:(NSInteger)section;

@end
