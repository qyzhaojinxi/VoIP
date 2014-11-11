//
//  IncomingViewController.m
//  VoIP
//
//  Created by 赵 进喜 on 14/11/10.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import "IncomingViewController.h"





@implementation IncomingViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
     callHelper=[ECCallerHelper shareHelper];
    [callHelper setIncomingDelegate:self];
    
    _incomeNum.text=callHelper.incomingInfo[@"caller"];
    
    


}
- (IBAction)acceptButtonPressed:(UIButton *)sender {
    
    
    
    [callHelper.callService acceptCall:callHelper.incomingInfo[@"callid"] withType:0];
    
    
    
}

- (IBAction)rejectButtonPressed:(UIButton *)sender {
    
    
    
    [callHelper.callService rejectCall:callHelper.incomingInfo[@"callid"] andReason:0];
    
}
-(void)onCallAnswered:(NSString *)callid
{



}


-(void)onCallReleased:(NSString *)callid
{


    
    [self dismissViewControllerAnimated:YES completion:nil];


}
@end
