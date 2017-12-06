//
//  NSObject+Extension.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/29.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)
+ (instancetype)objectWithDictionary:(NSDictionary *)dict {
    // 1. 实例化操作对象
    id modelObjc = [[self alloc] init];
    
    // 2. 获取成员变量列表
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    // 3. 遍历成员变量列表并使用成员变量作为 key 在字典中查找 value 再将 value 赋值给成员变量
    for (unsigned int i = 0; i < count; i++) {
        // 3.1 获取 i 位置的 ivar
        Ivar ivar = ivarList[i];
        // 3.2 获取 ivar 的名称，因为每个成员变量前默认会加上一个 “_” 所以需要去掉
        NSString *ivarName = [[NSString stringWithUTF8String:ivar_getName(ivar)] substringFromIndex:1];
        // 3.3 处理字典中的关键字
        NSString *newKey = nil;
        if ([self respondsToSelector:@selector(replaceKey)]) {
            newKey = [self replaceKey][ivarName] ? [self replaceKey][ivarName] : ivarName;
        } else {
            newKey = ivarName;
        }
        // 3.4 去字典中取出成员变量对应的 value 值
        id ivarValue = dict[newKey];
        // 3.5 获取成员变量的类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        // 3.6 判断成员变量的值是否为字典，如果是字典类型需要继续向内转换
        if ([ivarValue isKindOfClass:[NSDictionary class]] && [ivarType containsString:@"NS"]) {
            // 进入这一层表示位置 i 的成员变量的值是一个字典并且这个对象是个自定义对象
            // 3.6.1 处理类型字符串, 通过 ivar_getTypeEncoding(ivar) 的表现形式为 @"\"对象名称\""
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
            ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            
            // 3.6.2 获取自定义模型类对象
            Class modelClass = NSClassFromString(ivarType);
            // 3.6.3 递归调用字典转模型
            if (modelClass) {
                [modelClass objectWithDictionary:ivarValue];
            }
        }
        // 3.67 value值是数组，数组中又嵌套字典
        if ([ivarValue isKindOfClass:[NSArray class]]) {
            // 3.7.1 判断子类有没有实现协议方法，YES : 将数组中的字典转换模型
            //                      NO : 对数组不操作或者模型类中不存在数组
            if ([self respondsToSelector:@selector(objectInArray)]) {
                // 3.7.2 将 self 的类型转换为 id 类型可以保证该变量可以调用任何对象的方法
                id idSelf = self;
                // 3.7.3 获取数组中存放的字典
                id classType = [idSelf objectInArray][ivarName];
                
                Class clazz = nil;
                // 3.7.4 判断两种情况，1. 字典的 value 是 class 类型，直接获取  2. 字典的 value 是字符串类型，通过字符串获取
                if ([classType isKindOfClass:[NSString class]]) {
                    clazz = NSClassFromString(classType);
                } else {
                    clazz = (Class)classType;
                }
                // 3.7.5 遍历 value 并组装成模型数组
                NSMutableArray *models = [NSMutableArray array];
                for (NSDictionary *dict in ivarValue) {
                    id model = [clazz objectWithDictionary:dict];
                    [models addObject:model];
                }
                // 3.7.6 将成员变量的值替换为模型数组
                ivarValue = [models mutableCopy];
            }
        }
        // 4. 使用 KVC 将实现字典转模型
        if (ivarValue) {
            [modelObjc setValue:ivarValue forKey:ivarName];
        }
    }
    // 5. 将转换好的模型对象返回
    return modelObjc;
}
@end
