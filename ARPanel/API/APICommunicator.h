//
//  APICommunicator.h
//  GRADPAK
//
//  Created by Selim Reza on 28/04/14.
//  Copyright (c) 2014 Web Alive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APICommunicator;
@protocol APICommunicatorDelegate <NSObject>
@optional
-(void)didReceiveData:(APICommunicator*)apiCom data:(NSData*)data;


@end;




@interface APICommunicator : NSObject<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    
}
@property(strong,nonatomic) id<APICommunicatorDelegate> delegate;
@property(nonatomic,strong)NSString *baseURL;
@property(nonatomic,strong)NSData* responseData;
@property(nonatomic,strong) NSDictionary *dictionaryData;

-(NSURL*) getAbsoluteURL:(NSString*)url;

-(NSDictionary*)getDataByPOST:(NSString*)url parameter:(NSString*)parameter;

-(NSArray*)getArrByPOST:(NSString*)url parameter:(id)parameter;

-(NSDictionary*)getDataByGET:(NSString *)url;

-(NSData*)getImage:(NSString *)imageName;

-(NSArray*)getDataByGETArray:(NSString *)url;
-(NSArray*)getDataByGETArraySync:(NSString *)url;
-(NSDictionary*)getGoogleAPIArrByPOST:(NSString*)url parameter:(id)parameter;
-(NSDictionary*)getDataByPOSTAsync:(NSString*)url parameter:(id)parameter;

-(NSDictionary*)getBkashData:(NSString *)url;
-(NSDictionary*)getNodeDataByPOST:(NSString*)url parameter:(id)parameter;

@end
