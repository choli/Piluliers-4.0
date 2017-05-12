//
//  RestManager.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestManager : NSObject
+ (RestManager *)sharedInstance;
- (void)initializeCoreData;
- (void)fetchMedicationRequest;
- (void)fetchMedicationsForPatient:(NSString *)patientId;
- (void)fetchPatientDataForPatient:(NSString *)patientId;
@end
