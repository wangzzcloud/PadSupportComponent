//
//  PadSplitHelper.h
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PadDetailViewController.h"

/**
 辅助类：协助页面跳转
 */
@interface PadSplitHelper : NSObject

@property (nonatomic, assign) CGFloat pad_rightWidth;

@property (nonatomic, strong) PadDetailViewController *detailController;

#pragma mark - TabBarController的内容控制器


+ (instancetype)helper;

@end
