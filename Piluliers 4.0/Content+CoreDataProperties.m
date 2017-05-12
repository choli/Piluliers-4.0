//
//  Content+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Content+CoreDataProperties.h"

@implementation Content (CoreDataProperties)

+ (NSFetchRequest<Content *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Content"];
}

@dynamic amount;
@dynamic itemCodeableConcept;

@end
