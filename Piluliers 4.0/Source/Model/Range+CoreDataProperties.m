//
//  Range+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Range+CoreDataProperties.h"

@implementation Range (CoreDataProperties)

+ (NSFetchRequest<Range *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Range"];
}

@dynamic high;
@dynamic low;

@end
