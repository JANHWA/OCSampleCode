//
//  AppDelegate.m
//  3DTouch
//
//  Created by Justin on 2017/7/18.
//  Copyright © 2017年 Justin. All rights reserved.
//

#import "AppDelegate.h"
#import "SecondViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**
     *  通过代码实现动态菜单
     *  一般情况下设置主标题、图标、type等，副标题是不设置的 - 简约原则
     *  iconWithTemplateImageName 自定义的icon
     *  iconWithType 系统的icon
     */
    //系统ShortcutIcon
    UIApplicationShortcutIcon *favrite = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeFavorite];
    
    UIApplicationShortcutItem *itemOne = [[UIApplicationShortcutItem alloc] initWithType:@"favrite" localizedTitle:@"时尚之都" localizedSubtitle:nil icon:favrite userInfo:nil];
    
    UIApplicationShortcutIcon *bookMark = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeBookmark];
    
    UIApplicationShortcutItem *itemTwo = [[UIApplicationShortcutItem alloc] initWithType:@"book" localizedTitle:@"知识海洋" localizedSubtitle:nil icon:bookMark userInfo:nil];
    
    //自定义ShortcutIcon
    UIApplicationShortcutIcon *iconContact = [UIApplicationShortcutIcon iconWithTemplateImageName:@"contact"];
    
    UIApplicationShortcutItem *itemThree = [[UIApplicationShortcutItem alloc] initWithType:@"contact" localizedTitle:@"联系的人" localizedSubtitle:nil icon:iconContact userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[itemOne,itemTwo,itemThree];
    return YES;
}

//菜单跳转
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    
    /*
     *  方式one - localizedTitle
     if ([shortcutItem.localizedTitle isEqualToString:@"时尚之都"]) {
     tabBarVC.selectedIndex = 0;
     }else if ([shortcutItem.localizedTitle isEqualToString:@"知识海洋"]){ //知识海洋
     tabBarVC.selectedIndex = 1;
     }else{
     tabBarVC.selectedIndex = 2; //联系的人
     }
     */
    
    //方式two - type
    if ([shortcutItem.type isEqualToString:@"favrite"]) { //时尚之都
//        tabBarVC.selectedIndex = 0;
        
        ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        self.window.rootViewController = nav;
        
        SecondViewController *secondVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SecondViewController"];
        
        [nav pushViewController:secondVC animated:YES];
        
        
        
        
    }else if ([shortcutItem.type isEqualToString:@"book"]){ //知识海洋
//        tabBarVC.selectedIndex = 1;
    }else{
//        tabBarVC.selectedIndex = 2; //联系的人
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
