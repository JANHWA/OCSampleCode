//
//  MVVMView.h
//  MVVM
//
//  Created by Justin on 2017/6/4.
//  Copyright © 2017年 justin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVVMViewModel.h"

@interface MVVMView : UIView


- (void)setWithModel:(MVVMViewModel *)vm;

@end
