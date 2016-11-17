//
//  ViewController.m
//  JYCarousel
//
//  Created by Dely on 16/11/14.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "ViewController.h"

#import "JYCarousel.h"



@interface ViewController ()

@property (nonatomic, strong) JYCarousel *carouselView2;

@end

@implementation ViewController

- (void)viewDidLoad {
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [super viewDidLoad];
    self.title = @"JYCarousel";

    
    //_carouselView1
     NSMutableArray *imageArray1 = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];

    JYCarousel *carouselView1 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 64, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = LabelPageControl;
        carouselConfig.interValTime = 1;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [self clickIndex:index];
    }];
    
    carouselView1.images = imageArray1;
    [self.view addSubview:carouselView1];
    
    
    __weak typeof(self) weakSelf = self;
    
    //_carouselView2
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"2.jpg",@"3.jpg"]];
    
    _carouselView2 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 170, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = MiddlePageControl;
        carouselConfig.pageTintColor = [UIColor lightGrayColor];
        carouselConfig.currentPageTintColor = [UIColor purpleColor];
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    
    _carouselView2.images = imageArray2;
    [self.view addSubview:_carouselView2];
    
    
    
    
}

- (void)clickIndex:(NSInteger)index{
    NSLog(@"你点击图片索引index = %ld",index);
    
    //可以随时更改数组的里数据，
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"]];
    _carouselView2.images = imageArray2;
}


@end
