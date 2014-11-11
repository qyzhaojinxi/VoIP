//
//  ECCallerHelper.h
//  VoIP
//
//  Created by 赵 进喜 on 14/11/7.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPCallService.h"
#import "CCPCallEvent.h"
@interface ECCallerHelper : NSObject<CCPCallEventDelegate>
{

    id loginDelegate;

    id callDelegate;
    
    id incomingDelegate;

}

@property(nonatomic,strong)CCPCallService *callService;

@property(nonatomic,strong)NSDictionary * configInfo;

@property(nonatomic,strong)NSDictionary *loginInfo;

@property(nonatomic,strong)NSDictionary *calledInfo;
@property(nonatomic,strong)NSDictionary *incomingInfo;

-(void)setLoginDelegate:(id)mDelegate;
-(void)setCallDelegate:(id)mDelegate;
-(void)setIncomingDelegate:(id)mDelegate;

+(id)shareHelper;



@end



@protocol ECCallHelperDelegate <NSObject>


-(void)connectSussess;
-(void)onConnectError:(NSInteger)reason withReasonMessge:(NSString *)reasonMessage;

-(void)onIncomingCallReceived:(NSString *)callid withCallerAccount:(NSString *)caller withCallerPhone:(NSString *)callerphone withCallerName:(NSString *)callername withCallType:(NSInteger)calltype;
-(void)onCallAnswered:(NSString *)callid;

-(void)onCallReleased:(NSString *)callid;

@end