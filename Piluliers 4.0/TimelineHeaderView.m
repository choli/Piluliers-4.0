//
//  TimelineHeaderView.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineHeaderView.h"

@interface TimelineHeaderView()

@end

@implementation TimelineHeaderView

- (void)layoutSubviews {
    self.userImageView.layer.cornerRadius = 40.0;
    self.userImageView.layer.masksToBounds = YES;
}

@end
