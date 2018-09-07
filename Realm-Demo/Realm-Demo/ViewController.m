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


- (IBAction)createButton:(UIButton *)sender {
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:nil];
    
    for (int i = 0; i < 10; i++) {
        Person *p = [[Person alloc] init];
        p.name = [NSString stringWithFormat:@"Jack_%d",i];;
        p.age = 19 + i;
        p.ID  = 1000+i;
        p.height = 165 + i;
//        p.weight = 100 + i;
        
        [self.arrayM addObject:p];
    }
    
    [realm transactionWithBlock:^{
        
        if (realm.isEmpty) {
            [realm addObjects:self.arrayM];
            
        } else {
            [realm addOrUpdateObjects:self.arrayM];
        }
    }];

    NSString *path = realm.configuration.fileURL.path;
    NSDictionary *dict= [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    
    NSLog(@"realm:%@ size: %llu Path:%@",[Person allObjects],dict.fileSize,path);
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
    [twoVC.arrayM addObjectsFromArray:self.arrayM];
    NSLog(@"%@",twoVC.arrayM);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
