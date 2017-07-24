//
//  ViewController.m
//  Realm-Demo
//
//  Created by Justin on 2017/5/27.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "Person.h"
#import "TwoViewController.h"


@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *arrayM;

@end

@implementation ViewController


- (NSMutableArray *)arrayM {
    if (_arrayM == nil) {
        _arrayM = [[NSMutableArray alloc] init];
    }
    return _arrayM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

static int i = 0;

- (IBAction)createButton:(UIButton *)sender {
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    Person *p1 = [[Person alloc] init];
    p1.name = [NSString stringWithFormat:@"Jack-----%d",i++];
    p1.age = 15 + i;
    [realm transactionWithBlock:^{
        [realm addObject:p1];
    }];
    [self.arrayM addObject:p1];
    
    
//    [realm transactionWithBlock:^{
//        for (int i = 0; i < 10; i++) {
//            Person *p = [[Person alloc] init];
//            p.name = [NSString stringWithFormat:@"Jack-----%d",i];;
//            p.age = 19 + i;
//            [realm addObject:p];
//            if (i < 5) {
//                [self.arrayM addObject:p];
//            }
//        }
//    }];
//    
    
    NSLog(@"realm:%@ Path:%@",[Person allObjects],realm.configuration.fileURL);
}
- (IBAction)deleteObjects:(UIButton *)sender {
    
}
- (IBAction)deleteAllObjects:(UIButton *)sender {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm deleteAllObjects];
    }];
    [self.arrayM removeAllObjects];
}
- (IBAction)pushButton:(UIButton *)sender {
    
    TwoViewController *twoVC =  self.navigationController.viewControllers.lastObject;
//    twoVC.arrayM = [[NSMutableArray alloc] init];
    [twoVC.arrayM addObjectsFromArray:self.arrayM];
    [self.arrayM removeAllObjects];
    NSLog(@"%@",twoVC.arrayM);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
