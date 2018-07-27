//
//  ViewController.m
//  JHSearch
//
//  Created by HWA on 2018/7/18.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "ViewController.h"
#import "JHSearchViewController.h"
#import "JHSearchResultViewController.h"

@interface ViewController ()
<JHSearchViewControllerDelegate>

@property (strong, nonatomic) JHSearchResultViewController *searchResultController;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)searchButton:(UIButton *)sender {
    // 搜索
    
    NSArray *hotSearchs = @[@"BMW",@"法拉利",@"兰博基尼",@"迈巴赫",@"迈凯伦",@"科尼塞柯",@"保时捷",@"Benz",@"玛莎拉蒂",@"阿尔法罗密欧",@"布加迪"];
    
    JHSearchViewController *searchVC = [JHSearchViewController searchViewControllerWithHotSearchs:hotSearchs searchBarPlaceholder:@"保时捷" searhButtonClickHandler:^(JHSearchViewController *searchViewController, UISearchBar *searchBar) {
        
         NSLog(@"searchText:%@",searchBar.text);
    }];
    
    
    
    searchVC.searchResultController = self.searchResultController;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    
    [self presentViewController:nav animated:YES completion:nil];
}

//MARK: - JHSearchViewControllerDelegate

- (void)searchViewController:(JHSearchViewController *)searchViewController searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"searchText:%@",searchBar.text);
}

- (JHSearchResultViewController *)searchResultController {
    if (_searchResultController == nil) {
        _searchResultController = [[JHSearchResultViewController alloc] init];
    }
    return _searchResultController;
}




@end
