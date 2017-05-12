//
//  Quantity+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Quantity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Quantity (CoreDataProperties)

+ (NSFetchRequest<Quantity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *comparator;
@property (nullable, nonatomic, copy) NSString *system;
@property (nullable, nonatomic, copy) NSString *unit;
@property (nonatomic) double value;

@end

NS_ASSUME_NONNULL_END
