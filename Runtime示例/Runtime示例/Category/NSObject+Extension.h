//
//  NSObject+Extension.h
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/29.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSObjectDelegate <NSObject>
@optional

/**
 * 提供一个协议，告诉系统数组中存放的对象类型，当子类实现了该协议方法就可以将数组中的字典转换为模型
 *
 * @return 字典，字典中的 key 是模型中定义的数组名称，value 是所存放的类型，例如 [NSObject class] 或者 字符串 @"NSObject"
 */
+ (NSDictionary *)objectInArray;

/**
 * 处理字典中出现 id 等关键字
 *
 * @return 字典，key 是在模型中定义的属性名，value 是字典中出现的 key
 */
+ (NSDictionary *)replaceKey;
@end
@interface NSObject (Extension)<NSObjectDelegate>

/**
 * 字典转模型核心方法，可以继续封装 JSON 字符串转模型
 *
 * @param dict 入参为一个字典类型，字典中存放的 key 为模型的属性，通过KVC将value赋值给属性
 * @return 返回一个转化好的模型对象
 */
+ (instancetype)objectWithDictionary:(NSDictionary *)dict;
@end
