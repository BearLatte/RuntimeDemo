//
//  SixViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "SixViewController.h"
#import "LTMusic.h"

@interface SixViewController ()
@property (nonatomic, copy) NSString *path;
@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    self.path = [documentPath stringByAppendingPathComponent:@"archiveFile"];
    
}
//@property (nonatomic, copy) NSString *songName;
//@property (nonatomic, copy) NSString *singer;
//@property (nonatomic, copy) NSString *albumName;
- (IBAction)startArchive:(id)sender {
    LTMusic *music = [[LTMusic alloc] init];
    music.songName = @"If i were a boy";
    music.singer = @"Beyonce";
    music.albumName = @"Babies Go Beyonce";
    BOOL success = [NSKeyedArchiver archiveRootObject:music toFile:self.path];
    NSLog(@"%@", self.path);
    if (success) {
        NSLog(@"归档成功");
    }
}
- (IBAction)startUnarchive:(id)sender {
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.path]) {
        LTMusic *music = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:self.path]];
        NSLog(@"%@", music);
    }
}

@end
