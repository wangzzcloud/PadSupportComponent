//
//  PadJumpNextViewControllerDelegate.h
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PadBaseViewController;

@protocol PadJumpNextViewControllerDelegate <NSObject>

@required
- (void)pad_jumpNextViewController:(PadBaseViewController *)controller tabBarControllerWithTag:(NSInteger)tag;
//- (void)pad_showTabBarControllerWithTag:(NSInteger)tag;


@end
