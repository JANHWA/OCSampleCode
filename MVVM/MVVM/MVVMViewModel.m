//
//  MVVMViewModel.m
//  MVVM
//
//  Created by Justin on 2017/6/4.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "MVVMViewModel.h"
#import "MVVMView.h"

@interface MVVMViewModel ()

@property (strong, nonatomic) MVVMModel *model;

@end

@implementation MVVMViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)configModel:(MVVMModel *)model {
    self.model = model;
    self.contentStr = model.title;
}

- (void)printClick {
    NSString *str = [NSString stringWithFormat:@"这是:%d",arc4random() % 100];
    self.model.title = str;
    self.contentStr = self.model.title;
}


@end
