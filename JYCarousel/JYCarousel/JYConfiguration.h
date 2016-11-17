//
//  JYConfiguration.h
//  JYCarousel
//
//  Created by Dely on 16/11/14.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JYConfiguration;

//imageView的个数
#define AllImageViewCount 3

//View的宽度
#define ViewWidth(view) CGRectGetWidth(view.frame)
//View的高度
#define ViewHeight(view) CGRectGetHeight(view.frame)

#define JYWeakSelf __weak typeof(self) weakSelf = self

//获取用户自定义属性
typedef JYConfiguration *(^CarouselConfigurationBlock)(JYConfiguration *carouselConfig);

//点击事件block
typedef void (^CarouselClickBlock)(NSInteger index);

//UIPageControl类型
typedef NS_ENUM(NSInteger, CarouselPageControllType) {
    MiddlePageControl = 0,
    LeftPageControl,
    RightPageControl,
    LabelPageControl,
    NonePageControl
};

//定时器默认时间
static NSTimeInterval DefaultTime = 3.0;

@interface JYConfiguration : NSObject

#pragma mark - 指示器PageControl属性
@property (nonatomic, assign) CarouselPageControllType pageContollType;
//填充颜色
@property (strong, nonatomic) UIColor *currentPageTintColor;
//颜色
@property (strong, nonatomic) UIColor *pageTintColor;


#pragma mark - 占位图
@property (nonatomic, strong) UIImage *placeholder;

#pragma mark - 轮播时间间隔 （默认：3s，当设置为0s时,停止自动轮播）
@property (assign, nonatomic) NSTimeInterval interValTime;




@end
