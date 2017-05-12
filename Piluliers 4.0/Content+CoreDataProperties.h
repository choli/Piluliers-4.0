//
//  Content+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Content+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Content (CoreDataProperties)

+ (NSFetchRequest<Content *> *)fetchRequest;

@property (nullable, nonatomic, retain) Quantity *amount;
@property (nullable, nonatomic, retain) CodeableConcept *itemCodeableConcept;

@end

NS_ASSUME_NONNULL_END
