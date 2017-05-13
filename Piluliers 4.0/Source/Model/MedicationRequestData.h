//
//  MedicationRequestData.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedicationRequestData : NSObject
@property (nonatomic, nullable) NSDictionary *json;

- (NSDate *)startDate;
@end
