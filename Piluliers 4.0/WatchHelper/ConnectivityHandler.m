//
//  ConnectivityHandler.m
//  Piluliers 4.0
//
//  Created by Kolly Sandro, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "ConnectivityHandler.h"
#import <WatchConnectivity/WatchConnectivity.h>

@interface ConnectivityHandler () <WCSessionDelegate>
@property (nonatomic) WCSession *session;
@end

@implementation ConnectivityHandler

- (instancetype)init {
    self = [super init];
    if (self) {
        self.session = [WCSession defaultSession];
        self.session.delegate = self;
        [self.session activateSession];
    }
    return self;
}

-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler {
    NSString *requestKey = message[@"request"];
    NSDictionary *response = @{};
    if ([requestKey isEqualToString:@"dummy"]) {
        response = @{@"time" : [NSDate dateWithTimeIntervalSince1970:1494616500],
                                   @"pills" : @[@{
                                                    @"name" : @"Mydocalm",
                                                    @"pictureName": @"pill.png"
                                                    },
                                                @{
                                                    @"name" : @"Aricept",
                                                    @"pictureName": @"capsule.png"
                                                    }]
                                   };
    }
    replyHandler(response);
}

- (void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error {
    if (!error) {
        if (activationState == WCSessionActivationStateActivated) {
            NSLog(@"activated watch connectivity");
        } else {
            NSLog(@"some other status than connected: %ld", (long)activationState);
        }
    } else {
        NSLog(@"Error: %@", error.localizedDescription);
    }
}

- (void)sessionDidBecomeInactive:(WCSession *)session {
    
}

- (void)sessionDidDeactivate:(WCSession *)session {
    NSLog(@"session did deactivate, reactivating...");
    [self.session activateSession];
}


@end
