//
//  ViewController.m
//  JYCarousel
//
//  Created by Dely on 16/11/14.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"JYCarousel";
}

- (IBAction)nexPageAction:(UIButton *)sender {
    
    SubViewController *SVC = [SubViewController new];
    [self.navigationController pushViewController:SVC animated:YES];
}


@end
