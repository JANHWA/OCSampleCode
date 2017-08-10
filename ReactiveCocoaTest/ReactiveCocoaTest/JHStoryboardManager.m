//
//  JHStoryboardManager.m
//  ReactiveCocoaTest
//
//  Created by Justin on 2017/8/10.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "JHStoryboardManager.h"

@implementation JHStoryboardManager

+ (UIViewController *)viewController:(NSString *)viewController {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:[NSString stringWithFormat:@"%@ID",viewController]];
    return vc;
}

@end
