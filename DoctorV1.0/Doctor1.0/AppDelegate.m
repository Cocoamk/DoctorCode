//
//  AppDelegate.m
//  Doctor1.0
//
//  Created by liuwp on 15/5/25.
//  Copyright (c) 2015年 cocoa-mk. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "UIColor+AddColor.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    
    MainViewController *mainView = [[MainViewController alloc]init];
    TwoViewController *twoView = [[TwoViewController alloc]init];
    ThreeViewController *threeView = [[ThreeViewController alloc]init];
    FourViewController *fourView = [[FourViewController alloc]init];
    FiveViewController *fiveView = [[FiveViewController alloc]init];
    
    UINavigationController *navi1 = [[UINavigationController alloc]initWithRootViewController:mainView];
    UINavigationController *navi2 = [[UINavigationController alloc]initWithRootViewController:twoView];
    UINavigationController *navi3 = [[UINavigationController alloc]initWithRootViewController:threeView];
    UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:fourView];
    UINavigationController *navi5 = [[UINavigationController alloc]initWithRootViewController:fiveView];
   
    UITabBarController *mainTabBar = [[UITabBarController alloc]init];
    mainTabBar.viewControllers = @[navi1, navi2, navi3, navi4,navi5];
    self.window.rootViewController = mainTabBar;
 
    navi1.title = @"主页";
    navi2.title = @"约名医";
    navi3.title = @"专属医院";
    navi4.title = @"海外医疗";
    navi5.title = @"联系";
    
    navi1.tabBarItem.image = [UIImage imageNamed:@"ic_home"];
    navi2.tabBarItem.image = [UIImage imageNamed:@"ic_huizhen"];
    navi3.tabBarItem.image = [UIImage imageNamed:@"ic_hospital"];
    navi4.tabBarItem.image = [UIImage imageNamed:@"ic_globe"];
    navi5.tabBarItem.image = [UIImage imageNamed:@"ic_call"];
    mainTabBar.tabBar.tintColor = [UIColor themeGreenColor];
  
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
