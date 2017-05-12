//
//  DispenseRequest+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "DispenseRequest+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DispenseRequest (CoreDataProperties)

+ (NSFetchRequest<DispenseRequest *> *)fetchRequest;

@property (nonatomic) int32_t numberOfRepeatsAllowed;
@property (nullable, nonatomic, retain) Quantity *quantity;
@property (nullable, nonatomic, retain) Period *validityPeriod;

@end

NS_ASSUME_NONNULL_END
