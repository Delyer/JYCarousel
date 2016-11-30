//
//  DemoViewController.m
//  JYCarousel
//
//  Created by Dely on 16/11/30.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "DemoViewController.h"
#import "CarouselTableViewCell.h"
#import "JYCarousel.h"

@interface DemoViewController ()<UITableViewDataSource,UITableViewDelegate,JYCarouselDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) JYCarousel *carouselView1;
@property (nonatomic, strong) JYCarousel *carouselView2;

@end

@implementation DemoViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self addCarouselView1];
    [self addCarouselView2];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CarouselTableViewCell" bundle:nil] forCellReuseIdentifier:@"CarouselTableViewCell"];
    [self.tableView reloadData];
    
}

#pragma mark ======================block回调方式创建======================
- (void)addCarouselView1{
    
    //block方式创建
    __weak typeof(self) weakSelf = self;
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithArray: @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]];
    
    if (!_carouselView1) {
        _carouselView1= [[JYCarousel alloc] initWithFrame:CGRectMake(0, 0, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pageContollType = LabelPageControl;
            carouselConfig.interValTime = 3;
            carouselConfig.pushAnimationType = PushCube;
            carouselConfig.animationSubtype = kCATransitionFromRight;
            return carouselConfig;
        } clickBlock:^(NSInteger index) {
            [weakSelf clickIndex:index];
        }];
        [self.view addSubview:_carouselView1];
    }
    //开始轮播
    [_carouselView1 startCarouselWithArray:imageArray];
    
}

- (void)clickIndex:(NSInteger)index{
    NSLog(@"你点击图片索引index = %ld",index);
    //清除缓存数据 可以在启动的时候清除一次上一次轮播缓存,根据自己需要
    //[[JYImageCache sharedImageCache] jy_clearDiskCaches];
}

#pragma mark ======================代理回调方式创建======================
- (void)addCarouselView2{
    
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"https://p1.bqimg.com/524586/894925a41a745ba8.jpg",@"https://p1.bqimg.com/524586/edd59898ac21642f.jpg",@"https://p1.bqimg.com/524586/d277aa654cd60c3d.jpg",@"https://p1.bqimg.com/524586/a49b8d3e1b953f25.jpg",@"https://p1.bqimg.com/524586/972bff3b7a5fb7e1.jpg"]];
    
    if (!_carouselView2) {
        _carouselView2 = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 120, ViewWidth(self.view), 100) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pageContollType = MiddlePageControl;
            carouselConfig.pageTintColor = [UIColor whiteColor];
            carouselConfig.currentPageTintColor = [UIColor redColor];
            carouselConfig.placeholder = [UIImage imageNamed:@"default"];
            carouselConfig.faileReloadTimes = 5;
            return carouselConfig;
        } target:self];
        
        [self.view addSubview:_carouselView2];
    }
    //开始轮播
    [_carouselView2 startCarouselWithArray:imageArray2];
    
}

- (void)carouselViewClick:(NSInteger)index{
    NSLog(@"代理方式你点击图片索引index = %ld",index);
}



#pragma mark ======================tableView上JYCarousel应用======================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CarouselTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarouselTableViewCell" forIndexPath:indexPath];
    [cell updateViewWithIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



#pragma mark ======================VC的生命周期方法=====================
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"进入VC：%@", [[self class] description]);
}

- (void)dealloc{
    NSLog(@"退出VC--无循环引用-----");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
