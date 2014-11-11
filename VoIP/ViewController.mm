//
//  ViewController.m
//  VoIP
//
//  Created by 赵 进喜 on 14/11/6.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import "ViewController.h"

#import "ECCallNumber.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"config" ofType:@"plist"];
    
    
    _accountInfo=[NSDictionary dictionaryWithContentsOfFile:path];
    
    
    subInfos=_accountInfo[@"subaccounts_info"];

    
    
    ECCallerHelper *callerHelper=[ECCallerHelper shareHelper];
    
    
    
    
    callerHelper.callService=[[CCPCallService alloc]init];
    
    
    
    [callerHelper.callService setDelegate:callerHelper];
    
    callerHelper.configInfo=_accountInfo;
    
    [callerHelper setLoginDelegate:self];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickAccount:(UIButton *)sender {
    

    
    
    
    
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"选择账号" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles :nil];
    
    
    for (NSDictionary *sub in subInfos) {
        
        [action addButtonWithTitle:[sub objectForKey:@"voip_account"]];

     
        
        
    }
    
     [action addButtonWithTitle:@"取消"];

    [action setCancelButtonIndex:subInfos.count];
    
   
    
    
    [action showInView:self.view];
    
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{


    if (buttonIndex<2) {
        
        
        NSDictionary *info=[subInfos objectAtIndex:buttonIndex];
        
        
        
        _accountLbl.text=info[@"voip_account"];
        
        _pwdLbl.text=info[@"voip_password"];
        
        
        
        currentSubAccount=[subInfos objectAtIndex:buttonIndex];
        
        
        
        ECCallerHelper *callHelper=[ECCallerHelper shareHelper];
        
    
        callHelper.loginInfo=currentSubAccount;
    }
        
        
    
        





}

- (IBAction)loginPressed:(UIButton *)sender {
    
    
    
    
    [[[ECCallerHelper shareHelper] callService]connectToCCP:_accountInfo[@"serverip"] onPort:[_accountInfo[@"serverport"]integerValue] withAccount:currentSubAccount[@"voip_account"] withPsw:currentSubAccount[@"voip_password"] withAccountSid:currentSubAccount[@"sub_account"] withAuthToken:currentSubAccount[@"sub_token"]];
    
    
    
    
}

-(void)onConnectError:(NSInteger)reason withReasonMessge:(NSString *)reasonMessage
{






}


-(void)connectSussess
{

    ECCallNumber *number=[self.storyboard instantiateViewControllerWithIdentifier:@"ECCallNumber"];
    
    [self presentViewController:number animated:YES completion:nil];



}
@end
