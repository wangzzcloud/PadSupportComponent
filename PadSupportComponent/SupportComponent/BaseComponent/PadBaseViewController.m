//
//  PadBaseViewController.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "PadBaseViewController.h"

#import "PadSplitHelper.h"
#import "PadJumpNextViewControllerDelegate.h"

@interface PadBaseViewController ()

@end

@implementation PadBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (void)pad_jumpNextViewController:(PadBaseViewController *)contoller {
    
    if ([self.pad_Delegate respondsToSelector:@selector(pad_jumpNextViewController:tabBarControllerWithTag:)]) {
        [self.pad_Delegate pad_jumpNextViewController:contoller tabBarControllerWithTag:contoller.tabBarItem.tag-100];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
