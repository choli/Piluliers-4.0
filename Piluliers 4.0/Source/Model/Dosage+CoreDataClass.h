//
//  Dosage+CoreDataClass.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CodeableConcept, Quantity, Range, Repeat;

NS_ASSUME_NONNULL_BEGIN

@interface Dosage : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Dosage+CoreDataProperties.h"
