//
//  ThreeViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "ThreeViewController.h"
#import "UIImage+Extension.h"

@interface ThreeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loadImage:(id)sender {
    self.imageView.image = [UIImage imageNamed:@"test"];
}
@end
