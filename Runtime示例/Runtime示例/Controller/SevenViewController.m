//
//  SevenViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "SevenViewController.h"
#import "WBMessage.h"
#import "NSObject+Extension.h"
#import "LTUser.h"

@interface SevenViewController ()
// 创建一组假数据
@property (nonatomic, strong) NSDictionary *wbInfomation;
@property (nonatomic, strong) WBMessage *message;
@end

@implementation SevenViewController

- (NSDictionary *)wbInfomation {
    if (!_wbInfomation) {
        _wbInfomation = @{
                               @"id"                : @"6733577",
                               @"created_at"        : @"2017-11-27",
                               @"text"              : @"北京近日进行强拆暴力执法，早上发通知下午提着锤子来拆墙。",
                               @"source"            : @"李二蛋的 iPhone X 客户端",
                               @"reposts_count"     : @"226",
                               @"comments_count"    : @"151",
                               @"attitudes_count"   : @"1000",
                               @"retweetedStatus"   : @"1",
                               @"status"            : @"off",
                               @"users"             : @[@{
                                                            @"userName" : @"张三",
                                                            @"icon" : @"https://114.114.114.114/source/images/1128.png"
                                                            }, @{
                                                            @"userName" : @"李四",
                                                            @"icon" : @"https://114.114.114.114/source/images/1129.png"
                                                            }]
                               };
    }
    return _wbInfomation;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)dictTransformModel:(id)sender {
    self.message = [WBMessage objectWithDictionary:self.wbInfomation];
}
- (IBAction)printModel:(id)sender {
    NSLog(@"%@", self.message);
    LTUser *user = self.message.users[0];
    NSLog(@"%@", user);
}

@end
