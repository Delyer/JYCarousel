//
//  SubViewController.m
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "SubViewController.h"
#import "JYCarousel.h"

@interface SubViewController ()
@property (nonatomic, strong) JYCarousel *carouselView2;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    
    //_carouselView1
    NSMutableArray *imageArray1 = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    JYCarousel *carouselView1 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 64, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = LabelPageControl;
        carouselConfig.interValTime = 2.0;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    
    carouselView1.images = imageArray1;
    [self.view addSubview:carouselView1];
    
    
    
    //_carouselView2
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"http://p1.bqimg.com/524586/894925a41a745ba8.jpg",@"http://p1.bqimg.com/524586/edd59898ac21642f.jpg",@"http://p1.bqimg.com/524586/d277aa654cd60c3d.jpg",@"http://p1.bqimg.com/524586/a49b8d3e1b953f25.jpg",@"http://p1.bqimg.com/524586/972bff3b7a5fb7e1.jpg"]];
    
    _carouselView2 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 170, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = MiddlePageControl;
        carouselConfig.pageTintColor = [UIColor whiteColor];
        carouselConfig.currentPageTintColor = [UIColor redColor];
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    
    _carouselView2.images = imageArray2;
    [self.view addSubview:_carouselView2];
}
- (void)clickIndex:(NSInteger)index{
    NSLog(@"你点击图片索引index = %ld",index);
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"进入VC：%@", [[self class] description]);
}
- (void)dealloc{
    NSLog(@"退出VC--无循环引用-----");
}


@end
