//
//  AppDelegate.m
//  Piluliers 4.0
//
//  Created by Kolly Sandro, IT133 on 09.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "AppDelegate.h"
#import "MainMenuTabBarController.h"
#import "ConnectivityHandler.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import "AppDelegate+Appearance.h"
#import "BarCodeViewController.h"
#import "RestManager.h"
#import "MedicationData.h"

@interface AppDelegate ()
@property (nonatomic, strong) ConnectivityHandler *connectivityHandler;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIStoryboard * uiStroyboard = [UIStoryboard storyboardWithName:@"Qrcode" bundle:nil];
    
    /*
    RestManager *restManager = [RestManager sharedInstance];
    [restManager getMedicationsForPatient:@".PAT_10" withCompletionBlock:^(NSArray *medications, NSError *error) {
        for (MedicationData *medication in medications) {
            NSLog(@"Medication Name: %@", medication.title);
            NSLog(@"Medication Form: %@", medication.form);
            NSLog(@"Medication Timing: %@", [medication timings]);
        }
    }];
    */
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [uiStroyboard instantiateViewControllerWithIdentifier:@"BarCodeViewController"];
    [self setupAppearance];
    [self.window makeKeyAndVisible];
    
    if ([WCSession isSupported]) {
        self.connectivityHandler = [ConnectivityHandler new];
    } else {
        NSLog(@"WatchConnectivity not supported");
    }
    
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
