//
//  HUD.m
//  Tool
//
//  Created by Justin on 2017/12/4.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "HUD.h"


@implementation HUD


/**************************************HUD属性配置***********************************/
/**
 设置DefaultStyle
 */
+ (void)setDefaultStyle {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}

/**************************************HUD隐藏**************************************/

/**
 隐藏HUD
 */
+ (void)dismiss {
    [SVProgressHUD dismiss];
}

/**
 隐藏HUD（有延时）

 @param delay 延时的时间
 */
+ (void)dismissWithDelay:(NSTimeInterval)delay {
    [SVProgressHUD dismissWithDelay:delay];
}

/**************************************HUD显示**************************************/

/**
 显示HUD
 */
+ (void)show {
    [self setDefaultStyle];
    [SVProgressHUD show];
}

/**
 显示HUD（带状态描述）

 @param string 状态描述
 */
+ (void)showWithStatus:(NSString*)string {
    [self setDefaultStyle];
    [SVProgressHUD showWithStatus:string];
}


/**
 显示HUD（带进度）

 @param progress 进度
 */
+ (void)showProgress:(CGFloat)progress {
    [self setDefaultStyle];
    [SVProgressHUD showProgress:progress];
}


/**
 显示HUD（带进度和状态）

 @param progress 进度
 @param status 状态描述
 */
+ (void)showProgress:(CGFloat)progress status:(NSString*)status {
    [SVProgressHUD showProgress:progress status:status];
}

/**
 显示HUD（成功的状态）

 @param string 状态描述
 */
+ (void)showSuccessWithStatus:(NSString*)string {
    [SVProgressHUD showSuccessWithStatus:string];
}

/**
 显示HUD（错误的状态）

 @param string 状态描述
 */
+ (void)showErrorWithStatus:(NSString*)string {
    [SVProgressHUD showErrorWithStatus:string];
}

/**
 显示HUD（自定义图片）

 @param image 图片对象
 @param string 状态描述
 */
+ (void)showImage:(UIImage*)image status:(NSString*)string {
    [self setDefaultStyle];
    [SVProgressHUD showImage:image status:string];
}




@end
