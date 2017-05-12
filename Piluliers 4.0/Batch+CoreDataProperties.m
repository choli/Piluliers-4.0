//
//  Batch+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Batch+CoreDataProperties.h"

@implementation Batch (CoreDataProperties)

+ (NSFetchRequest<Batch *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Batch"];
}

@dynamic expirationDate;
@dynamic lotNumber;

@end
