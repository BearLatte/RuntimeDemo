//
//  LTMusic.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/24.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "LTMusic.h"
#import <objc/runtime.h>

@implementation LTMusic

// 解档
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        self.songName = [aDecoder decodeObjectForKey:@"songName"];
//        self.singer = [aDecoder decodeObjectForKey:@"singer"];
//        self.albumName = [aDecoder decodeObjectForKey:@"albumName"];
//    }
//    return self;
//}
// 归档
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:_songName forKey:@"songName"];
//    [aCoder encodeObject:_singer forKey:@"singer"];
//    [aCoder encodeObject:_albumName forKey:@"albumName"];
//}

// 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        // 1. 获取成员变量列表
        unsigned int count;
        Ivar *ivarList = class_copyIvarList([self class], &count);;
        
        // 2. 遍历成员变量列表
        for (unsigned int i = 0; i < count; i++) {
            // 2.1 取出 i 位置的成员变量
            Ivar ivar = ivarList[i];
            
            // 2.2 获取成员变量的 C 语言名称并转换为 OC 名称
            NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            // 2.3 解档
            id value = [aDecoder decodeObjectForKey:ivarName];
            
            // 2.4 使用 KVC 为 self 的属性赋值
            [self setValue:value forKey:ivarName];
        }
        // 3. 使用 C 语言一定要记得释放内存空间，否则会造成内存泄漏
        free(ivarList);
    }
    return self;
}

// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    // 1. 获取成员变量列表
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    
    // 2. 遍历成员变量
    for (unsigned int i = 0; i < count; i++) {
        // 2.1 依次取出 i 位置的成员变量
        Ivar ivar = ivarList[i];
        
        // 2.2 获取 C 语言变量名称并转换为 OC 变量名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 2.3 使用 KVC 取出 变量的 value 值并执行归档
        id value = [self valueForKey:ivarName];
        [aCoder encodeObject:value forKey:ivarName];
    }
    
    // 3. 使用 C 语言一定要记得释放内存空间，否则会造成内存泄漏
    free(ivarList);
}
- (NSString *)description {
    return [NSString stringWithFormat:@"歌手: %@, 专辑: %@, 歌名: %@", self.singer, self.albumName, self.songName];
}
@end
