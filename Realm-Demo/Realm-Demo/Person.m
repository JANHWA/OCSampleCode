//
//  Person.m
//  Realm-Demo
//
//  Created by Justin on 2017/6/10.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (NSString *)primaryKey {
    return @"ID";
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{@""};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
