//
//  RestManager.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "RestManager.h"
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

@interface RestManager ()
@property (nonatomic, nullable) RKManagedObjectStore *managedObjectStore;

@end

@implementation RestManager
    
+ (RestManager *)sharedInstance
    {
        static RestManager *_shared = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            _shared = [[self alloc] init];
            
        });
        
        return _shared;
    }

- (void)initializeCoreData {
    
    NSURL *baseURL = [NSURL URLWithString:@"http://api.feedzilla.com"];
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
    [RKObjectManager setSharedManager:objectManager];
    
    // Initialize managed object model from bundle
    NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    // Initialize managed object store
    self.managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    objectManager.managedObjectStore = self.managedObjectStore;
    
    [self.managedObjectStore createPersistentStoreCoordinator];
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"PiluliersDB.sqlite"];

    NSError *error;
    NSPersistentStore *persistentStore = [self.managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    NSAssert(persistentStore, @"Failed to add persistent store with error: %@", error);
    
    // Create the managed object contexts
    [self.managedObjectStore createManagedObjectContexts];
    
    // Configure a managed object cache to ensure we do not create duplicate objects
    self.managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:self.managedObjectStore.persistentStoreManagedObjectContext];
}
    
- (RKObjectMapping *)createMedicationMapping {
    RKEntityMapping *medicationMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:self.managedObjectStore];
    
    return medicationMapping;
}
    
- (RKObjectMapping *)createMedicationRequestMapping {
    RKEntityMapping *medicationRequestMapping = [RKEntityMapping mappingForEntityForName:@"Article" inManagedObjectStore:self.managedObjectStore];
    
    return medicationRequestMapping;
}

- (void)fetchMedication {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self createMedicationMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
    }];
}

@end
