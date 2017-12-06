//
//  LTUser.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "LTUser.h"

@implementation LTUser
- (NSString *)description {
    return [NSString stringWithFormat:@"\nuserName = %@,\nicon = %@", self.userName, self.icon];
}
@end
