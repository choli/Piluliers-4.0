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

@interface AppDelegate ()
@property (nonatomic, strong) ConnectivityHandler *connectivityHandler;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Qrcode" bundle:nil];
    UINavigationController *loginNavigationController = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:@"BarCodeViewController"]];
    self.window.rootViewController = loginNavigationController;
    [self setupAppearance];
    [self.window makeKeyAndVisible];
    
    if ([WCSession isSupported]) {
        self.connectivityHandler = [ConnectivityHandler new];
    } else {
        NSLog(@"WatchConnectivity not supported");
    }
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
        if(!error){
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
    }];
    
    return YES;
}

//Called to get remote Token
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    const unsigned *tokenBytes = [deviceToken bytes];
    NSString *hexToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                          ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                          ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                          ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
    NSLog(@"The generated device token string is : %@",hexToken);
}

//Called when a notification is delivered to a foreground app.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
}

//Called to let your app know which action was selected by the user for a given notification.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{
    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
    completionHandler();
}

@end
