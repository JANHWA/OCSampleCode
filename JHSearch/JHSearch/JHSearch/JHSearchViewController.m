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

<
UISearchBarDelegate,
JHSearchSuggestViewControllerDelegate,
JHSearchBarDelegate
>

@property (strong, nonatomic) JHSearchSuggestViewController *searchSuggestController;


@end


@implementation JHSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar addSubview:self.searchBar];
    
    [self.view addSubview:self.searchResultController.view];
    [self addChildViewController:self.searchResultController];
    
    [self.view addSubview:self.searchSuggestController.view];
    [self addChildViewController:self.searchSuggestController];
    
    self.searchBar.searchTextField.placeholder = self.searchBarPlaceholder;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.searchBar.searchTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchBar.searchTextField resignFirstResponder];
}

- (void)reloadHotSearchTags:(NSArray *)tags {
    [self.searchSuggestController reloadHotSearchTags:tags];
}

+ (JHSearchViewController *)searchViewControllerWithHotSearchs:(NSArray <NSString *>*)hotSearchs searchBarPlaceholder:(NSString *)placeholder {
    JHSearchViewController *searchVC = [[JHSearchViewController alloc] init];
    searchVC.hotSearchs = hotSearchs;
    searchVC.searchBarPlaceholder = placeholder;
    return searchVC;
}

+ (JHSearchViewController *)searchViewControllerWithHotSearchs:(NSArray <NSString *>*)hotSearchs searchBarPlaceholder:(NSString *)placeholder searhButtonClickHandler:(SearchBarSearchButtonClickHandler)searchButtonHandler {
    JHSearchViewController *searchVC = [self searchViewControllerWithHotSearchs:hotSearchs searchBarPlaceholder:placeholder];
    searchVC.searchButtonClickHandler = searchButtonHandler;
    return searchVC;
}

//MARK: - JHSearchSuggestViewControllerDelegate

- (void)searchSuggestViewController:(JHSearchSuggestViewController *)searchSuggestController suggestTableViewCell:(JHSuggestTableViewCell *)cell searchText:(NSString *)tagSearchText {
    
    
    self.searchBar.searchTextField.text = tagSearchText;

    self.searchResultController.view.hidden = 0 == tagSearchText.length;
    if ([self.searchBar.searchTextField.text length] > 0) {
        if (self.searchResultController) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view bringSubviewToFront:self.searchResultController.view];
            });
        }
    }
    [self.searchBar resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(searchViewController:searchBarSearchButtonClicked:)]) {
        [self.delegate searchViewController:self searchBarSearchButtonClicked:self.searchBar];
    }

    if (_searchButtonClickHandler) {
        _searchButtonClickHandler(self,self.searchBar);
    }
}

//MARK: - JHSearchBarDelegate

- (void)searchBar:(JHSearchBar *)searchBar searchTextFieldDidChanged:(UITextField *)textField {
    NSString *searchText = textField.text;
    self.searchResultController.view.hidden = 0 == searchText.length;
    
    if (searchText.length == 0) {
        [self.view bringSubviewToFront:self.searchSuggestController.view];
    }
}

- (BOOL)searchBar:(JHSearchBar *)searchBar textFieldShouldReturn:(UITextField *)textField {
    self.searchResultController.view.hidden = 0 == searchBar.searchTextField.text.length;
    if ([searchBar.searchTextField.text length] > 0) {
        if (self.searchResultController) {
            [self.view bringSubviewToFront:self.searchResultController.view];
        }
    }
    [self.searchBar.searchTextField resignFirstResponder];

    if ([self.delegate respondsToSelector:@selector(searchViewController:searchBarSearchButtonClicked:)]) {
        [self.delegate searchViewController:self searchBarSearchButtonClicked:searchBar];
    }

    if (_searchButtonClickHandler) {
        _searchButtonClickHandler(self,self.searchBar);
    }
    return YES;
}

- (void)searchBar:(JHSearchBar *)searchBar didSelectCancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//MARK: - setter & getter

- (JHSearchBar *)searchBar {
    if (_searchBar == nil) {
        _searchBar = [[JHSearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
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
            [weakSelf.searchBar.searchTextField resignFirstResponder];
        }];
    }
    return _searchSuggestController;
}

- (void)setHotSearchs:(NSArray<NSString *> *)hotSearchs {
    if (_hotSearchs != hotSearchs) {
        _hotSearchs = hotSearchs;
        self.searchSuggestController.hotSearchs = _hotSearchs;
    }
}

@end
