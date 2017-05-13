//
//  MedicationData.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedicationData : NSObject

@property (nonatomic, nullable) NSDictionary *json;
@property (nonatomic, nullable) NSString *medicationId;
@property (nonatomic, nullable) NSString *title;
@property (nonatomic, nullable) NSString *form;
@property (nonatomic, nullable) NSString *quantity;
@property (nonatomic, nullable) NSString *frequency;
@property (nonatomic, nullable) NSString *duration;
@property (nonatomic, nullable) NSString *startDate;
@property (nonatomic, nullable) NSString *time;
@property (nonatomic, nullable) NSString *notes;
@property (nonatomic, nullable) NSNumber *intakeStatus;

- (NSString *)formImageName;
@end
