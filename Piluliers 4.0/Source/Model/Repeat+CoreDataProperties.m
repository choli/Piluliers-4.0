//
//  Repeat+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Repeat+CoreDataProperties.h"

@implementation Repeat (CoreDataProperties)

+ (NSFetchRequest<Repeat *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Repeat"];
}

@dynamic frequency;
@dynamic period;
@dynamic periodMax;
@dynamic periodUnit;
@dynamic boundsPeriod;
@dynamic when;

@end
