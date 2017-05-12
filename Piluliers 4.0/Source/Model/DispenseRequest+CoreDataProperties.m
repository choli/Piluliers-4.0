//
//  DispenseRequest+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "DispenseRequest+CoreDataProperties.h"

@implementation DispenseRequest (CoreDataProperties)

+ (NSFetchRequest<DispenseRequest *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"DispenseRequest"];
}

@dynamic numberOfRepeatsAllowed;
@dynamic quantity;
@dynamic validityPeriod;

@end
