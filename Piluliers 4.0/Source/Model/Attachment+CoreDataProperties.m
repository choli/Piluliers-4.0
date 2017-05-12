//
//  Attachment+CoreDataProperties.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Attachment+CoreDataProperties.h"

@implementation Attachment (CoreDataProperties)

+ (NSFetchRequest<Attachment *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Attachment"];
}

@dynamic contentType;
@dynamic creation;
@dynamic language;
@dynamic size;
@dynamic title;
@dynamic url;

@end
