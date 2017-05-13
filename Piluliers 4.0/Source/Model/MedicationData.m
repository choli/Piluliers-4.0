//
//  MedicationData.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MedicationData.h"

@implementation MedicationData
- (NSString *)medicationId {
    if (self.json != nil) {
        return [self.json objectForKey:@"id"];
    }
    return nil;
}

- (NSString *)title {
    if (self.json != nil) {
        return [[self.json objectForKey:@"code"] objectForKey:@"text"];
    }
    return nil;
}

- (NSString *)form {
    if (self.json != nil) {
        NSArray *codings = [[self.json objectForKey:@"form"] objectForKey:@"coding"];
        return [[codings objectAtIndex:0] objectForKey:@"code"];
    }
    return nil;
}

- (NSArray *)timings {
    NSMutableArray *timingValues = [NSMutableArray new];
    if (self.json != nil) {
        
    }
    return timingValues;
}

@end
