//
//  PillImageNameRow.h
//  Piluliers 4.0
//
//  Created by Kolly Sandro, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface PillImageNameRow : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *pillImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *pillNameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *rowGroup;

@end
