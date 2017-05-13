//
//  HistoryGraphView.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "HistoryGraphView.h"

@implementation HistoryGraphView

-(void)populateData {
    LCLineChartData *d = [LCLineChartData new];
    d.xMin = 0;
    d.xMax = 6;
    d.color = [UIColor whiteColor];
    d.itemCount = 7;
    
    NSMutableArray *vals = [NSMutableArray new];
    for(NSUInteger i = 0; i < d.itemCount; ++i) {
        [vals addObject:@((arc4random_uniform(3) + 1))];
    }
    
    d.getData = ^(NSUInteger item) {
        float x = item;
        float y = [vals[item] floatValue];
        NSString *labelX = [NSString stringWithFormat:@""];
        NSString *labelY = y == 1 ? @"☹️" : y == 2 ? @"😐" : @"😃";
        return [LCLineChartDataItem dataItemWithX:x y:y xLabel:labelX dataLabel:labelY];
    };
    
    self.yMin = 1;
    self.yMax = 3;
    self.ySteps = @[@"☹️",
                    @"😐",
                    @"😃"];
    self.data = @[d];
    [self showLegend:NO animated:NO];
}

@end
