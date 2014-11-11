//
//  ViewController.h
//  VoIP
//
//  Created by 赵 进喜 on 14/11/6.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCPCallEvent.h"
#import "CCPCallService.h"
#import "ECCallerHelper.h"
@interface ViewController : UIViewController<UIActionSheetDelegate,ECCallHelperDelegate>
{
    
    NSMutableArray *subInfos;
    
    
    NSDictionary *currentSubAccount;
    
}

- (IBAction)loginPressed:(UIButton *)sender;
@property( nonatomic,strong)NSDictionary *accountInfo;
- (IBAction)pickAccount:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *accountLbl;
@property (weak, nonatomic) IBOutlet UILabel *pwdLbl;

@end

