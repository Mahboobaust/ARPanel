//
//  ViewController.m
//  ARPanel
//
//  Created by Mahboob on 8/8/17.
//  Copyright © 2017 Empire Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self riderSelected:nil];
    _txtSMS.layer.borderWidth=2.0;
    _txtSMS.layer.borderColor=[[UIColor brownColor]CGColor];
       
    
      // Do any additional setup after loading the view, typically from a nib.
}

-(void)dissmissKeyBoard
{
    //[_txtSMS resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)riderSelected:(id)sender {
    _imgRider.image=[UIImage imageNamed:@"radio_selected"];
    _imgBiker.image=[UIImage imageNamed:@"radio_normal"];
    
    [_viewBiker setHidden:YES];
    [_viewRider setHidden:NO];
    [self requestFailedAction:nil];
    selectSMS=SELECT_RIDER;
    
    
}

- (IBAction)bikerSelected:(id)sender {
    
    _imgRider.image=[UIImage imageNamed:@"radio_normal"];
    _imgBiker.image=[UIImage imageNamed:@"radio_selected"];
    
    [_viewBiker setHidden:NO];
    [_viewRider setHidden:YES];
    [self employeeBikerAction:nil];
     selectSMS=SELECT_BIKER;

}

- (IBAction)requestFailedAction:(id)sender {
    
    _imgAll.image=[UIImage imageNamed:@"radio_normal"];
    _imgInactive.image=[UIImage imageNamed:@"radio_normal"];
    _imgLessFour.image=[UIImage imageNamed:@"radio_normal"];
    _imgReqFail.image=[UIImage imageNamed:@"radio_selected"];
    _imgNoTrips.image=[UIImage imageNamed:@"radio_normal"];
    riderSelect=RIDER_REQUEST_FAILED;
    
}

- (IBAction)lessThanFourTripsAction:(id)sender {
    _imgAll.image=[UIImage imageNamed:@"radio_normal"];
    _imgInactive.image=[UIImage imageNamed:@"radio_normal"];
    _imgLessFour.image=[UIImage imageNamed:@"radio_selected"];
    _imgReqFail.image=[UIImage imageNamed:@"radio_normal"];
    _imgNoTrips.image=[UIImage imageNamed:@"radio_normal"];
    riderSelect=RIDER_LESS_THAN_FOUR_TRIPS;
}

- (IBAction)noTripAction:(id)sender {
    _imgAll.image=[UIImage imageNamed:@"radio_normal"];
    _imgInactive.image=[UIImage imageNamed:@"radio_normal"];
    _imgLessFour.image=[UIImage imageNamed:@"radio_normal"];
    _imgReqFail.image=[UIImage imageNamed:@"radio_normal"];
    _imgNoTrips.image=[UIImage imageNamed:@"radio_selected"];
    riderSelect=RIDER_NO_TRIP;
    
}

- (IBAction)inactiveRiderAction:(id)sender {
    _imgAll.image=[UIImage imageNamed:@"radio_normal"];
    _imgInactive.image=[UIImage imageNamed:@"radio_selected"];
    _imgLessFour.image=[UIImage imageNamed:@"radio_normal"];
    _imgReqFail.image=[UIImage imageNamed:@"radio_normal"];
    _imgNoTrips.image=[UIImage imageNamed:@"radio_normal"];
    riderSelect=RIDER_INACTIVE;
}

- (IBAction)allRiderAction:(id)sender {
    _imgAll.image=[UIImage imageNamed:@"radio_selected"];
    _imgInactive.image=[UIImage imageNamed:@"radio_normal"];
    _imgLessFour.image=[UIImage imageNamed:@"radio_normal"];
    _imgReqFail.image=[UIImage imageNamed:@"radio_normal"];
    _imgNoTrips.image=[UIImage imageNamed:@"radio_normal"];
    riderSelect=RIDER_ALL;
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
















- (IBAction)employeeBikerAction:(id)sender {
    _imgEmployeeBiker.image=[UIImage imageNamed:@"radio_selected"];
    _imgFreelancer.image=[UIImage imageNamed:@"radio_normal"];
    
    bikerType=BIKER_EMPLOYEE;
    
    
}

- (IBAction)freelancerAction:(id)sender {
    
    _imgEmployeeBiker.image=[UIImage imageNamed:@"radio_normal"];
    _imgFreelancer.image=[UIImage imageNamed:@"radio_selected"];
     bikerType=BIKER_FREELANCERS;
}

-(void)sendSMSToBikers
{
    
       [SVProgressHUD show];
    
    BOOL flag = [[CheckInternetConnectivity sharedConnectivity] DidFinishCheckingInternetConnectivity];
   
    
    if (flag) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            APICommunicator *apiCom = [[APICommunicator alloc] init];
          
          NSArray *tempDic = [apiCom getArrByPOST:SMS_TO_BIKER_URL parameter:[NSString stringWithFormat:@"biker_type=%@",[NSString stringWithFormat:@"%d",bikerType]]];
            
            phoneNumArray=[[NSMutableArray alloc]init];
            NSLog(@"tempDic : %@",[tempDic description]);
            
            NSArray *trip=[tempDic valueForKey:@"bikers"];
            
            phoneNumArray=[trip valueForKey:@"phone_num"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([tempDic count] > 0)
                {
                    NSLog(@"Success");
                       [SVProgressHUD dismiss];
                    
                    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
                    if([MFMessageComposeViewController canSendText])
                    {
                        controller.body =_txtSMS.text;
                        //controller.delegate=self;
                        controller.recipients = (NSArray*)phoneNumArray;
                        controller.messageComposeDelegate = self;
                        [self presentViewController:controller animated:YES completion:nil];
                    }
                    
                }
                else
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No Biker's Mobile Number Available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    
                }
            });
        });
        
    }else{
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:NO_INTERNET_MESSEGE delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }

    

}

-(void)sendSMSToRiders
{
    
    [SVProgressHUD show];
    
    BOOL flag = [[CheckInternetConnectivity sharedConnectivity] DidFinishCheckingInternetConnectivity];
    
    
    if (flag) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            APICommunicator *apiCom = [[APICommunicator alloc] init];
            
            NSArray *tempDic = [apiCom getArrByPOST:SMS_TO_RIDER_URL parameter:[NSString stringWithFormat:@"rider_type=%@",[NSString stringWithFormat:@"%d",riderSelect]]];
            
            phoneNumArray=[[NSMutableArray alloc]init];
            NSLog(@"tempDic : %@",[tempDic description]);
            
            NSArray *trip=[tempDic valueForKey:@"riders"];
            
            phoneNumArray=[trip valueForKey:@"phone_num"];
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([tempDic count] > 0)
                {
                    NSLog(@"Success");
                    
                       [SVProgressHUD dismiss];
                    
                    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
                    if([MFMessageComposeViewController canSendText])
                    {
                        controller.body =_txtSMS.text;
                        //controller.delegate=self;
                        controller.recipients = (NSArray*)phoneNumArray;
                        controller.messageComposeDelegate = self;
                        [self presentViewController:controller animated:YES completion:nil];
                    }
                    
                }
                else
                {
                    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"" message:@"No Biker's Mobile Number Available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                    
                }
            });
        });
        
    }else{
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:NO_INTERNET_MESSEGE delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }


}
- (IBAction)sendSMS:(id)sender {
    
    if(selectSMS==SELECT_RIDER)
    {
        [self sendSMSToRiders];
    }
    else  if(selectSMS==SELECT_BIKER)
    {
        [self sendSMSToBikers];
    }
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
    // Check the result or perform other tasks.    // Dismiss the message compose view controller.
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
