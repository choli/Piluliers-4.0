//
//  MedicationPlan+CoreDataClass.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MedicationRequest, User;

NS_ASSUME_NONNULL_BEGIN

@interface MedicationPlan : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "MedicationPlan+CoreDataProperties.h"
