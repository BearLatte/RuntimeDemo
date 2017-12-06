//
//  ViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/22.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "SevenViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSArray *)items {
    if (!_items) {
        _items = @[@"动态获取各种列表", @"运行时动态为类添加方法", @"为系统方法扩展功能", @"在子类中扩展系统功能", @"在Category中添加属性", @"runtime简化NSCoding协议", @"字典转模型"];
    }
    return _items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
}

#pragma mark - UI Table View Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"item"];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}
#pragma mark - UI Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = nil;
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"one"];
            break;
        case 1:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"two"];
            break;
        case 2:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"three"];
            break;
        case 3:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"four"];
            break;
        case 4:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"five"];
            break;
        case 5:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"six"];
            break;
        default:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"seven"];
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
@end
