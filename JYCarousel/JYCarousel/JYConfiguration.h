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

#define kDebugLog

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

typedef NS_ENUM(NSInteger ,CarouselPushType) {
    PushDefault = 0,    //默认平稳过渡
    PushCurlUp,         //向上翻一页
    PushCurlDown,       //向下翻一页
    PushFilpFromLeft,   //从左翻转
    PushFilpFromRight,  //从右翻转
    PushFade,           //交叉淡化过渡
    PushMoveIn,         //新视图移到旧视图上面 依靠animationSubtype方向
    PushReveal,         //将旧视图移开，显示下面的新视图 依靠animationSubtype方向
    PushPush,           //推挤
    PushCube,           //立方体效果 依靠animationSubtype方向
    PushPageCurl,       //翻页 依靠animationSubtype方向
    PushPageUnCurl,     //反翻页 依靠animationSubtype方向
    PushRippleEffect,   //滴水效果
    PushSuckEffect,      //收缩效果
    PushCameraIrisHollowOpen,  //镜头开
    PushCameraIrisHollowClose //镜头关
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

#pragma mark - push翻页效果
@property (nonatomic, assign) CarouselPushType pushAnimationType;

#pragma mark - push翻页方向（只会在CarouselPushType为PushMoveIn、PushReveal、PushCube、PushPageCurl、PushPageUnCurl有效果）
/**
 *  kCATransitionFromRight
 *  kCATransitionFromLeft
 *  kCATransitionFromTop
 *  kCATransitionFromBottom
 */
@property (nonatomic, strong) NSString *animationSubtype;

#pragma mark - 轮播背景视图或者背景图片
@property (nonatomic, strong) UIColor *backViewColor;
@property (nonatomic, strong) UIImage *backViewImage;


@end
