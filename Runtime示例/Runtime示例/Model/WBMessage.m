//
//  WBMessage.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/27.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "WBMessage.h"
#import "NSObject+Extension.h"

@implementation WBMessage
//- (void)setValue:(id)value forKey:(NSString *)key {
//    if ([key isEqualToString:@"id"]) {
//        _idstr = value;
//    } else {
//        [super setValue:value forKey:key];
//    }
//}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
//
//}
+ (NSDictionary *)objectInArray {
    return @{@"users" : @"LTUser"};
}
+ (NSDictionary *)replaceKey {
    return @{@"idstr" : @"id"};
}
- (NSString *)description {
    return [NSString stringWithFormat:@"\ncreated_at = %@,\nidstr = %@,\ntext = %@\nsource = %@,\nreposts_count = %d,\ncomments_count = %d,\nattitudes_count = %d,\nusers = %@,\nretweetedStatus = %d", self.created_at, self.idstr, self.text, self.source, self.reposts_count, self.comments_count, self.attitudes_count, self.users, self.isRetweetedStatus];
}
@end
