//
//  UIImage+Extension.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "UIImage+Extension.h"
#import <objc/runtime.h>

@implementation UIImage (Extension)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 获取当前类（需要明确操作的方法的类型是实例方法还是类方法）
        // 操作实例方法的时候
        // Class selfCls = [self class];
        // 操作类方法的时候
        Class selfCls = object_getClass((id)self);
        
        // 获取原始方法和替换方法
        Method originalMethod = class_getClassMethod(selfCls, @selector(imageNamed:));
        Method customMethod = class_getClassMethod(selfCls, @selector(custom_imageNamed:));
        
        // 替换两个方法
        method_exchangeImplementations(originalMethod, customMethod);
//        method_exchangeMethod(originalMethod, customMethod);
    });
}

+ (UIImage *)custom_imageNamed:(NSString *)imageName {
    // 动态获取设备版本号
//    double versionNum = [[UIDevice currentDevice] systemVersion].doubleValue;
    // 判断版本是否大于 7.0，如果大于7.0将图片名更换
//    if (versionNum >= 7.0) {
//        imageName = [imageName stringByAppendingString:@"_os7"];
//    }
    
    NSLog(@"这里可以写一些自己需要添加的功能，比如根据版本号加载图片等等");
    /*
     * 调用原来方法使我们自己写的方法具备系统功能
     * 这里不是递归，因为上面已经通过 method_exchangeMethod 函数 将两个方法做了替换
     * 这里调用 custom_imageNamed:imageName 相当于调用系统的原始方法 imageNamed
     */
    return [UIImage custom_imageNamed:imageName];
}
@end
