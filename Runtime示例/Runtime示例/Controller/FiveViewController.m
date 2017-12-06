//
//  FiveViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "FiveViewController.h"
#import "UIViewController+extension.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)setNewPropertyValue:(id)sender {
    self.name = @"啦啦啦啦啦啦";
}
- (IBAction)printNewPropertyValue:(id)sender {
    NSLog(@"%@", self.name);
}

@end
