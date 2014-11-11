//
//  ECCallerHelper.m
//  VoIP
//
//  Created by 赵 进喜 on 14/11/7.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import "ECCallerHelper.h"
static ECCallerHelper *instance;
@implementation ECCallerHelper

+(id)shareHelper
{
   static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
    
    
        instance=[[ECCallerHelper alloc]init];
    
    });

    return instance;
}
-(void)setLoginDelegate:(id)mDelegate
{

    loginDelegate=mDelegate;


}
-(void)setCallDelegate:(id)mDelegate
{

    callDelegate=mDelegate;

}
-(void)setIncomingDelegate:(id)mDelegate
{
    incomingDelegate=mDelegate;

}
//登录失败
-(void)onConnectError:(NSInteger)reason withReasonMessge:(NSString *)reasonMessage
{
    
    
    
    if (loginDelegate&&[loginDelegate respondsToSelector:@selector(onConnectError:withReasonMessge:)]) {
        
        
        [loginDelegate onConnectError:reason withReasonMessge:reasonMessage];
        
        
    }
    

    
    
}
//登录成功
-(void)onConnected
{
    
    if (loginDelegate&&[loginDelegate respondsToSelector:@selector(connectSussess)]) {
        
        
        [loginDelegate connectSussess];
        
        
    }
    
    
}


-(void)onIncomingCallReceived:(NSString *)callid withCallerAccount:(NSString *)caller withCallerPhone:(NSString *)callerphone withCallerName:(NSString *)callername withCallType:(NSInteger)calltype
{





    if (callDelegate&&[callDelegate respondsToSelector:@selector(onIncomingCallReceived:withCallerAccount:withCallerPhone:withCallerName:withCallType:)]) {
        
        
        [callDelegate onIncomingCallReceived:callid withCallerAccount:caller withCallerPhone:callerphone withCallerName:callername withCallType:calltype ];
        
        
    }


}



-(void)onCallAnswered:(NSString *)callid
{


    
    if (incomingDelegate&&[incomingDelegate respondsToSelector:@selector(onCallAnswered:)]) {
        
        
        [incomingDelegate onCallAnswered:callid];
        
        
    }


}

-(void)onCallReleased:(NSString *)callid
{


    
    if (incomingDelegate&&[incomingDelegate respondsToSelector:@selector(onCallReleased:)]) {
        
        
        [incomingDelegate onCallReleased:callid];
        
        
    }


}
- (void)onMakeCallFailed:(NSString *)callid withReason:(NSInteger)reason
{

       
    if (incomingDelegate&&[incomingDelegate respondsToSelector:@selector(onMakeCallFailed:withReason:)]) {
        
        
        [incomingDelegate onMakeCallFailed:callid withReason:reason];
        
        
    }


}
@end
