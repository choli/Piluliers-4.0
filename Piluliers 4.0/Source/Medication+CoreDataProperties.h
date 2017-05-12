//
//  Medication+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Medication+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Medication (CoreDataProperties)

+ (NSFetchRequest<Medication *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *authoredOn;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, retain) DispenseRequest *dispenseRequest;
@property (nullable, nonatomic, retain) Dosage *dosageInstruction;
@property (nullable, nonatomic, retain) CodeableConcept *medicationCodeableConcept;
@property (nullable, nonatomic, retain) NSSet<Note *> *note;
@property (nullable, nonatomic, retain) CodeableConcept *reasonCode;

@end

@interface Medication (CoreDataGeneratedAccessors)

- (void)addNoteObject:(Note *)value;
- (void)removeNoteObject:(Note *)value;
- (void)addNote:(NSSet<Note *> *)values;
- (void)removeNote:(NSSet<Note *> *)values;

@end

NS_ASSUME_NONNULL_END
