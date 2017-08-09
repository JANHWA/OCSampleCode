//
//  JHCustomView.h
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/9.
//  Copyright © 2017年 justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JHCustomViewDelegate <NSObject>

- (void)didSelectedDoneButton:(UIButton *)sender;

@end

@interface JHCustomView : UIView


@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) id<JHCustomViewDelegate> delegate;

- (IBAction)doneButtonClick:(UIButton *)sender;

@end
