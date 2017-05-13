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

- (NSString *)formImageName;
@end
