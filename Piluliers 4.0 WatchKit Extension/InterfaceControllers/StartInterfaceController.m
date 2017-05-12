//
//  InterfaceController.m
//  Piluliers 4.0 WatchKit Extension
//
//  Created by Kolly Sandro, IT133 on 09.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "StartInterfaceController.h"
#import "PillImageNameRow.h"


@interface StartInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nextReminderLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *timeLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *ampmLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *pillsTable;
@end


@implementation StartInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self.nextReminderLabel setText:NSLocalizedString(@"label_next_reminder", nil)];
    [self loadDataForTable];
    [self setupTable];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - load Data for next reminder
- (void)setNextReminderTime:(NSDate *)nextReminderDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"HH:mm"];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setDoesRelativeDateFormatting:YES];
    dateFormatter.locale = [NSLocale currentLocale];
    [self.timeLabel setText:[dateFormatter stringFromDate:nextReminderDate]];
    //TODO: set AM/PM in own label
    [self.ampmLabel setText:@""];
}

#pragma mark - setup table and load data for it
- (NSDictionary *)loadDataForTable {
    return @{@"time" : [NSDate dateWithTimeIntervalSince1970:1494591300],
             @"pills" : @[@{
                              @"name" : @"Mydocalm",
                              @"pictureName": @"pill.png"
                              },
                          @{
                              @"name" : @"Aricept",
                              @"pictureName": @"capsule.png"
                              }]
             };
}

- (void)setupTable {
    NSDictionary *nextReminderData = [self loadDataForTable];
    [self setNextReminderTime:nextReminderData[@"time"]];
    
    NSArray *pillsToTake = nextReminderData[@"pills"];
    [self.pillsTable setNumberOfRows:pillsToTake.count withRowType:@"PillImageNameRow"];
    
    for (NSDictionary *pill in pillsToTake) {
        PillImageNameRow *row = (PillImageNameRow *)[self.pillsTable rowControllerAtIndex:[pillsToTake indexOfObject:pill]];
        [row.pillImage setImage:nil];
        [row.pillNameLabel setText:pill[@"name"]];
    }
}


@end



