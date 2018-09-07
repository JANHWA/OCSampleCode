//
//  JHSearchSuggestViewController.h
//  JHSearch
//
//  Created by HWA on 2018/7/20.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHSuggestTableViewCell.h"

@class JHSearchSuggestViewController;

typedef void(^ScrollViewDidScrollHandler)(UIScrollView *scrollView);

@protocol JHSearchSuggestViewControllerDelegate<NSObject>

@optional

- (void)searchSuggestViewController:(JHSearchSuggestViewController *)searchSuggestController suggestTableViewCell:(JHSuggestTableViewCell *)cell searchText:(NSString *)tagSearchText;

@end

@interface JHSearchSuggestViewController : UIViewController

@property (strong, nonatomic) NSArray<NSString *> *hotSearchs;

@property (copy, nonatomic) ScrollViewDidScrollHandler scrollViewDidScrollHandler;

@property (weak, nonatomic) id<JHSearchSuggestViewControllerDelegate> delegate;

- (void)reloadHotSearchTags:(NSArray *)tags;

@end
