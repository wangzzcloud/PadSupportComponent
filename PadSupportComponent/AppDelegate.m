//
//  AppDelegate.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "AppDelegate.h"

#import "MyTabBarController.h"

#import "PadMainViewContrller.h"
#import "PadDetailViewController.h"
#import "PadSplitHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    [self setupRootViewController];
    
    return YES;
}

- (void)setupRootViewController {


    BOOL IS_PAD = UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad;
    
    if (IS_PAD) {
        /**
         当设备为iPad时，要保证 PadBaseViewController 的子类初始化在 PadDetailViewController初始化 之后，方便设置代理。
         */
        PadDetailViewController *detailController = [[PadDetailViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:detailController];
        [PadSplitHelper helper].detailController = detailController;
        
        MyTabBarController *tabBarController = [[MyTabBarController alloc] init];
        UINavigationController *tabBarNavi = [[UINavigationController alloc] initWithRootViewController:tabBarController];

        
        PadMainViewContrller *mainController = [[PadMainViewContrller alloc] init];
        mainController.viewControllers = @[tabBarNavi, navi];
        //mainController.pad_TabBar = tabBarNavi;
        self.window.rootViewController = mainController;
    }else {
        MyTabBarController *tabBarController = [[MyTabBarController alloc] init];
        UINavigationController *tabBarNavi = [[UINavigationController alloc] initWithRootViewController:tabBarController];

        self.window.rootViewController = tabBarNavi;
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
