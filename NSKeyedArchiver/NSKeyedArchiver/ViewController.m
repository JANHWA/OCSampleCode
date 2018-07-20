//
//  ViewController.m
//  NSKeyedArchiver
//
//  Created by HWA on 2018/7/20.
//  Copyright © 2018年 HWA. All rights reserved.
//

#import "ViewController.h"
#import "Pepole.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *pPath = [path stringByAppendingString:@"/p.plist"];
    
    NSMutableArray *arrayM = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        Pepole *p = [[Pepole alloc] init];
        
        p.name = [NSString stringWithFormat:@"Jack%d",i];
        p.age  = 10+i;
        
        [arrayM addObject:p];
    }
    
    


    // 归档
    if ([NSKeyedArchiver archiveRootObject:arrayM toFile:pPath]) {
        // 归档成功
        NSLog(@"归档成功:%@",pPath);
    } else {
        NSLog(@"归档失败:%@",pPath);
    }
    
    // 解档
    
    NSArray *pArray = [NSKeyedUnarchiver unarchiveObjectWithFile:pPath];
    
//    NSLog(@"解档成功: name:%@   age:%d",P.name,P.age);
    NSLog(@"pArray:%@",pArray);
}



@end
