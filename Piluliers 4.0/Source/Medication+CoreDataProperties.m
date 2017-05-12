//
//  Medication+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Medication+CoreDataProperties.h"

@implementation Medication (CoreDataProperties)

+ (NSFetchRequest<Medication *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Medication"];
}

@dynamic authoredOn;
@dynamic id;
@dynamic dispenseRequest;
@dynamic dosageInstruction;
@dynamic medicationCodeableConcept;
@dynamic note;
@dynamic reasonCode;

@end
