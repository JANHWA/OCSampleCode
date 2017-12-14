//
//  Networking.h
//  Tool
//
//  Created by Justin on 2017/12/4.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface Networking : NSObject

+ (instancetype)shareManager;

- (void)request;

@end
