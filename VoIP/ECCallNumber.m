//
//  ECCallNumber.m
//  VoIP
//
//  Created by 赵 进喜 on 14/11/10.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import "ECCallNumber.h"
#import "IncomingViewController.h"
@implementation ECCallNumber
 -(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    ECCallerHelper *callHelper=[ECCallerHelper shareHelper];
    [callHelper setCallDelegate:self];
    
     subInfos=callHelper.configInfo[@"subaccounts_info"];


    _currentUser.text=[NSString stringWithFormat:@"当前登录账号：%@",callHelper.loginInfo[@"voip_account"]];
    
}
- (IBAction)pickNumber:(UIButton *)sender {
    
    
    
    
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"选择账号" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles :nil];
    
    
    for (NSDictionary *sub in subInfos) {
        
        [action addButtonWithTitle:[sub objectForKey:@"voip_account"]];
        
        
        
        
    }
    
    [action addButtonWithTitle:@"取消"];
    
    [action setCancelButtonIndex:subInfos.count];
    
    
    
    
    [action showInView:self.view];

}

- (IBAction)beginCall:(UIButton *)sender {
    
    
    [[[ECCallerHelper shareHelper] callService]makeCallWithType:0 andCalled:_calledNumber.text];
    
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    
    ECCallerHelper *callHelper=  [ECCallerHelper shareHelper];

    if (buttonIndex<2) {
        
        
        NSDictionary *info=[subInfos objectAtIndex:buttonIndex];
        
        
        
        _calledNumber.text=info[@"voip_account"];
        
//        _pwdLbl.text=info[@"voip_password"];
        
        
        
       callHelper.calledInfo =[subInfos objectAtIndex:buttonIndex];
        
        
        
           }
    



}
-(void)onIncomingCallReceived:(NSString *)callid withCallerAccount:(NSString *)caller withCallerPhone:(NSString *)callerphone withCallerName:(NSString *)callername withCallType:(NSInteger)calltype
{

    
    ECCallerHelper *callHelper=[ECCallerHelper shareHelper];
    callHelper.incomingInfo=@{@"callid":callid,@"caller":caller};

    IncomingViewController *incom=[self.storyboard instantiateViewControllerWithIdentifier:@"IncomingViewController"];
    
    [self presentViewController:incom animated:YES completion:nil];


}


@end
