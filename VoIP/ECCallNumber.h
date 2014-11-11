//
//  ECCallNumber.h
//  VoIP
//
//  Created by 赵 进喜 on 14/11/10.
//  Copyright (c) 2014年 everzones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECCallerHelper.h"
@interface ECCallNumber : UIViewController<UIActionSheetDelegate,ECCallHelperDelegate>
{

NSMutableArray *subInfos;

}
@property (weak, nonatomic) IBOutlet UILabel *currentUser;

@property (weak, nonatomic) IBOutlet UILabel *calledNumber;
- (IBAction)pickNumber:(UIButton *)sender;
- (IBAction)beginCall:(UIButton *)sender;
@end
