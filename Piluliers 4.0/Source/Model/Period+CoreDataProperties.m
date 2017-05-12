//
//  Period+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Period+CoreDataProperties.h"

@implementation Period (CoreDataProperties)

+ (NSFetchRequest<Period *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Period"];
}

@dynamic end;
@dynamic start;

@end
