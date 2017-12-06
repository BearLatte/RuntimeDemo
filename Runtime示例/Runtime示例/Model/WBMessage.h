//
//  WBMessage.h
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/27.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBMessage : NSObject
/** 微博创建时间*/
@property (nonatomic, copy) NSString *created_at;

/** 字符串型的微博ID*/
@property (nonatomic, copy) NSString *idstr;

/** 微博信息内容*/
@property (nonatomic, copy) NSString *text;

/** 微博来源*/
@property (nonatomic, copy) NSString *source;

/** 转发数*/
@property (nonatomic, assign) int reposts_count;

/** 评论数*/
@property (nonatomic, assign) int comments_count;

/** 表态数*/
@property (nonatomic, assign) int attitudes_count;

/** 配图*/
@property (nonatomic, strong) NSArray *users;
/** 是否为转发微博 */
@property (nonatomic, assign, getter = isRetweetedStatus) BOOL retweetedStatus;
@end
