//
//  MedicationRequestData.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MedicationRequestData.h"

@implementation MedicationRequestData
- (NSDate *)startDate {
    return [[NSDate date] dateByAddingTimeInterval:-10];
}
@end
