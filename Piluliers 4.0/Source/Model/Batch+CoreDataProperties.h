//
//  Batch+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Batch+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Batch (CoreDataProperties)

+ (NSFetchRequest<Batch *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *expirationDate;
@property (nullable, nonatomic, copy) NSString *lotNumber;

@end

NS_ASSUME_NONNULL_END
