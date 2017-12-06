//
//  LTMusic.h
//  Runtime示例
//
//  Created by 郭勇 on 2017/11/24.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface LTMusic : NSObject <NSCoding>
@property (nonatomic, copy) NSString *songName;
@property (nonatomic, copy) NSString *singer;
@property (nonatomic, copy) NSString *albumName;
@end
