//
//  ConfigurationManager.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "ConfigurationManager.h"

@implementation ConfigurationManager
+ (NSString *)baseUrl {
    return @"https://hackathon.test.docdesk.ch:4443/medication-web-module/hackathon/fhir";
    // return @"http://hl7.org/fhir";
}
@end
