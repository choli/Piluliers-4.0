//
//  Dosage+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Dosage+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Dosage (CoreDataProperties)

+ (NSFetchRequest<Dosage *> *)fetchRequest;

@property (nonatomic) int64_t sequence;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) Quantity *doseQuantity;
@property (nullable, nonatomic, retain) Range *doseRange;
@property (nullable, nonatomic, retain) CodeableConcept *route;
@property (nullable, nonatomic, retain) Repeat *timing;

@end

NS_ASSUME_NONNULL_END
