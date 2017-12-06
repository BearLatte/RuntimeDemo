//
//  Person.h
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/22.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    BOOL _gender;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *title;

- (void)instanceMethodIMP;
+ (void)classMethodIMP;
+ (void)printPerson;
@end
