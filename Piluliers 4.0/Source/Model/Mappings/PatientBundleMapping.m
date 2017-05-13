//
//  PatientBundleMapping.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "PatientBundleMapping.h"

@implementation PatientBundleMapping
- (RKObjectMapping *)createMappingForAttachment:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Attachment" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"attachment"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"contentType" : @"contentType",
                                                  @"creation" : @"creation",
                                                  @"language" : @"language",
                                                  @"size": @"size",
                                                  @"title" : @"title",
                                                  @"url" : @"url"}];
    
    return mapping;
}

@end
