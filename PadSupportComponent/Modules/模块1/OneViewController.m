//
//  OneViewController.m
//  PadSupportComponent
//
//  Created by 王增战 on 2019/2/13.
//  Copyright © 2019 wannazen. All rights reserved.
//

#import "OneViewController.h"

#import "RightDetailViewcController.h"

static NSString *const kIdent = @"cell";

@interface OneViewController () <UITableViewDelegate, UITableViewDataSource>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;
/** tableView的数据源 */
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation OneViewController

#pragma mark - 页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RightDetailViewcController *contoller = [[RightDetailViewcController alloc] init];
    contoller.title = _dataSource[indexPath.row];
    [self pad_jumpNextViewController:contoller];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    _dataSource = [[NSMutableArray alloc] init];
    
    for (int i = 0; i< 20; i++) {
        _dataSource[i] = [NSString stringWithFormat:@"cell_%d", i];
    }
    [_tableView reloadData];
    
}


#pragma mark - 初始化UI

- (void)setupUI {
    
    [self.view addSubview:self.tableView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
}
#pragma mark - table dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdent];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kIdent];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

#pragma mark - getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.translatesAutoresizingMaskIntoConstraints = false;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
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
