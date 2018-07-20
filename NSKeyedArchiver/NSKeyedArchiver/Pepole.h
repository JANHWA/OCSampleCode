//
//  Pepole.h
//  NSKeyedArchiver
//
//  Created by HWA on 2018/7/20.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pepole : NSObject<NSCoding>

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) int age;

@end
