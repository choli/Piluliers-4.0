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
        if (codings != nil)
            return [[codings objectAtIndex:0] objectForKey:@"code"];
    }
    return nil;
}

- (NSString *)formImageName {
    
    NSDictionary *formImageDict = @{
                                    @"PILL": @"pill",
                                    @"CAP": @"capsule"};
    return self.form != nil ? [formImageDict objectForKey:self.form] : nil;
}

- (NSString *)quantity {
    return @"12 Pills";
}

- (NSString *)frequency {
    return @"3 times daily";
}

- (NSString *)duration {
    return @"6 weeks";
}

- (NSString *)startDate {
    return @"11.05.2017";
}

- (NSString *)time {
    return @"08:00, 12:00, 18:00";
}

- (NSString *)notes {
    return @"Before eating";
}

@end
