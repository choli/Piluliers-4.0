//
//  MedicationPlan+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MedicationPlan+CoreDataProperties.h"

@implementation MedicationPlan (CoreDataProperties)

+ (NSFetchRequest<MedicationPlan *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MedicationPlan"];
}

@dynamic medications;
@dynamic user;

@end
