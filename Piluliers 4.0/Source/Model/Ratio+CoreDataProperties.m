//
//  Ratio+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Ratio+CoreDataProperties.h"

@implementation Ratio (CoreDataProperties)

+ (NSFetchRequest<Ratio *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Ratio"];
}

@dynamic denumerator;
@dynamic numerator;

@end
