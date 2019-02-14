//
//  MyTabBarController.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "MyTabBarController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "PadSplitHelper.h"


static NSString *const kImageName = @"toolbar_home_highlight";

static NSString *const kTitle1 = @"模块1";
static NSString *const kTitle2 = @"模块2";
static NSString *const kTitle3 = @"模块3";

static NSInteger const kOriginalTag = 100;

@interface MyTabBarController ()
@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    OneViewController *_controller1 = [[OneViewController alloc] init];
    _controller1.tabBarItem.title = kTitle1;
    _controller1.tabBarItem.image = [UIImage imageNamed:kImageName];
    _controller1.tabBarItem.tag = kOriginalTag;
    
    TwoViewController *_controller2 = [[TwoViewController alloc] init];
    _controller2.tabBarItem.title = kTitle2;
    _controller2.tabBarItem.image = [UIImage imageNamed:kImageName];
    _controller2.tabBarItem.tag = kOriginalTag + 1;
    
    ThreeViewController *_controller3 = [[ThreeViewController alloc] init];
    _controller3.tabBarItem.title = kTitle3;
    _controller3.tabBarItem.image = [UIImage imageNamed:kImageName];
    _controller3.tabBarItem.tag = kOriginalTag + 2;
    
    self.viewControllers = @[_controller1, _controller2, _controller3];
    self.selectedIndex = 0;
    self.title = kTitle1;
    
    if ([PadSplitHelper helper].detailController) {
        _controller1.pad_Delegate = [PadSplitHelper helper].detailController;
        _controller2.pad_Delegate = [PadSplitHelper helper].detailController;
        _controller3.pad_Delegate = [PadSplitHelper helper].detailController;
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"%@_%lu", NSStringFromSelector(_cmd), (unsigned long)item.tag);
    switch (item.tag) {
        case kOriginalTag:
            self.title = kTitle1;
            break;
        case kOriginalTag + 1:
            self.title = kTitle2;
            break;
        case kOriginalTag + 2:
            self.title = kTitle3;
            break;
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [PadSplitHelper helper].detailController) {
        [[PadSplitHelper helper].detailController pad_showTabBarControllerWithTag:item.tag];
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
