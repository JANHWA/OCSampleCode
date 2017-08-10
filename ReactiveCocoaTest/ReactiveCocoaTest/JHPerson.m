//
//  JHPerson.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/10.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "JHPerson.h"

@implementation JHPerson

+ (JHPerson *)createModel {
    JHPerson *person = [[self alloc] init];
    person.name = @"Tom";
    person.age = 20;
    return person;
}

@end
