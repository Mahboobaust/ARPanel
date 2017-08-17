//
//  CheckInternetConnectivity.m
//  Reachability
//
//  Created by iSoton on 3/13/14.
//  Copyright (c) 2014 Apple Inc. All rights reserved.
//

#import <SystemConfiguration/SystemConfiguration.h>
#import "CheckInternetConnectivity.h"
#import "Reachability.h"

@implementation CheckInternetConnectivity


#pragma mark - JSIWebserviceHandler Initialization

static CheckInternetConnectivity *mySharedConnectivity = nil;

+(CheckInternetConnectivity *)sharedConnectivity{
    @synchronized(self) {
        if(mySharedConnectivity == nil)
            mySharedConnectivity = [[super allocWithZone:NULL] init];
    }
    return mySharedConnectivity;
}

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedConnectivity];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}


- (id)init {
    if (self = [super init]) {
        NSLog(@"Initialize");
    }
    return self;
}

-(BOOL) DidFinishCheckingInternetConnectivity{
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    BOOL flag;
    if (networkStatus == NotReachable) flag = FALSE;
    else    flag =  TRUE;
    return flag;
    
}

@end