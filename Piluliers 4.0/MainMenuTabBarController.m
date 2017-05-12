//
//  MainMenuTabBarController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MainMenuTabBarController.h"
#import "TimelineTableViewController.h"
#import "HistoryTableViewController.h"
#import "DrugsTableViewController.h"
#import "SettingsTableViewController.h"

@interface MainMenuTabBarController ()

@end

@implementation MainMenuTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarTabs];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)setupTabBarTabs {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    TimelineTableViewController *timelineTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"TimelineTableViewController"];
    UINavigationController *timelineNavigationController = [[UINavigationController alloc] initWithRootViewController:timelineTableViewController];
    timelineNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"timeline", nil) image:[UIImage imageNamed:@"timeline_icon"] tag:1];

    HistoryTableViewController *historyTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"HistoryTableViewController"];
    UINavigationController *historyNavigationController = [[UINavigationController alloc] initWithRootViewController:historyTableViewController];
    historyNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"history", nil) image:[UIImage imageNamed:@"history_icon"] tag:2];
    
    DrugsTableViewController *drugsTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"DrugsTableViewController"];
    UINavigationController *drugsNavigationController = [[UINavigationController alloc] initWithRootViewController:drugsTableViewController];
    drugsNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"drugs", nil) image:[UIImage imageNamed:@"drug_icon"] tag:3];
    
    SettingsTableViewController *settingsTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsTableViewController"];
    UINavigationController *settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:settingsTableViewController];
    settingsNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"settings", nil) image:[UIImage imageNamed:@"settings_icon"] tag:3];
    
    [self setViewControllers:@[timelineNavigationController, historyNavigationController, drugsNavigationController, settingsNavigationController]];
}

@end
