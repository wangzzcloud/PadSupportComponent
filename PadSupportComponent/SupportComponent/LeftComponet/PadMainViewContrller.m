//
//  PadMainViewContrller.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "PadMainViewContrller.h"

#import "PadDetailViewController.h"
#import "PadSplitHelper.h"

@interface PadMainViewContrller ()<UISplitViewControllerDelegate>

@end

@implementation PadMainViewContrller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置展示风格 */
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
//    self.delegate = self;
}

#pragma mark - UISplitViewControllerDelegate

- (void)showViewController:(UIViewController *)vc sender:(id)sender {
    NSLog(@"%@_%@", NSStringFromSelector(_cmd), vc);
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
