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

@property (strong, nonatomic) JHSearchViewController *searchVC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // 模拟网络请求热词
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *hotSearchs = @[@"比特币",@"以太坊",@"柚子",@"BNB",@"ETC",@"BCH",@"TRX",@"ADA",@"OMG",@"ZIL"];
        [self.searchVC reloadHotSearchTags:hotSearchs];
    });
}

- (IBAction)searchButton:(UIButton *)sender {
    // 搜索
    
    NSArray *hotSearchs = @[@"BMW",@"法拉利",@"兰博基尼",@"迈巴赫",@"迈凯伦",@"科尼塞柯",@"保时捷",@"Benz",@"玛莎拉蒂",@"阿尔法罗密欧",@"布加迪"];
    
    self.searchVC = [JHSearchViewController searchViewControllerWithHotSearchs:hotSearchs searchBarPlaceholder:@"保时捷" searhButtonClickHandler:^(JHSearchViewController *searchViewController, JHSearchBar *searchBar) {
        
         NSLog(@"searchText:%@",searchBar.searchTextField.text);
    }];
    
    self.searchVC.searchResultController = self.searchResultController;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.searchVC];
    
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
