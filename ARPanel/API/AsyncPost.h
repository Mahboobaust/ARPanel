//
//  AsyncPost.h
//  AmarRide
//
//  Created by Mahboob on 3/2/16.
//  Copyright © 2016 Mahboob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncPost : NSObject<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    
    
}




-(NSDictionary*)getDataByPOSTAsync:(NSString*)url parameter:(id)parameter;

@end
