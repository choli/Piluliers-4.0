//
//  PatientData.m
//  Piluliers 4.0
//
//  Created by Meumann Ulrich, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "PatientData.h"

@implementation PatientData
- (NSString *)family {
    if (self.json != nil) {
        NSArray *names = [self.json objectForKey:@"name"];
        return [[names objectAtIndex:0] objectForKey:@"family"];
    }
    return nil;
}

- (NSString *)given {
    if (self.json != nil) {
        NSArray *names = [self.json objectForKey:@"name"];
        NSArray *firstnames = [[names objectAtIndex:0] objectForKey:@"given"];
        if (firstnames.count > 0) {
            return firstnames[0];
        }
    }
    return nil;
}

- (UIImage *)photo {
    if (self.json != nil) {
        NSArray *photos = [self.json objectForKey:@"photo"];
        if (photos.count > 0) {
            NSDictionary *photoDict = photos[0];
            NSString *contentType = photoDict[@"contentType"];
            NSString *photoData = photoDict[@"data"];
            if ([contentType isEqualToString:@"image/jpeg"]) {
                UIImage *image = [UIImage imageWithData:[self
                                                         dataFromBase64EncodedString:photoData]];
                return image;
            }
        }
    }
    return nil;
}

-(NSData *)dataFromBase64EncodedString:(NSString *)string{
    if (string.length > 0) {
        
        //the iPhone has base 64 decoding built in but not obviously. The trick is to
        //create a data url that's base 64 encoded and ask an NSData to load it.
        NSString *data64URLString = [NSString stringWithFormat:@"data:;base64,%@", string];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:data64URLString]];
        return data;
    }
    return nil;
}
@end
