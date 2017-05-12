//
//  Timing+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Timing+CoreDataProperties.h"

@implementation Timing (CoreDataProperties)

+ (NSFetchRequest<Timing *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Timing"];
}

@dynamic code;
@dynamic repeat;

@end
