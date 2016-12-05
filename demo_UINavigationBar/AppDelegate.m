//
//  AppDelegate.m
//  demo_UINavigationBar
//
//  Created by FCS on 12/3/16.
//  Copyright © 2016 FCS. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationBarController.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    NavigationBarController *mainViewController = [[NavigationBarController alloc] initWithNibName:@"NavigationBarController" bundle:nil];
    // Add create and configure the navigation controller.
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    self.window.rootViewController = nav;
    // Configure and display the window.
    [self.window addSubview:nav.view];
    [self.window makeKeyAndVisible];
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]
//                                                   bounds]];
//    // Override point for customization after application launch.
//    UIViewController *viewController1 = [[NavigationBarController alloc]
//                                         initWithNibName:@"NavigationBarController" bundle:nil];
//    UIViewController *viewController2 = [[SecondViewController alloc]
//                                         initWithNibName:@"SecondViewController" bundle:nil];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController1];
//    self.tabBarController = [[UITabBarController alloc] init];
//    self.tabBarController.viewControllers = @[viewController1,
//                                              viewController2];
//    viewController1.title = @"HOME";
//    viewController2.title = @"PAGE2";
//    self.window.rootViewController = self.tabBarController;
//    [self.window makeKeyAndVisible];
    return YES;
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
