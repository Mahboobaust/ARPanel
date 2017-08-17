//
//  AsyncPost.m
//  AmarRide
//
//  Created by Mahboob on 3/2/16.
//  Copyright © 2016 Mahboob. All rights reserved.
//

#import "AsyncPost.h"

@implementation AsyncPost

NSDictionary *dicData;

-(NSDictionary*)getDataByPOSTAsync:(NSString*)url parameter:(id)parameter{
    
    
    NSURL *urls=[NSURL URLWithString:url];
    
        
        
        
        NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:urls cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        
        //NSLog(@"%@",requestURL);
        [requestURL setHTTPMethod:@"POST"];
        
        
        // NSError *error=nil ;
        if ([parameter isKindOfClass : [NSString class]]) {
            [requestURL setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else if([parameter isKindOfClass:[NSDictionary class]]) {
            [requestURL setHTTPBody:parameter];
        }
        else {
            [requestURL setHTTPBody:parameter];
        }
        // NSHTTPURLResponse *response;
        //NSError *error1=nil;
        //        NSLog(@"%@\n\n%@",s,parameter);
        
        //  NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error1];
        
        
        [NSURLConnection sendAsynchronousRequest:requestURL queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data3, NSError *connectionError) {
            
            
            
            
            
            NSError *error = nil;
            if (data3) {
                 dicData = [NSJSONSerialization JSONObjectWithData:data3 options:0 error:&error];
            }
           
            
            
            if (!dicData) {
               // NSLog(@"Error: %@", [error localizedDescription]);
                return ;
                //return NO;
            }
            
        }];
        
        return dicData;
    }
    
    
    

    




@end
