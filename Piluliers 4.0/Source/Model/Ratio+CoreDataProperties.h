//
//  Ratio+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Ratio+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Ratio (CoreDataProperties)

+ (NSFetchRequest<Ratio *> *)fetchRequest;

@property (nullable, nonatomic, retain) Quantity *denumerator;
@property (nullable, nonatomic, retain) Quantity *numerator;

@end

NS_ASSUME_NONNULL_END
