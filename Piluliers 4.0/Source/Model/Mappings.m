//
//  Mappings.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "Mappings.h"

@implementation Mappings
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

- (RKObjectMapping *)createMappingForBatch:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Batch" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"batch"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"expirationDate" : @"expirationDate",
                                                  @"lotNumber" : @"lotNumber"}];
    
    return mapping;
}

- (RKObjectMapping *)createMappingForBoundsRange:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"BoundsRange" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"boundsrange"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"high" : @"high",
                                                  @"low" : @"low"}];
    
    return mapping;
}


- (RKObjectMapping *)createMappingForCoding:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Coding" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"coding"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"code" : @"code",
                                                  @"display" : @"display",
                                                  @"system": @"system"}];
    
    return mapping;
}

- (RKObjectMapping *)createMappingForCodableConcept:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"CodableConcept" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"codableconcept"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"text" : @"text"}];
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"coding" toKeyPath:@"coding" withMapping:[self createMappingForCoding:managedObjectStore]]];

    return mapping;
}

- (RKObjectMapping *)createMappingForContent:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Content" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"content"]; // TBD

    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"itemCodeableConcept" toKeyPath:@"itemCodeableConcept" withMapping:[self createMappingForCodableConcept:managedObjectStore]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"amount" toKeyPath:@"amount" withMapping:[self createMappingForQuantity:managedObjectStore]]];
    
    return mapping;
}

- (RKObjectMapping *)createMappingForDispenseRequest:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"DispenseRequest" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"dispenseRequest"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"numberOfRepeatsAllowed" : @"numberOfRepeatsAllowed"}];
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"quantity" toKeyPath:@"quantity" withMapping:[self createMappingForQuantity:managedObjectStore]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"validityPeriod" toKeyPath:@"validityPeriod" withMapping:[self createMappingForPeriod:managedObjectStore]]];
    return mapping;
}




- (RKObjectMapping *)createMappingForQuantity:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Quantity" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"quantity"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"code" : @"code",
                                                  @"comparator" : @"comparator",
                                                  @"system": @"system",
                                                  @"unit": @"unit",
                                                  @"value": @"value"}];
    
    return mapping;
}

- (RKObjectMapping *)createMappingForPeriod:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"Period" inManagedObjectStore:managedObjectStore];
    
    mapping.identificationAttributes = @[@"period"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"end" : @"end",
                                                  @"start" : @"start"}];
    return mapping;
}


+ (RKObjectMapping *)createMappingMedicationRequest:(RKManagedObjectStore *)managedObjectStore {
    RKEntityMapping *mapping = [RKEntityMapping mappingForEntityForName:@"MedicationRequest" inManagedObjectStore:managedObjectStore];
    
    // mapping.identificationAttributes = @[@"period"]; // TBD
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"id" : @"id",
                                                  @"authoredOn" : @"authoredOn"}];
    return mapping;
}

@end
