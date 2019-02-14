//
//  PadDetailViewController.h
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PadJumpNextViewControllerDelegate.h"

@interface PadDetailViewController : UIViewController<PadJumpNextViewControllerDelegate>

- (void)pad_showTabBarControllerWithTag:(NSInteger)tag;

@end
