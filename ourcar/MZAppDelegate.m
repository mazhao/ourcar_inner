//
//  MZAppDelegate.m
//  ourcar
//
//  Created by mazhao on 14-3-10.
//  Copyright (c) 2014年 MZ. All rights reserved.
//

#import "MZAppDelegate.h"
#import "MZLeftViewController.h"
#import "MZRightViewController.h"
#import "MZCenterViewController.h"
#import "MZBaseNavigationController.h"
#import "MMDrawerController.h"


@interface MZAppDelegate ()
@property (nonatomic,strong) MMDrawerController * drawerController;

@end


@implementation MZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController * leftvc = [[MZLeftViewController alloc] init];
    
    UIViewController * centervc = [[MZCenterViewController alloc] init];
    UINavigationController * centernc = [[MZBaseNavigationController alloc] initWithRootViewController:centervc];
    
    if(OSVersionIsAtLeastiOS7()){
        UINavigationController * leftSideNavController = [[MZBaseNavigationController alloc] initWithRootViewController:leftvc];
      
        self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:centernc leftDrawerViewController:leftSideNavController];
        [self.drawerController setShowsShadow:NO];
    } else {
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:centernc
                                 leftDrawerViewController:leftvc ];
    }
    [self.drawerController setMaximumLeftDrawerWidth:280.0f];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    if(OSVersionIsAtLeastiOS7()){
        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                              green:173.0/255.0
                                               blue:234.0/255.0
                                              alpha:1.0];
        [self.window setTintColor:tintColor];
    }
    [self.window setRootViewController:self.drawerController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
