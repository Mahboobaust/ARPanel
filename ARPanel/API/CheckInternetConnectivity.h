//
//  CheckInternetConnectivity.h
//  Reachability
//
//  Created by iSoton on 3/13/14.
//  Copyright (c) 2014 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckInternetConnectivity : NSObject{
    
}

+(CheckInternetConnectivity *) sharedConnectivity;
-(BOOL) DidFinishCheckingInternetConnectivity;

@end
