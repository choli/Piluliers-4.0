//
//  InterfaceController.m
//  Piluliers 4.0 WatchKit Extension
//
//  Created by Kolly Sandro, IT133 on 09.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "StartInterfaceController.h"
#import "PillImageNameRow.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface StartInterfaceController () <WCSessionDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nextReminderLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *timeLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *ampmLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *pillsTable;
@property (nonatomic) WCSession *session;
@end


@implementation StartInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self.nextReminderLabel setText:NSLocalizedString(@"label_next_reminder", nil)];
    
    self.session = [WCSession defaultSession];
    self.session.delegate = self;
    [self.session activateSession];
    [self.timeLabel setText:@""];
    [self.ampmLabel setText:@""];
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

#pragma mark - WCSession delegate
-(void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error {
    if (!error) {
        if (activationState == WCSessionActivationStateActivated) {
            [self loadDataForTable];
        } else {
            NSLog(@"some other status than connected!");
        }
    } else {
        WKAlertAction *action = [WKAlertAction actionWithTitle:NSLocalizedString(@"alert_ok", nil) style:WKAlertActionStyleCancel handler:^(void){
            //TODO: Error action
            
        }];
        
        [self presentAlertControllerWithTitle:NSLocalizedString(@"alert_title_error", nil) message:NSLocalizedString(@"alert_message_no_connection", nil) preferredStyle:WKAlertControllerStyleAlert actions:@[action]];
    }
}


#pragma mark - setup table and load data for it
- (NSDictionary *)loadDummyDataForTable {
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

- (void)loadDataForTable {
    [self.session sendMessage:@{@"request":@"dummy"}
                 replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
                     [self setupTableWithDict:replyMessage];
                 } errorHandler:^(NSError * _Nonnull error) {
                     NSLog(@"Error: %@", error.localizedDescription);
                 }];
}

- (void)setupTableWithDict:(NSDictionary *)nextReminderData {
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



