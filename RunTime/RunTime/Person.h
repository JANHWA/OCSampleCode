//
//  Person.h
//  Runtime
//
//  Created by Justin on 2017/3/18.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

+ (instancetype)person;

@end
