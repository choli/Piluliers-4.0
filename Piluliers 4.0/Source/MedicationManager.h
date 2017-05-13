//
//  MedicationManager.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedicationManager : NSObject
- (NSMutableDictionary *)medicationForDate:(NSDate *)date;
- (void)saveMedication:(NSMutableDictionary *)data toDate:(NSDate *)date;
- (NSDictionary *)getDayListFromMedications:(NSArray *)medications;
- (void)getDailyMedicationsForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSDictionary *medications, NSError *error))completionBlock;
+ (NSString *)timeStringForTiming:(NSString *)timing;
@end
