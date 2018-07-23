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

@interface JHSearchViewController : UIViewController


@property (strong, nonatomic) JHSearchResultViewController *searchResultController;

@property (strong, nonatomic) UISearchBar *searchBar;

@property (copy, nonatomic) NSString *searchBarPlaceholder;

/**
 热门搜索数组
 */
@property (strong, nonatomic) NSArray<NSString *> *hotSearchs;

@end
