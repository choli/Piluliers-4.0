//
//  CodeableConcept+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "CodeableConcept+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CodeableConcept (CoreDataProperties)

+ (NSFetchRequest<CodeableConcept *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, retain) NSSet<Coding *> *coding;

@end

@interface CodeableConcept (CoreDataGeneratedAccessors)

- (void)addCodingObject:(Coding *)value;
- (void)removeCodingObject:(Coding *)value;
- (void)addCoding:(NSSet<Coding *> *)values;
- (void)removeCoding:(NSSet<Coding *> *)values;

@end

NS_ASSUME_NONNULL_END
