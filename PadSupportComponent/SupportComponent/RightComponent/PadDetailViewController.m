//
//  PadDetailViewController.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "PadDetailViewController.h"

#import "PadBaseViewController.h"
#import "PadSplitHelper.h"

@interface PadDetailViewController ()

/* 数组内共N个元素，对应着每个tabBar界面的最后一个controller */
@property (nonatomic, strong) NSMutableDictionary *lastControllersDic;

/* 最后所点击的tabbar的tag值 */
@property (nonatomic, assign) NSInteger lastTag;
@end

@implementation PadDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:nil];
    self.lastControllersDic = [[NSMutableDictionary alloc] init];
    [PadSplitHelper helper].pad_rightWidth = self.navigationController.view.frame.size.width;
    
}

#pragma mark - 当用户点击 TabBarController 的按钮之后

- (void)pad_showTabBarControllerWithTag:(NSInteger)tag {
    
    if (self.lastTag != tag) {
        NSString *tagString = [NSString stringWithFormat:@"%ld", (long)tag];
        NSString *lastTagString = [NSString stringWithFormat:@"%ld", (long)_lastTag];
        NSMutableArray *controllersArr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        
        //仅在上一个页面存在其他的controller是，才保存这个controller，并更新数组对应的数据
        if (controllersArr.count > 1) {
            PadBaseViewController *lastController = [controllersArr lastObject];
            [self.lastControllersDic setObject:lastController forKey:lastTagString];
            
            //尝试关闭present出来的controller
            [lastController dismissViewControllerAnimated:YES completion:nil];
            if (lastController.navigationController) {
                [lastController.navigationController dismissViewControllerAnimated:YES completion:nil];
            }
            
        }else {
            [self.lastControllersDic setObject:@"" forKey:lastTagString];
        }
        NSLog(@"current Arrary：%@",self.lastControllersDic);
        
        //将要展示的controller
        PadBaseViewController *willContrller = [self.lastControllersDic objectForKey:tagString];
        
        if ([willContrller isKindOfClass:[PadBaseViewController class]]) {  //排除 willContrller 为@"" 的情况。
            [self.navigationController pushViewController:willContrller animated:NO];
            if (controllersArr.count>1) {
                [controllersArr removeLastObject];
            }
            [controllersArr addObject:willContrller];
            self.navigationController.viewControllers = controllersArr;
            
        }else {
            //显示空白的view
            self.navigationController.viewControllers = @[controllersArr[0]];
        }
    }
    NSLog(@"last page:%ld ,now page:%ld",(long)self.lastTag, (long)tag);
    self.lastTag = tag;
}

#pragma mark - PadJumpNextViewControllerDelegate
/* 响应mainController的点击事件，弹出响应的视图 */
- (void)pad_jumpNextViewController:(PadBaseViewController *)controller tabBarControllerWithTag:(NSInteger)tag {
    
    if (controller) {
        
        NSMutableArray *controllersArr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        for (PadBaseViewController *objcController in controllersArr) {
            if (objcController == controller) {
                return;
            }
        }
        [self.navigationController pushViewController:controller animated:NO];
        /** 右侧详情页，只保留最后展示的页面 */
        if (controllersArr.count>1) {
            [controllersArr removeLastObject];
        }
        [controllersArr addObject:controller];
        self.navigationController.viewControllers = controllersArr;
    }
    
}

#pragma mark - getter

- (NSInteger)lastTag {
    if (!_lastTag) {
        _lastTag = 100;
    }
    return _lastTag;
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
