//
//  Package+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Package+CoreDataProperties.h"

@implementation Package (CoreDataProperties)

+ (NSFetchRequest<Package *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Package"];
}

@dynamic batch;
@dynamic container;
@dynamic content;

@end
