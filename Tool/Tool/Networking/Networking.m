//
//  Networking.m
//  Tool
//
//  Created by Justin on 2017/12/4.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "Networking.h"

@implementation Networking

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static Networking *shareManager = nil;
    dispatch_once(&onceToken, ^{
        shareManager = [[Networking alloc] init];
    });
    return shareManager;
}

- (void)request {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

@end
