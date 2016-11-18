//
//  SubViewController.m
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "SubViewController.h"
#import "JYCarousel.h"
#import "JYImageCache.h"

@interface SubViewController ()<JYCarouselDelegate>
@property (nonatomic, strong) JYCarousel *carouselView2;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCarouselView1];
    [self addCarouselView2];
    [self addCarouselView3];
    [self addCarouselView4];
    [self addCarouselView5];

}

- (void)addCarouselView1{
    __weak typeof(self) weakSelf = self;
    //_carouselView1
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    JYCarousel *carouselView = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 64, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = LabelPageControl;
        carouselConfig.interValTime = 3;
        carouselConfig.pushAnimationType = PushCube;
        carouselConfig.animationSubtype = kCATransitionFromRight;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    //开始轮播
    [carouselView startCarouselWithArray:imageArray];
    [self.view addSubview:carouselView];
}
- (void)addCarouselView2{
    __weak typeof(self) weakSelf = self;
    //_carouselView2
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"http://p1.bqimg.com/524586/894925a41a745ba8.jpg",@"http://p1.bqimg.com/524586/edd59898ac21642f.jpg",@"http://p1.bqimg.com/524586/d277aa654cd60c3d.jpg",@"http://p1.bqimg.com/524586/a49b8d3e1b953f25.jpg",@"http://p1.bqimg.com/524586/972bff3b7a5fb7e1.jpg"]];
    
    _carouselView2 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 170, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = MiddlePageControl;
        carouselConfig.pageTintColor = [UIColor whiteColor];
        carouselConfig.currentPageTintColor = [UIColor redColor];
        carouselConfig.placeholder = [UIImage imageNamed:@"default"];
        carouselConfig.faileReloadTimes = 5;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    
    //开始轮播
    [_carouselView2 startCarouselWithArray:imageArray2];
    [self.view addSubview:_carouselView2];
}


- (void)addCarouselView3{
    __weak typeof(self) weakSelf = self;
    //_carouselView3
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    JYCarousel *carouselView = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 300, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = RightPageControl;
        carouselConfig.interValTime = 2.0;
        carouselConfig.pushAnimationType = PushRippleEffect;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    
    //开始轮播
    [carouselView startCarouselWithArray:imageArray];
    [self.view addSubview:carouselView];
}


- (void)addCarouselView4{
    __weak typeof(self) weakSelf = self;
    //_carouselView4
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    JYCarousel *carouselView = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 420, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = LeftPageControl;
        carouselConfig.interValTime = 2.5;
        carouselConfig.pushAnimationType = PushCurlUp;
        return carouselConfig;
    } clickBlock:^(NSInteger index) {
        [weakSelf clickIndex:index];
    }];
    
    //开始轮播
    [carouselView startCarouselWithArray:imageArray];
    [self.view addSubview:carouselView];
}

- (void)addCarouselView5{
    //_carouselView5
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    JYCarousel *carouselView = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 540, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
        carouselConfig.pageContollType = LeftPageControl;
        carouselConfig.interValTime = 3.0;
        carouselConfig.pushAnimationType = PushCameraIrisHollowOpen;
        carouselConfig.backViewImage = [UIImage imageNamed:@"default"];
        return carouselConfig;
    } target:self];
    
    //开始轮播
    [carouselView startCarouselWithArray:imageArray];
    [self.view addSubview:carouselView];
}

- (void)carouselViewClick:(NSInteger)index{
    NSLog(@"代理方式你点击图片索引index = %ld",index);
}

- (void)clickIndex:(NSInteger)index{
    NSLog(@"你点击图片索引index = %ld",index);
    //清楚缓存数据 可以在启动的时候清楚一次上一次轮播缓存,根据自己需要
    [[JYImageCache sharedImageCache] jy_clearDiskCaches];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"进入VC：%@", [[self class] description]);
}
- (void)dealloc{
    NSLog(@"退出VC--无循环引用-----");
}


@end
