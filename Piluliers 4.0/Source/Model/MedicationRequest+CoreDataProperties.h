//
//  MedicationRequest+CoreDataProperties.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MedicationRequest+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MedicationRequest (CoreDataProperties)

+ (NSFetchRequest<MedicationRequest *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *authoredOn;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, retain) DispenseRequest *dispenseRequest;
@property (nullable, nonatomic, retain) NSSet<Dosage *> *dosageInstruction;
@property (nullable, nonatomic, retain) CodeableConcept *medicationCodeableConcept;
@property (nullable, nonatomic, retain) NSSet<Note *> *note;
@property (nullable, nonatomic, retain) CodeableConcept *reasonCode;

@end

@interface MedicationRequest (CoreDataGeneratedAccessors)

- (void)addDosageInstructionObject:(Dosage *)value;
- (void)removeDosageInstructionObject:(Dosage *)value;
- (void)addDosageInstruction:(NSSet<Dosage *> *)values;
- (void)removeDosageInstruction:(NSSet<Dosage *> *)values;

- (void)addNoteObject:(Note *)value;
- (void)removeNoteObject:(Note *)value;
- (void)addNote:(NSSet<Note *> *)values;
- (void)removeNote:(NSSet<Note *> *)values;

@end

NS_ASSUME_NONNULL_END
