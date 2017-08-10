//
//  JHPerson.h
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/10.
//  Copyright © 2017年 justin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHPerson : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

+ (JHPerson *)createModel;

@end
