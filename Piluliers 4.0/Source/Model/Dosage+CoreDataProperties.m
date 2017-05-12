//
//  Dosage+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Dosage+CoreDataProperties.h"

@implementation Dosage (CoreDataProperties)

+ (NSFetchRequest<Dosage *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Dosage"];
}

@dynamic sequence;
@dynamic text;
@dynamic doseQuantity;
@dynamic doseRange;
@dynamic route;
@dynamic timing;

@end
