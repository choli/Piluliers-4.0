//
//  Quantity+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Quantity+CoreDataProperties.h"

@implementation Quantity (CoreDataProperties)

+ (NSFetchRequest<Quantity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Quantity"];
}

@dynamic code;
@dynamic comparator;
@dynamic system;
@dynamic unit;
@dynamic value;

@end
