//
//  BoundsRange+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "BoundsRange+CoreDataProperties.h"

@implementation BoundsRange (CoreDataProperties)

+ (NSFetchRequest<BoundsRange *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"BoundsRange"];
}

@dynamic high;
@dynamic low;

@end
