//
//  Repeat+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Repeat+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Repeat (CoreDataProperties)

+ (NSFetchRequest<Repeat *> *)fetchRequest;

@property (nonatomic) int64_t frequency;
@property (nonatomic) double period;
@property (nonatomic) double periodMax;
@property (nullable, nonatomic, copy) NSString *periodUnit;
@property (nullable, nonatomic, retain) Period *boundsPeriod;
@property (nullable, nonatomic, retain) NSSet<EventTiming *> *when;

@end

@interface Repeat (CoreDataGeneratedAccessors)

- (void)addWhenObject:(EventTiming *)value;
- (void)removeWhenObject:(EventTiming *)value;
- (void)addWhen:(NSSet<EventTiming *> *)values;
- (void)removeWhen:(NSSet<EventTiming *> *)values;

@end

NS_ASSUME_NONNULL_END
