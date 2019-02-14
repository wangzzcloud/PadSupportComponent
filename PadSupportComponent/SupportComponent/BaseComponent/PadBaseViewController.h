//
//  PadBaseViewController.h
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PadJumpNextViewControllerDelegate.h"

/**
 用来做基类
 */
@interface PadBaseViewController : UIViewController

@property (nonatomic, weak) id<PadJumpNextViewControllerDelegate> pad_Delegate;

- (void)pad_jumpNextViewController:(PadBaseViewController *)contoller;

@end
