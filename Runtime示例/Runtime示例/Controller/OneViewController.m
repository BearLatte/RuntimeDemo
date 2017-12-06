//
//  OneViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/4.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "OneViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface OneViewController ()

@end

@implementation OneViewController
unsigned int count;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)printPropertyList {
    // 1. 获取属性列表，返回值为 typedef struct objc_property *objc_property_t 结构体
    objc_property_t *propertyListC = class_copyPropertyList([Person class], &count);
    
    // 2. 遍历这个 “结构体” 类型
    for (int i = 0; i < count; i++) {
        // 2.1 通过 property_getName 方法 从 propertyListC 中获取单个属性名称，返回值为 const char *
        const char *propertyCName = property_getName(propertyListC[i]);
        
        // 3.2 将 C语言 字符串转为 OC 字符串并输出
        NSLog(@"%@", [NSString stringWithUTF8String:propertyCName]);
    }
}
- (IBAction)printMethodList {
    Method *methodList = class_copyMethodList([Person class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method------->%@", NSStringFromSelector(method_getName(method)));
    }
}
- (IBAction)printIvarsList {
    Ivar *ivarList = class_copyIvarList([Person class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@", ivarName);
    }
}
- (IBAction)printProtocolList {
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([UITableView class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *tableViewProtocol = protocolList[i];
        NSLog(@"%@", [NSString stringWithUTF8String:protocol_getName(tableViewProtocol)]);
    }
}

@end
