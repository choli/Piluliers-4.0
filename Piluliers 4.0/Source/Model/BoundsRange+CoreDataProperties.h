//
//  BoundsRange+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "BoundsRange+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface BoundsRange (CoreDataProperties)

+ (NSFetchRequest<BoundsRange *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *high;
@property (nullable, nonatomic, copy) NSDate *low;

@end

NS_ASSUME_NONNULL_END
