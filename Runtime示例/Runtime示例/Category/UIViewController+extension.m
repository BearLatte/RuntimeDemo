//
//  UIViewController+extension.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/24.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "UIViewController+extension.h"
#import <objc/runtime.h>

@implementation UIViewController (extension)
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, "CLASS_NAME", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)name {
    return objc_getAssociatedObject(self, "CLASS_NAME");
}
@end

