//
//  MainMenuTabBarController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MainMenuTabBarController.h"
#import "TimelineTableViewController.h"

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
    timelineNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"timeline", nil) image:[UIImage imageNamed:@"stoecklim"] tag:1];

    UIViewController *historyViewController = [UIViewController new];
    historyViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"history", nil) image:[UIImage imageNamed:@"stoecklim"] tag:2];
    
    UIViewController *drugsViewController = [UIViewController new];
    drugsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"drugs", nil) image:[UIImage imageNamed:@"stoecklim"] tag:3];
    
    UIViewController *settingsViewController = [UIViewController new];
    settingsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"settings", nil) image:[UIImage imageNamed:@"stoecklim"] tag:4];
    
    [self setViewControllers:@[timelineNavigationController, historyViewController, drugsViewController, settingsViewController]];
}

@end
