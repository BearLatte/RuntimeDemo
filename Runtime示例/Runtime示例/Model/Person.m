//
//  Person.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/22.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person
- (void)instanceMethodIMP {
    NSLog(@"This is a instance method");
}
+ (void)classMethodIMP {
    NSLog(@"This is a class method");
}

+ (void)printPerson {
    NSLog(@"This is Method of Class person");
}
@end
