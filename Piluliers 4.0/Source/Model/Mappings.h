//
//  Mappings.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
#import <RestKit/RestKit.h>

@interface Mappings : NSObject
+ (RKObjectMapping *)createMappingMedicationRequest:(RKManagedObjectStore *)managedObjectStore;
@end
