//
//  ViewController.m
//  BmobDemo
//
//  Created by Justin on 2017/7/25.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import <BmobSDK/Bmob.h>

#define ws(name) __weak typeof(name) weakSelf = name

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)addData:(UIButton *)sender {
    
    [self addData];
}
- (IBAction)deletedData:(UIButton *)sender {
    [self deletedData];
}
- (IBAction)changeData:(UIButton *)sender {
    [self changeData];
}


- (IBAction)getData:(UIButton *)sender {
    [self getData];
}

- (void)addData {
    
    //往GameScore表添加一条playerName为小明，分数为78的数据
    BmobObject *gameScore = [BmobObject objectWithClassName:@"UserInformation"];
    [gameScore setObject:@"小明" forKey:@"nickName"];
    [gameScore setObject:@8 forKey:@"age"];
    [gameScore setObject:@1 forKey:@"sex"];
    
    ws(self);
    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        //进行操作
        
      weakSelf.stateLabel.text = (isSuccessful? @"添加数据成功":@"操作失败");
    }];
}

- (void)getData {
    
//    //查找GameScore表
//    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"UserInformation"];
//    //查找GameScore表里面id为rdPjCCCV的数据
//    ws(self);
//    [bquery getObjectInBackgroundWithId:@"f908693d48" block:^(BmobObject *object,NSError *error){
//        if (error){
//            //进行错误处理
//        }else{
//            //表里有id为0c6db13c的数据
//            if (object) {
//                //得到playerName和cheatMode
//                NSString *playerName = [object objectForKey:@"nickName"];
//                weakSelf.stateLabel.text = playerName;
//                
//            }
//        }
//    }];
    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"UserInformation"];
    //查找GameScore表的数据
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *obj in array) {
            //打印playerName
            NSLog(@"obj.playerName = %@", [obj objectForKey:@"nickName"]);
            //打印objectId,createdAt,updatedAt
            NSLog(@"obj.objectId = %@", [obj objectId]);
            NSLog(@"obj.createdAt = %@", [obj createdAt]);
            NSLog(@"obj.updatedAt = %@", [obj updatedAt]);
        }
    }];
}

- (void)changeData {
    //查找GameScore表
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"UserInformation"];
    //查找GameScore表里面id为rdPjCCCV的数据
    ws(self);
    [bquery getObjectInBackgroundWithId:@"rdPjCCCV" block:^(BmobObject *object,NSError *error){
        //没有返回错误
        if (!error) {
            //对象存在
            if (object) {
                BmobObject *obj1 = [BmobObject objectWithoutDataWithClassName:object.className objectId:object.objectId];
                //设置cheatMode为YES
                [obj1 setObject:@"路易斯" forKey:@"nickName"];
                //异步更新数据
                [obj1 updateInBackground];
                weakSelf.stateLabel.text = @"更新成功";
            }
        }else{
            //进行错误处理
        }
    }];
}

- (void)deletedData {
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"UserInformation"];
    ws(self);
    [bquery getObjectInBackgroundWithId:@"rdPjCCCV" block:^(BmobObject *object, NSError *error){
        if (error) {
            //进行错误处理
        }
        else{
            if (object) {
                //异步删除object
                [object deleteInBackground];
                weakSelf.stateLabel.text = @"删除成功";
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
