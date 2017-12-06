//
//  FourViewController.m
//  Runtime示例
//
//  Created by 郭勇 on 2017/12/5.
//  Copyright © 2017年 Yong Guo. All rights reserved.
//

#import "FourViewController.h"
#import "LTImage+extension.h"

@interface FourViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loadImage:(id)sender {
    self.imageView.image = [LTImage imageNamed:@"test"];
}

@end

