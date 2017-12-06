//
//  TwoViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/4.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "TwoViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)addMethod {
    
    BOOL success = class_addMethod([Person class], @selector(testAddMethod), class_getMethodImplementation([self class], @selector(test)), "v@:");

    if (success) {
        NSLog(@"添加成功");
    }
}
- (IBAction)responseMethod {
    Person *p = [[Person alloc] init];
    [p performSelector:@selector(testAddMethod)];
}


- (void)test {
    NSLog(@"这条信息能够打印表示添加方法成功并能调用");
}
@end
