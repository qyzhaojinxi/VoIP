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
    
    

    
    
    
    

    
    if (_ECCallType==ECCallin) {
        
        self.releaseButton.hidden=YES;
        
        
        
        _incomeNum.text=callHelper.incomingInfo[@"caller"];
        
    }else
    {
        self.rejectButton.hidden=YES;
        self.accetpButton.hidden=YES;
        
        
        _incomeNum.text=callHelper.calledInfo[@"voip_account"];
        
        callHelper.chatId=[callHelper.callService makeCallWithType:0 andCalled:callHelper.calledInfo[@"voip_account"]];

    
    }
    
    

}
- (IBAction)acceptButtonPressed:(UIButton *)sender {
    
    
    
    [callHelper.callService acceptCall:callHelper.incomingInfo[@"callid"] withType:0];
    
    
    
    
}

- (IBAction)rejectButtonPressed:(UIButton *)sender {
    
    
    if (_ECCallType==ECCallin) {
        
        [callHelper.callService rejectCall:callHelper.incomingInfo[@"callid"] andReason:0];
        
    }else if (_ECCallType==ECCallout)
    {
    
   // [callHelper.callService rejectCall:callHelper.calledInfo[@"voip_account"] andReason:0];
        
    [callHelper.callService releaseCall:callHelper.chatId];
    }
    
    
    
    
}
-(void)onCallAnswered:(NSString *)callid
{

    self.rejectButton.hidden=YES;
    self.accetpButton.hidden=YES;
    
    self.releaseButton.hidden=NO;


}


-(void)onCallReleased:(NSString *)callid
{


    
    [self dismissViewControllerAnimated:YES completion:nil];


}
-(void)onMakeCallFailed:(NSString *)callid withReason:(NSInteger)reason
{

    if (reason==3) {
        
        
        
        return;
    }

    
    
    [self dismissViewControllerAnimated:YES completion:nil];


}
@end
