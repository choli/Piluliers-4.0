//
//  EventTiming+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "EventTiming+CoreDataProperties.h"

@implementation EventTiming (CoreDataProperties)

+ (NSFetchRequest<EventTiming *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"EventTiming"];
}

@dynamic value;

@end
