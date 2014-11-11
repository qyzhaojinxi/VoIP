//
//  IncomingViewController.h
//  VoIP
//
//  Created by 赵 进喜 on 14/11/10.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECCallerHelper.h"
@interface IncomingViewController : UIViewController<ECCallHelperDelegate>

{

    ECCallerHelper *callHelper;
}

@property (weak, nonatomic) IBOutlet UILabel *incomeNum;
- (IBAction)acceptButtonPressed:(UIButton *)sender;
- (IBAction)rejectButtonPressed:(UIButton *)sender;


@end
