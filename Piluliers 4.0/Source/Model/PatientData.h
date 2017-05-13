//
//  PatientData.h
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PatientData : NSObject
@property (nonatomic, nullable) NSDictionary *json;
@property (nonatomic, nullable) NSString *id;
@property (nonatomic, nullable) NSString *family;
@property (nonatomic, nullable) NSString *given;
@property (nonatomic, nullable) UIImage *photo;
@end
