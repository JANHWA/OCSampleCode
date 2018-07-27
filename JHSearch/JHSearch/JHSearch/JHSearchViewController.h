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

@class JHSearchViewController;

@protocol JHSearchViewControllerDelegate<NSObject>

@optional

- (void)searchViewController:(JHSearchViewController *)searchViewController searchBarSearchButtonClicked:(UISearchBar *)searchBar;

@end


typedef void(^SearchBarSearchButtonClickHandler)(JHSearchViewController *searchViewController, UISearchBar *searchBar);

@interface JHSearchViewController : UIViewController


@property (weak, nonatomic) id<JHSearchViewControllerDelegate> delegate;
@property (copy, nonatomic) SearchBarSearchButtonClickHandler searchButtonClickHandler;

@property (strong, nonatomic) JHSearchResultViewController *searchResultController;

@property (strong, nonatomic) UISearchBar *searchBar;

@property (copy, nonatomic) NSString *searchBarPlaceholder;

/**
 热门搜索数组
 */
@property (strong, nonatomic) NSArray<NSString *> *hotSearchs;

+ (JHSearchViewController *)searchViewControllerWithHotSearchs:(NSArray <NSString *>*)hotSearchs
                                          searchBarPlaceholder:(NSString *)placeholder
                                       searhButtonClickHandler:(SearchBarSearchButtonClickHandler)searchButtonHandler;













@end
