//
//  APICommunicator.m
//  GRADPAK
//
//  Created by Selim Reza on 28/04/14.
//  Copyright (c) 2014 Web Alive. All rights reserved.
//

#import "APICommunicator.h"
#import "Reachability.h"
#import "AppDelegate.h"

@implementation APICommunicator

-(NSURL*) getAbsoluteURL:(NSString*)url{
    _baseURL = @"http://188.166.180.131";
    // _baseURL = @"http://139.59.37.169";
   
    return [NSURL URLWithString:[_baseURL stringByAppendingString:url]];
}

-(NSURL*) getNodeURL:(NSString*)url{
    _baseURL = @"http://188.166.180.131:4152";
    //_baseURL=  @"http://139.59.37.169:4478";
    return [NSURL URLWithString:[_baseURL stringByAppendingString:url]];
}


-(NSDictionary*)getDataByGET:(NSString *)url{
    NSDictionary *dictionaryData;
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"No Network",@"message",nil];
        return dictionaryData;
    }
    else{
        NSURLRequest *requestURL = [NSURLRequest requestWithURL:[self getAbsoluteURL:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        //NSLog(@"%@",requestURL);
        NSHTTPURLResponse *response;
        NSError *error =nil;
        NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error];
        if (response.statusCode == 0) {
            dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server Error",@"message",nil];
            return dictionaryData;
        }else if(response.statusCode == 404){
            dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server is Currently Down.",@"message", nil];
            return dictionaryData;
        }else{
            dictionaryData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
        }
    }
    return dictionaryData;
}


-(NSDictionary*)getBkashData:(NSString *)url{
    NSDictionary *dictionaryData;
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"No Network",@"message",nil];
        return dictionaryData;
    }
    else{
        NSURLRequest *requestURL = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        //NSLog(@"%@",requestURL);
        NSHTTPURLResponse *response;
        NSError *error =nil;
        NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error];
        if (response.statusCode == 0) {
            dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server Error",@"message",nil];
            return dictionaryData;
        }else if(response.statusCode == 404){
            dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server is Currently Down.",@"message", nil];
            return dictionaryData;
        }else{
            dictionaryData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
        }
    }
    return dictionaryData;
}

-(NSArray*)getDataByGETArray:(NSString *)url{
    NSArray *dictionaryData;
    
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        dictionaryData = [[NSArray alloc] initWithObjects:@"error",@"status",@"No Network",@"message",nil];
        return dictionaryData;
    }
    else{
        NSURLRequest *requestURL = [NSURLRequest requestWithURL:[self getAbsoluteURL:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        NSLog(@"%@",requestURL);
        NSHTTPURLResponse *response;
        NSError *error = [[NSError alloc]init];
        if(requestURL)
        {
            NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error];
            if (apiData) {
                dictionaryData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
            }

        }
               return dictionaryData;
    }
    return nil;
}

-(NSArray*)getDataByGETArraySync:(NSString *)url{
    NSArray *dictionaryData;
    
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        dictionaryData = [[NSArray alloc] initWithObjects:@"error",@"status",@"No Network",@"message",nil];
        return dictionaryData;
    }
    else{
        NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:[self getAbsoluteURL:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
        NSLog(@"%@",requestURL);
        NSHTTPURLResponse *response;
        NSError *error = [[NSError alloc]init];
        if(requestURL)
        {
            NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error];
            if (apiData) {
                dictionaryData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
            }
            
        }
        return dictionaryData;
    }
    return nil;
}

-(NSURL*) getSpecialCaseAbsoluteURL:(NSString*)url{
    _baseURL = @"http://amarphonebook.com/";
    return [NSURL URLWithString:[_baseURL stringByAppendingString:url]];
}

-(NSDictionary*)getDataByPOST:(NSString*)url parameter:(id)parameter{
    NSDictionary *dictionaryData;
    NSDictionary *dic;
    NSArray *amarData;
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"No Network",@"message",nil];
        dic = [NSDictionary dictionaryWithObjectsAndKeys:dictionaryData, @"response",nil];
        return dic;
    }
    
    else{
        NSURL *s =[self getAbsoluteURL:url];
        
        
        NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:s cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        //NSLog(@"%@",requestURL);
        [requestURL setHTTPMethod:@"POST"];

        
        NSError *error=nil ;
        if ([parameter isKindOfClass : [NSString class]]) {
            [requestURL setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else if([parameter isKindOfClass:[NSDictionary class]]) {
            [requestURL setHTTPBody:parameter];
        }
        else {
            [requestURL setHTTPBody:parameter];
        }
        NSHTTPURLResponse *response;
        NSError *error1=nil;
//        NSLog(@"%@\n\n%@",s,parameter);
        NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error1];
        
        if (!apiData) {
            NSLog(@"Error: %@", [error localizedDescription]);
            return NO;
        }

        if (response.statusCode == 0) {
            
            dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server Error",@"message",nil];
            return dic;
            
        }
        else if(response.statusCode == 404) {
            dictionaryData= [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server is Currently Down.",@"message", nil];
            return dic;
            
        }
        else {
            amarData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error1];
           // kNilOptions
            
            
        }
    }
    return amarData;
}

-(NSDictionary*)getNodeDataByPOST:(NSString*)url parameter:(id)parameter{
    NSDictionary *dictionaryData;
    NSDictionary *dic;
    Reachability *reachTest = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachTest  currentReachabilityStatus];
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"No Network",@"message",nil];
        dic = [NSDictionary dictionaryWithObjectsAndKeys:dictionaryData, @"response",nil];
        return dic;
    }
    
    else{
        NSURL *s =[self getAbsoluteURL:url];
        NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:s cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        //NSLog(@"%@",requestURL);
        [requestURL setHTTPMethod:@"POST"];
        
        
        NSError *error=nil ;
        if ([parameter isKindOfClass : [NSString class]]) {
            [requestURL setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else if([parameter isKindOfClass:[NSDictionary class]]) {
            [requestURL setHTTPBody:parameter];
        }
        else {
            [requestURL setHTTPBody:parameter];
        }
        NSHTTPURLResponse *response;
        NSError *error1=nil;
        //        NSLog(@"%@\n\n%@",s,parameter);
        NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error1];
        if (!apiData) {
            NSLog(@"Error: %@", [error localizedDescription]);
            return NO;
        }
        
        if (response.statusCode == 0) {
            
            dictionaryData = [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server Error",@"message",nil];
            return dic;
            
        }
        else if(response.statusCode == 404) {
            dictionaryData= [[NSDictionary alloc] initWithObjectsAndKeys:@"error",@"status",@"Server is Currently Down.",@"message", nil];
            return dic;
            
        }
        else {
            dictionaryData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
        }
    }
    return dictionaryData;
}

NSDictionary *dictionaryData;


-(NSDictionary*)getGoogleAPIArrByPOST:(NSString*)url parameter:(id)parameter {
    NSDictionary *arrData;
   
    NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
    [requestURL setHTTPMethod:@"POST"];
    
    NSError *error = nil;
    if ([parameter isKindOfClass : [NSString class]]) {
        [requestURL setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
    }
    else if([parameter isKindOfClass:[NSDictionary class]]) {
        [requestURL setHTTPBody:parameter];
    }
    else {
        [requestURL setHTTPBody:parameter];
    }
    NSHTTPURLResponse *response;
    NSError *error1;
    NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error1];
    // NSLog(@"API DATA: %@",apiData);
    
    if(apiData)
    {
        arrData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
        
    }
    
    
    
    return arrData;
}


-(NSArray*)getArrByPOST:(NSString*)url parameter:(id)parameter {
        NSArray *arrData;
        NSURL *s =[self getAbsoluteURL:url];
        NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:s cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:900.00];
        [requestURL setHTTPMethod:@"POST"];
        
        NSError *error = nil;
        if ([parameter isKindOfClass : [NSString class]]) {
            [requestURL setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else if([parameter isKindOfClass:[NSDictionary class]]) {
            [requestURL setHTTPBody:parameter];
        }
        else {
            [requestURL setHTTPBody:parameter];
        }
        NSHTTPURLResponse *response;
        NSError *error1;
        NSData *apiData = [NSURLConnection sendSynchronousRequest:requestURL returningResponse:&response error:&error1];
   // NSLog(@"API DATA: %@",apiData);
    
    if(apiData)
    {
        arrData = [NSJSONSerialization JSONObjectWithData:apiData options:kNilOptions error:&error];
        
    }
    
    
    
    return arrData;
}



-(NSData*)getImage:(NSString *)imageName{
    NSURL *url=[[NSURL alloc]initWithString:[self encodeData:imageName]];
    NSMutableData *imageData = [[NSMutableData alloc] init];
    NSError *error = nil;
    imageData = [NSMutableData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    if (error) {
        return nil;
    }
    else
    return imageData;
}

-(NSString *)encodeData : (NSString *)string {
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                              (CFStringRef) string,
                                                              NULL,
                                                              (CFStringRef) @" ",
                                                              kCFStringEncodingUTF8));
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // download data is our global NSMutableData object that contains the
    [self.delegate didReceiveData:self data:data];
    // fetched HTTP data.
   }

@end
