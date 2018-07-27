//
//  TwoViewController.m
//  Realm-Demo
//
//  Created by Justin on 2017/6/10.
//  Copyright © 2017年 justin. All rights reserved.
//

#import "TwoViewController.h"
#import <Realm/RLMRealm.h>
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)arrayM {
    if (_arrayM == nil) {
        _arrayM = [[NSMutableArray alloc] init];
    }
    return _arrayM;
}

- (IBAction)deleteButton:(UIButton *)sender {
    
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/person.realm"];
    
    if (_arrayM.count >= 10) {
        NSRange range = {0,5};
        NSArray *array = [self.arrayM subarrayWithRange:range];
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm deleteObjects:array];
        }];
        [_arrayM removeAllObjects];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
