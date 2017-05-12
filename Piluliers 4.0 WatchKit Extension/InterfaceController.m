//
//  InterfaceController.m
//  Piluliers 4.0 WatchKit Extension
//
//  Created by Kolly Sandro, IT133 on 09.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *nextIntakeButton;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *iFeelBadButton;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self.nextIntakeButton setTitle:NSLocalizedString(@"button_next_intake", nil)];
    [self.iFeelBadButton setTitle:NSLocalizedString(@"button_i_feel_bad", nil)];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



