//
//  Pepole.m
//  NSKeyedArchiver
//
//  Created by HWA on 2018/7/20.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "Pepole.h"

@implementation Pepole


// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}

// 反归档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age  = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

@end
