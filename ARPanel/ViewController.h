//
//  ViewController.h
//  ARPanel
//
//  Created by Mahboob on 8/8/17.
//  Copyright © 2017 Empire Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "CheckInternetConnectivity.h"
#import "ApiCommunicator.h"
#import "URL.h"
#import <MessageUI/MessageUI.h>
#import "SVProgressHUD.h"


@interface ViewController : UIViewController<MFMessageComposeViewControllerDelegate>
{
    RIDER_SELECT riderSelect;
    BIKER_TYPE bikerType;
    SELECT_SMS selectSMS;
    NSMutableArray *phoneNumArray;
    
    
}
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (weak, nonatomic) IBOutlet UIImageView *imgRider;

@property (weak, nonatomic) IBOutlet UIImageView *imgBiker;
- (IBAction)riderSelected:(id)sender;
- (IBAction)bikerSelected:(id)sender;
- (IBAction)requestFailedAction:(id)sender;
- (IBAction)lessThanFourTripsAction:(id)sender;
- (IBAction)noTripAction:(id)sender;

- (IBAction)inactiveRiderAction:(id)sender;

- (IBAction)allRiderAction:(id)sender;


@property (weak, nonatomic) IBOutlet UITextView *txtSMS;

@property (weak, nonatomic) IBOutlet UIImageView *imgReqFail;

@property (weak, nonatomic) IBOutlet UIImageView *imgLessFour;

@property (weak, nonatomic) IBOutlet UIImageView *imgNoTrips;
@property (weak, nonatomic) IBOutlet UIImageView *imgInactive;
@property (weak, nonatomic) IBOutlet UIImageView *imgAll;
- (IBAction)employeeBikerAction:(id)sender;
- (IBAction)freelancerAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgEmployeeBiker;
@property (weak, nonatomic) IBOutlet UIImageView *imgFreelancer;

@property (weak, nonatomic) IBOutlet UIView *viewRider;
@property (weak, nonatomic) IBOutlet UIView *viewBiker;


- (IBAction)sendSMS:(id)sender;


@end

