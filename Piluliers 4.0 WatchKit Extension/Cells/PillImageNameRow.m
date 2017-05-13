//
//  PillImageNameRow.m
//  Piluliers 4.0
//
//  Created by Kolly Sandro, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "PillImageNameRow.h"

@implementation PillImageNameRow

-(void)setPillImageNamed:(NSString *)pillImageName {
    UIImage *image = [UIImage imageNamed:pillImageName];
    [self.pillImage setImage:image];
    UIColor *color = [UIColor blueColor];
    if ([pillImageName isEqualToString:@"pill"]) {
        color = [UIColor redColor];
    }
    if ([pillImageName isEqualToString:@"capsule"]) {
        color = [UIColor whiteColor];
    }
    [self.pillImage setTintColor:color];
}

@end
