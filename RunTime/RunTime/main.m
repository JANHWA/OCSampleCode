//
//  main.m
//  Runtime
//
//  Created by Justin on 2017/3/18.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *person = [Person person];
        
        // 获取变量
        Class personC = person.class;
        unsigned int outCount = 0;
        Ivar *ivarPtr = class_copyIvarList(personC, &outCount);
        
        for (NSInteger i = 0; i < outCount; i++) {
            Ivar ivar = ivarPtr[i];
            NSLog(@"实例变量:%s",ivar_getName(ivar));
        }
        
    }
    return 0;
}
