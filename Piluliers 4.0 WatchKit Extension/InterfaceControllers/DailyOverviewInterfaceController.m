//
//  DailyOverviewInterfaceController.m
//  Piluliers 4.0
//
//  Created by Kolly Sandro, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "DailyOverviewInterfaceController.h"
#import "PillImageNameRow.h"
#import "TimeTitleRow.h"

@interface DailyOverviewInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *dayTable;
@property (nonatomic) NSDictionary *allPills;

@end

@implementation DailyOverviewInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    [self setTitle:NSLocalizedString(@"controller_title_back", nil)];
    self.allPills = (NSDictionary *)context;
    if (self.allPills) {
        [self setupTableWithData:self.allPills[@"todaysPills"]];
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - populate table

- (void) setupTableWithData:(NSArray *)allTimesArray {
    for (NSDictionary *timeSlotDict in allTimesArray) {
    
        //TODO get last index
        NSInteger index = self.dayTable.numberOfRows;
        [self.dayTable insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:index] withRowType:@"TimeTitleRow"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterNoStyle];
        [dateFormatter setDoesRelativeDateFormatting:YES];
        dateFormatter.locale = [NSLocale currentLocale];
        NSString *dateString = [dateFormatter stringFromDate:timeSlotDict[@"time"]];
        TimeTitleRow *row = (TimeTitleRow *)[self.dayTable rowControllerAtIndex:index];
        [row.timeLabel setText:dateString];
        
        NSArray *pillsToTake = timeSlotDict[@"pills"];
        
        for (NSDictionary *pill in pillsToTake) {
            index = self.dayTable.numberOfRows;
            [self.dayTable insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:index] withRowType:@"PillImageNameRow"];
            PillImageNameRow *row = (PillImageNameRow *)[self.dayTable rowControllerAtIndex:index];
            [row setPillImageNamed:pill[@"pictureName"]];
            [row.pillNameLabel setText:pill[@"name"]];
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:dateString forKey:@"time"];
            [dict addEntriesFromDictionary:pill];
            row.infoDict = dict;
            
        }
    }
}

-(void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    PillImageNameRow *row = (PillImageNameRow *)[self.dayTable rowControllerAtIndex:rowIndex];
    [self presentControllerWithName:@"TakePillInterfaceController" context:row.infoDict];
}
@end



