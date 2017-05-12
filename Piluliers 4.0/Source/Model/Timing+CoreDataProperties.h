//
//  Timing+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Timing+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Timing (CoreDataProperties)

+ (NSFetchRequest<Timing *> *)fetchRequest;

@property (nullable, nonatomic, retain) CodeableConcept *code;
@property (nullable, nonatomic, retain) CodeableConcept *repeat;

@end

NS_ASSUME_NONNULL_END
