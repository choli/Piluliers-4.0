//
//  Coding+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Coding+CoreDataProperties.h"

@implementation Coding (CoreDataProperties)

+ (NSFetchRequest<Coding *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Coding"];
}

@dynamic code;
@dynamic display;
@dynamic system;

@end
