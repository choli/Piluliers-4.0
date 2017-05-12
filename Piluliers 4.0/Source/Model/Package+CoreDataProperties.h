//
//  Package+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Package+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Package (CoreDataProperties)

+ (NSFetchRequest<Package *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSSet<Batch *> *batch;
@property (nullable, nonatomic, retain) CodeableConcept *container;
@property (nullable, nonatomic, retain) NSSet<Content *> *content;

@end

@interface Package (CoreDataGeneratedAccessors)

- (void)addBatchObject:(Batch *)value;
- (void)removeBatchObject:(Batch *)value;
- (void)addBatch:(NSSet<Batch *> *)values;
- (void)removeBatch:(NSSet<Batch *> *)values;

- (void)addContentObject:(Content *)value;
- (void)removeContentObject:(Content *)value;
- (void)addContent:(NSSet<Content *> *)values;
- (void)removeContent:(NSSet<Content *> *)values;

@end

NS_ASSUME_NONNULL_END
