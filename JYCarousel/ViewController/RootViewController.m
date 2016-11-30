//
//  RootViewController.m
//  JYCarousel
//
//  Created by Dely on 16/11/30.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "RootViewController.h"
#import "DemoViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JYCarousel";
}

- (IBAction)LookDemoAction:(UIButton *)sender {
    DemoViewController *DVC = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:DVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"memoryWarning");
}

@end
