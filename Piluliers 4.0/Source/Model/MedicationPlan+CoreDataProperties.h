//
//  MedicationPlan+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MedicationPlan+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MedicationPlan (CoreDataProperties)

+ (NSFetchRequest<MedicationPlan *> *)fetchRequest;

@property (nullable, nonatomic, retain) MedicationRequest *medications;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
