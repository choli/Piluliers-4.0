//
//  TakePillInterfaceController.m
//  Piluliers 4.0
//
//  Created by Kolly Sandro, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TakePillInterfaceController.h"

@interface TakePillInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *infoLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *pillImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *quantityTimeLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *takeButton;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *skipButton;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *ignoreButton;

@end

@implementation TakePillInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    NSDictionary *dict = (NSDictionary *)context;
    [self.nameLabel setText:dict[@"name"]];
    [self.infoLabel setText:dict[@"info"]];
    [self.pillImage setImage:dict[@"pictureName"]];
    [self.quantityTimeLabel setText:[NSString stringWithFormat:@"%@, %@",dict[@"amount"], dict[@"time"]]];
    [self.takeButton setBackgroundColor:[self cellSwipeTakeColor]];
    [self.skipButton setBackgroundColor:[self cellSwipeSkipColor]];
    [self.ignoreButton setBackgroundColor:[self cellSwipeIgnoreColor]];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (UIColor*)cellSwipeTakeColor {
    return [UIColor colorWithRed:139/255.0 green:195/255.0 blue:74/255.0 alpha:1];
}

- (UIColor*)cellSwipeSkipColor {
    return [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];//colorWithHexString:@"#FFEB3B"];
}

- (UIColor*)cellSwipeIgnoreColor {
    return [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];//colorWithHexString:@"#E74C3C"];
}

@end



