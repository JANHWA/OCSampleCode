//
//  MVVMViewModel.h
//  MVVM
//
//  Created by Justin on 2017/6/4.
//  Copyright © 2017年 justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMModel.h"



@interface MVVMViewModel : NSObject

@property (strong, nonatomic) NSString *contentStr;

- (void)configModel:(MVVMModel *)model;

- (void)printClick;

@end
