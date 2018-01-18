//
//  TableViewController.m
//  testUI
//
//  Created by liutong on 2017/11/24.
//  Copyright © 2017年 liutong. All rights reserved.
//

#import "TableViewController.h"
#import "LTGroupViewController.h"
@interface TableViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *vcArray;
@end

@implementation TableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"test";
    self.dataArray = @[@"群聊",
                       @"链式编程",
                       @"group",
                       @"plain",];
    self.vcArray = @[NSStringFromClass([LTGroupViewController class]),
                                       ];
}
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}
-(NSArray *)vcArray {
    if (!_vcArray) {
        _vcArray = [NSArray array];
    }
    return _vcArray;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentify = @"testCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentify];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class vcClass = NSClassFromString(self.vcArray[indexPath.row]);
    UIViewController *vc = [[vcClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
