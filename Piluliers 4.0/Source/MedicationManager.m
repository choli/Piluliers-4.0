//
//  MedicationManager.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "MedicationManager.h"
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

@implementation MedicationManager
    
- (void)fetchMedicationFromContext {
    
    NSManagedObjectContext *context = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Medication"];
    
    /*
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    fetchRequest.sortDescriptors = @[descriptor];
    */
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
}

- (void)fetchMedicationRequestFromContext {
    
    NSManagedObjectContext *context = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MedicationRequest"];
    
    /*
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    fetchRequest.sortDescriptors = @[descriptor];
    */
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSLog(@"FetchedObjects: %@", fetchedObjects);
}
@end
