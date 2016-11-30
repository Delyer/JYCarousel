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
    

    
    //复用
    if (!_carousel) {
        _carousel = [[JYCarousel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) configBlock:nil clickBlock:^(NSInteger index) {
            NSLog(@"你点击了第%ld张图片",index);
            //这个类定义协议回调到Viewcontroller
        }];
        [self addSubview:_carousel];
    }
    
    
    //配置轮播样式
    if (indexPath.row <=2) {
        [_carousel startCarouselWithNewConfig:^JYConfiguration *(JYConfiguration *carouselConfig) {
            carouselConfig.pushAnimationType = PushCurlUp;
            carouselConfig.pageContollType = MiddlePageControl;
            carouselConfig.pageTintColor = [UIColor whiteColor];
            carouselConfig.currentPageTintColor = [UIColor redColor];
            carouselConfig.placeholder = [UIImage imageNamed:@"default"];
            carouselConfig.faileReloadTimes = 5;
            return carouselConfig;
        } array:imageArray2];
        
    }else{
        
        [_carousel startCarouselWithNewConfig:^JYConfiguration *(JYConfiguration *carouselConfig) {
            
            carouselConfig.interValTime = (arc4random()%5)+1;
            carouselConfig.pageContollType = arc4random()%4;
            carouselConfig.pushAnimationType = arc4random()%16;
            carouselConfig.currentPageTintColor = [UIColor colorWithRed:(arc4random()%256)/256.0 green:(arc4random()%256)/256.0 blue:(arc4random()%256)/256.0 alpha:1.0];
            carouselConfig.pageTintColor = [UIColor colorWithRed:(arc4random()%256)/256.0 green:(arc4random()%256)/256.0 blue:(arc4random()%256)/256.0 alpha:1.0];
            return carouselConfig;
        } array:imageArray2];
    }
    

    
}

@end
