//
//  CarouselTableViewCell.m
//  JYCarousel
//
//  Created by Dely on 16/11/30.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "CarouselTableViewCell.h"
#import "JYCarousel.h"

@interface CarouselTableViewCell ()

@property (nonatomic, strong) JYCarousel *carousel;

@end

@implementation CarouselTableViewCell

- (void)updateViewWithIndexPath:(NSIndexPath*)indexPath{
    NSMutableArray *imageArray2 = [[NSMutableArray alloc] initWithArray: @[@"https://p1.bqimg.com/524586/894925a41a745ba8.jpg",@"https://p1.bqimg.com/524586/edd59898ac21642f.jpg",@"https://p1.bqimg.com/524586/d277aa654cd60c3d.jpg",@"https://p1.bqimg.com/524586/a49b8d3e1b953f25.jpg",@"https://p1.bqimg.com/524586/972bff3b7a5fb7e1.jpg"]];
    
    if (!_carousel) {
    
        _carousel = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) configBlock:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pageContollType = MiddlePageControl;
            carouselConfig.pageTintColor = [UIColor whiteColor];
            carouselConfig.currentPageTintColor = [UIColor redColor];
            carouselConfig.placeholder = [UIImage imageNamed:@"default"];
            carouselConfig.faileReloadTimes = 5;
            return carouselConfig;
        } clickBlock:^(NSInteger index) {
            NSLog(@"你点击了第%ld张图片",index);
            //这个类定义协议回调到Viewcontroller
        }];
        [self addSubview:_carousel];
    }
    
    
    //开始轮播
    [_carousel startCarouselWithArray:imageArray2];
    
}

@end
