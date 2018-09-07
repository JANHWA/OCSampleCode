//
//  JHSearchBar.m
//  Finance
//
//  Created by HWA on 2018/8/7.
//  Copyright © 2018年 qingkong. All rights reserved.
//

#import "JHSearchBar.h"

@interface JHSearchBar ()
<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation JHSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)configView {
    
    [[NSBundle mainBundle] loadNibNamed:@"JHSearchBar" owner:self options:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
    
    [self.searchTextField addTarget:self action:@selector(textFieldDidChangedText:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChangedText:(UITextField *)textField {
    self.clearButton.hidden = !([textField.text length] > 0);
    if ([self.delegate respondsToSelector:@selector(searchBar:searchTextFieldDidChanged:)]) {
        [self.delegate searchBar:self searchTextFieldDidChanged:textField];
    }
}

- (IBAction)clearButton:(UIButton *)sender {
    self.searchTextField.text = @"";
    self.clearButton.hidden = !([self.searchTextField.text length] > 0);
    if ([self.delegate respondsToSelector:@selector(searchBar:searchTextFieldDidChanged:)]) {
        [self.delegate searchBar:self searchTextFieldDidChanged:self.searchTextField];
    }
}

- (IBAction)cancelButton:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(searchBar:didSelectCancelButton:)]) {
        [self.delegate searchBar:self didSelectCancelButton:sender];
    }
}

//MARK: - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldShouldBeginEditing:)]) {
      return [self.delegate searchBar:self textFieldShouldBeginEditing:textField];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)]) {
        [self.delegate searchBar:self textFieldDidBeginEditing:textField];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldShouldEndEditing:)]) {
       return [self.delegate searchBar:self textFieldShouldEndEditing:textField];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldDidEndEditing:)]) {
        [self.delegate searchBar:self textFieldDidEndEditing:textField];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)){
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldDidEndEditing:reason:)]) {
        [self.delegate searchBar:self textFieldDidEndEditing:textField reason:reason];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([self.delegate respondsToSelector:@selector(searchBar:textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.delegate searchBar:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldShouldClear:)]) {
        return [self.delegate searchBar:self textFieldShouldClear:textField];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldShouldReturn:)]) {
        return [self.delegate searchBar:self textFieldShouldReturn:textField];
    }
    return YES;
}
@end
