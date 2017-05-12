//
//  AppDelegate+Appearance.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "AppDelegate+Appearance.h"
#import "UIColor+CustomColors.h"

@implementation AppDelegate (Appearance)

- (void)setupAppearance {
    [[UINavigationBar appearance] setBarTintColor:[UIColor hackathonTintColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setUnselectedItemTintColor:[UIColor hackathonAccentColor]];
    [[UITabBar appearance] setTintColor:[UIColor hackathonTintColor]];
    [[UIButton appearance] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
