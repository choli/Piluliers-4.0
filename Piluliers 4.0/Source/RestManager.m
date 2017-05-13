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
#import "Mappings.h"
#import "MedicationManager.h"
#import "ConfigurationManager.h"
#import <AFNetworking/AFNetworking.h>

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
    // https://hackathon.test.docdesk.ch:4443/medication-web-module/hackathon/fhir
    
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"application/fhir+json"];

    NSURL *baseURL = [NSURL URLWithString:[ConfigurationManager baseUrl]];
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:baseURL];
    objectManager.HTTPClient.allowsInvalidSSLCertificate = YES;
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
    RKObjectMapping *medicationRequestMapping = [Mappings createMappingMedicationRequest:self.managedObjectStore];
    
    return medicationRequestMapping;
}

- (void)fetchMedication {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self createMedicationMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)fetchMedicationRequest {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self createMedicationRequestMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    // @"medicationrequest0312.json"
    [[RKObjectManager sharedManager] getObjectsAtPath:@"Medication?patient_id=.PAT_10&_format=json" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"Success");
        MedicationManager *medicationManager = [[MedicationManager alloc] init];
        [medicationManager fetchMedicationRequestFromContext];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Failure");
    }];
}

- (void)fetchPatient {
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self createMedicationRequestMapping] method:RKRequestMethodGET pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    // @"medicationrequest0312.json"
    [[RKObjectManager sharedManager] getObjectsAtPath:@"Medication?patient_id=.PAT_10&_format=json" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"Success");
        MedicationManager *medicationManager = [[MedicationManager alloc] init];
        [medicationManager fetchMedicationRequestFromContext];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Failure");
    }];
}

- (void)fetchMedicationsForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSError *error))completionBlock {
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Medication?patient_id=%@&_format=json", [ConfigurationManager baseUrl], patientId]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"application/fhir+json"];

    [manager GET:[NSString stringWithFormat:@"%@/Medication?patient_id=%@&_format=json", [ConfigurationManager baseUrl], patientId] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.post.it.Pilulier4"];
        [userDefaults setObject:responseObject forKey:@"medications"];
        [userDefaults synchronize];

        if (completionBlock != nil) {
            completionBlock(nil);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (completionBlock != nil) {
            completionBlock(error);
        }
    }];
}

- (void)fetchPatientDataForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSError *error))completionBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@/Patient?patient_id=%@&_format=json", [ConfigurationManager baseUrl], patientId];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"application/fhir+json"];
    
    [manager GET:[NSString stringWithFormat:url, [ConfigurationManager baseUrl], patientId] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.post.it.Pilulier4"];
        [userDefaults setObject:responseObject forKey:@"patient"];
        [userDefaults synchronize];
        if (completionBlock != nil) {
            completionBlock(nil);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (completionBlock != nil) {
            completionBlock(error);
        }
    }];
}

- (void)fetchMedicationForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSError *error))completionBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@/Medication?patient_id=%@&_format=json", [ConfigurationManager baseUrl], patientId];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"application/fhir+json"];
    
    [manager GET:[NSString stringWithFormat:url, [ConfigurationManager baseUrl], patientId] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.post.it.Pilulier4"];
        [userDefaults setObject:responseObject forKey:@"medication"];
        [userDefaults synchronize];
        if (completionBlock != nil) {
            completionBlock(nil);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (completionBlock != nil) {
            completionBlock(error);
        }
    }];
}

- (void)fetchMedicationRequestForPatient:(NSString *)patientId withCompletionBlock:(void (^)(NSError *error))completionBlock {
    
    NSString *url = [NSString stringWithFormat:@"%@/MedicationRequest?patient_id=%@&_format=json", [ConfigurationManager baseUrl], patientId];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"application/fhir+json"];
    
    [manager GET:[NSString stringWithFormat:url, [ConfigurationManager baseUrl], patientId] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.post.it.Pilulier4"];
        [userDefaults setObject:responseObject forKey:@"medicationrequest"];
        [userDefaults synchronize];
        if (completionBlock != nil) {
            completionBlock(nil);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (completionBlock != nil) {
            completionBlock(error);
        }
    }];
}

- (void)getPatient:(NSString *)patientId withCompletionBlock:(void (^)(PatientData *patient, NSError *error))completionBlock {
    [self fetchPatientDataForPatient:patientId withCompletionBlock:^(NSError *error) {
        if (error != nil ) {
            if (completionBlock != nil) {
                completionBlock(nil, error);
            }
        }
        else {
            NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.post.it.Pilulier4"];
            NSDictionary *json = [userDefaults objectForKey:@"patient"];
            PatientData *patient = [PatientData new];
            NSDictionary *patientJson = [[[json objectForKey:@"entry"] objectAtIndex:0] objectForKey:@"resource"];
            patient.json = patientJson;
            completionBlock(patient, nil);
        }
    }];
}
/*
RestManager *restManager = [RestManager sharedInstance];

[restManager fetchPatientDataForPatient:@".PAT_10" withCompletionBlock:^(NSError *error) {
    NSLog(@"fetchPatientDataForPatient Error: %@", error);
    if (error == nil) {
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.ch.post.it.Pilulier4"];
        NSDictionary *json = [userDefaults objectForKey:@"patient"];
        NSLog(@"PatientData: %@", json);
    }
}];
*/
/*-(void)getImageForId:(NSString *)imageId {
    NSString * urlstring = [restManager urlPictureMedicationByGtin:@"7680336700367" :@"PA" :@"Front" :@"M"];
    dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
    
    // execute a task on that queue asynchronously
    dispatch_async(myqueue, ^{
        NSURL *url = [NSURL URLWithString:[urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];;
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            _medicationPicture.image = [UIImage imageWithData:data]; //UI updates should be done on the main thread
        });
    });
    
    
}*/

@end
