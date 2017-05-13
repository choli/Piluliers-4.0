//
//  RestManager.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PatientData.h"

@interface RestManager : NSObject
+ (RestManager *)sharedInstance;
- (void)initializeCoreData;
- (void)fetchMedicationRequest;
- (void)fetchMedicationsForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSError *error))completionBlock;
- (void)fetchPatientDataForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSError *error))completionBlock;
- (void)getPatient:(NSString *)patentId withCompletionBlock:(void (^)(PatientData *patient, NSError *error))completionBlock;
@end
