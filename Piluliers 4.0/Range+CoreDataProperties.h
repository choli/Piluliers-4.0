//
//  Range+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Range+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Range (CoreDataProperties)

+ (NSFetchRequest<Range *> *)fetchRequest;

@property (nullable, nonatomic, retain) Quantity *high;
@property (nullable, nonatomic, retain) Quantity *low;

@end

NS_ASSUME_NONNULL_END
