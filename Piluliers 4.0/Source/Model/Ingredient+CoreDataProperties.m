//
//  Ingredient+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Ingredient+CoreDataProperties.h"

@implementation Ingredient (CoreDataProperties)

+ (NSFetchRequest<Ingredient *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Ingredient"];
}

@dynamic isActive;
@dynamic amount;
@dynamic itemCodeableConcept;

@end
