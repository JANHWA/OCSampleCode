//
//  JHSearchViewController.h
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHSearchResultViewController.h"
#import "JHSearchSuggestViewController.h"
#import "JHSearchBar.h"

@class JHSearchViewController;

@protocol JHSearchViewControllerDelegate<NSObject>

@optional
- (void)searchViewController:(JHSearchViewController *)searchViewController searchBarSearchButtonClicked:(JHSearchBar *)searchBar;

@end


typedef void(^SearchBarSearchButtonClickHandler)(JHSearchViewController *searchViewController, JHSearchBar *searchBar);

@interface JHSearchViewController : UIViewController


@property (weak, nonatomic) id<JHSearchViewControllerDelegate> delegate;
@property (copy, nonatomic) SearchBarSearchButtonClickHandler searchButtonClickHandler;

@property (strong, nonatomic) UIViewController *searchResultController;

@property (strong, nonatomic) JHSearchBar *searchBar;

@property (copy, nonatomic) NSString *searchBarPlaceholder;

/**
 热门搜索数组
 */
@property (strong, nonatomic) NSArray<NSString *> *hotSearchs;

+ (JHSearchViewController *)searchViewControllerWithHotSearchs:(nullable NSArray <NSString *> *)hotSearchs
                                          searchBarPlaceholder:(nullable NSString *)placeholder
                                       searhButtonClickHandler:(SearchBarSearchButtonClickHandler)searchButtonHandler;


- (void)reloadHotSearchTags:(NSArray *)tags;













@end
