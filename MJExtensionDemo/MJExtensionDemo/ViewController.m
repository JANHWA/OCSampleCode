//
//  ViewController.m
//  MJExtensionDemo
//
//  Created by Justin on 2017/7/24.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "MJExtension.h"
#import "RootClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
}

- (IBAction)requestClick:(UIButton *)sender {
    [self requestData];
}


- (void)requestData {
    NSString *urlString = @"http://122.224.124.93:1234/api/JingDian/GetAttractionsList?nsukey=Vigw%2Fm71Q%2FCdTAzyvHLoli0avprqJBSus2nUWSxdh%2FUB3l%2F0yD8PBjzb7Tbuxv90JT%2FcPBeiNnkJGNfmIXAs0eiTjc30rVpzaM2pESB76XMDAsbq08XwjgbVe4ICmEtf6OQO0TKFScERJQACa0BZv831ZohlXfzJPjLMKj%2BGIVnpSGIu5CcHQs44O7oHnhiN";
    
    [self requestDataWithUrlstring:urlString];
}

- (void)requestDataWithUrlstring:(NSString *)urlString {
    
    
    // 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 请求超时
    manager.requestSerializer.timeoutInterval = 20;
    
    // 内容类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];

    
    __weak typeof(self) weakSelf = self;
    // get请求
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        [weakSelf dealDataWithArray:array];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"------------error:%@",error.description);
    }];


}

- (void)dealDataWithArray:(NSArray *)array {
    
    [RootClass mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"data" : @"Data"
                 };
    }];
    
    [Data mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"FileModel" : @"FileModel"
                 };
    }];
    
    NSArray *result = [RootClass mj_objectArrayWithKeyValuesArray:array];
    
    RootClass *rootClass = result[0];
    
    NSLog(@"++++++++++++++Result:%@",[rootClass.data[0] CreateTime]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
