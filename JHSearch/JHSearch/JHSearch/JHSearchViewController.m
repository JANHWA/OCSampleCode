//
//  JHSearchViewController.m
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "JHSearchViewController.h"
#import "JHSearchSuggestViewController.h"


@interface JHSearchViewController ()

<UISearchBarDelegate,
JHSearchSuggestViewControllerDelegate>

@property (strong, nonatomic) UISearchBar *searchBar;

@property (strong, nonatomic) JHSearchSuggestViewController *searchSuggestController;

@end


@implementation JHSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.navigationItem.titleView = self.searchBar;
    
    [self.view addSubview:self.searchResultController.view];
    [self addChildViewController:self.searchResultController];
    
    [self.view addSubview:self.searchSuggestController.view];
    [self addChildViewController:self.searchSuggestController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.searchBar becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchBar resignFirstResponder];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}


//MARK: - UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.searchResultController.view.hidden = 0 == searchBar.text.length;
    if ([searchBar.text length] > 0) {
        if (self.searchResultController) {
            [self.view bringSubviewToFront:self.searchResultController.view];
        }
    }
    [self.searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    self.searchResultController.view.hidden = 0 == searchText.length;

    if (searchText.length == 0) {
        [self.view bringSubviewToFront:self.searchSuggestController.view];
    } else if (searchText.length > 0) {
//        if (self.searchResultController) {
//            [self.view bringSubviewToFront:self.searchResultController.view];
//        }
    } else {

    }
}

//MARK: - JHSearchSuggestViewControllerDelegate

- (void)searchSuggestViewController:(JHSearchSuggestViewController *)searchSuggestController suggestTableViewCell:(JHSuggestTableViewCell *)cell searchText:(NSString *)tagSearchText {
    self.searchBar.text = tagSearchText;
    
    self.searchResultController.view.hidden = 0 == tagSearchText.length;
    if ([self.searchBar.text length] > 0) {
        if (self.searchResultController) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view bringSubviewToFront:self.searchResultController.view];
            });
        }
    }
    [self.searchBar resignFirstResponder];
    
    NSArray *historyArray = [NSKeyedUnarchiver unarchiveObjectWithFile:PATH_SEARCH_HISTORY];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:historyArray];
    
    [arrayM insertObject:tagSearchText atIndex:0];
    
    NSMutableOrderedSet *mutableOrderedSet = [NSMutableOrderedSet orderedSetWithArray:arrayM];
    
    
    [NSKeyedArchiver archiveRootObject:[mutableOrderedSet array] toFile:PATH_SEARCH_HISTORY];
    
    NSLog(@"search_history_path:%@ \n allObj:%@",PATH_SEARCH_HISTORY,[mutableOrderedSet array]);
}


//MARK: - setter & getter

- (UISearchBar *)searchBar {
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _searchBar.showsCancelButton = YES;
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (JHSearchSuggestViewController *)searchSuggestController {
    
    __weak typeof(self) weakSelf = self;
    if (_searchSuggestController == nil) {
        _searchSuggestController = [[JHSearchSuggestViewController alloc] init];
        _searchSuggestController.delegate = self;
        [_searchSuggestController setScrollViewDidScrollHandler:^(UIScrollView *scrollView) {
            [weakSelf.searchBar resignFirstResponder];
        }];
    }
    return _searchSuggestController;
}

@end
