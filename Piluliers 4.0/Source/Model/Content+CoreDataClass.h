//
//  Content+CoreDataClass.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CodeableConcept, Quantity;

NS_ASSUME_NONNULL_BEGIN

@interface Content : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Content+CoreDataProperties.h"
