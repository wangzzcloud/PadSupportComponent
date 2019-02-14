//
//  PadSplitHelper.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "PadSplitHelper.h"

@implementation PadSplitHelper


static PadSplitHelper *_helper = nil;

+ (instancetype)helper {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _helper = [[PadSplitHelper alloc] init];
    });
    return _helper;
}

@end
