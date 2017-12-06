//
//  LTImage+extension.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/23.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "LTImage+extension.h"
#import <objc/runtime.h>

@implementation LTImage (extension)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 1. 获取类
        Class selfCls = object_getClass((id)self);
        
        // 2. 获取父类方法
        SEL originalSEL = @selector(imageNamed:);
        Method originalMethod = class_getClassMethod(selfCls, originalSEL);
        
        // 3. 获取新创建的方法
        SEL customSEL = @selector(override_imageNamed:);
        Method customMethod = class_getClassMethod(selfCls, customSEL);
        
        // 4. 将方法添加到子类中
        BOOL success = class_addMethod(selfCls, originalSEL, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));
        
        // 5. 目标类（LTImage）中不存在这个方法（添加成功）：替换方法实现，反之（添加失败）：交换两个方法
        if (success) {
            class_replaceMethod(selfCls, customSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, customMethod);
        }
    });
}

+ (UIImage *)override_imageNamed:(NSString *)imageName {
//    if ([UIDevice currentDevice].systemVersion.doubleValue > 9.0) {
//        imageName = [imageName stringByAppendingString:@"_os10"];
//    }
    NSLog(@"方法定位：%s， 这里可以扩展原来代码的实现，必须调用原方法", __FUNCTION__);
    return [self override_imageNamed:imageName];
}
@end
