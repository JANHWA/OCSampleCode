//
//  JHSearchBar.h
//  Finance
//
//  Created by HWA on 2018/8/7.
//  Copyright © 2018年 qingkong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHSearchBar;

@protocol JHSearchBarDelegate<NSObject>

@optional


- (void)searchBar:(JHSearchBar *)searchBar searchTextFieldDidChanged:(UITextField *)textField;

- (void)searchBar:(JHSearchBar *)searchBar didSelectCancelButton:(UIButton *)sender;

- (void)searchBar:(JHSearchBar *)searchBar textFieldDidBeginEditing:(UITextField *)textField;

- (BOOL)searchBar:(JHSearchBar *)searchBar textFieldShouldBeginEditing:(UITextField *)textField;

- (BOOL)searchBar:(JHSearchBar *)searchBar textFieldShouldEndEditing:(UITextField *)textField;

- (BOOL)searchBar:(JHSearchBar *)searchBar textFieldDidEndEditing:(UITextField *)textField;

- (BOOL)searchBar:(JHSearchBar *)searchBar textFieldShouldClear:(UITextField *)textField;

- (BOOL)searchBar:(JHSearchBar *)searchBar textFieldShouldReturn:(UITextField *)textField;

- (BOOL)searchBar:(JHSearchBar *)searchBar textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

- (void)searchBar:(JHSearchBar *)searchBar textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0);

@end

@interface JHSearchBar : UIView

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@property (weak, nonatomic) id<JHSearchBarDelegate> delegate;


@end
