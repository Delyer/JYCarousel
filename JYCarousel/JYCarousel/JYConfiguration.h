//
//  JYConfiguration.h
//  JYCarousel
//
//  Created by Dely on 16/11/14.
//  Copyright © 2016年 Dely. All rights reserved.
//

/*
 * 这是一个使用起来非常简单的开源库，自带下载缓存，不会造成循环引用，不用考虑定时器不会销毁（我都已经帮你做好了）
 * 如果使用过程中有任何问题，可以联系我，我会第一时间回复你，然后尽我的努力把这个库维护的更好，更简单方便的使用。
 * 谢谢支持，如果喜欢，请给我个star。
 *
 * 作者：Delyer
 * 简书：http://www.jianshu.com/users/e95705fe04d9    （现在写博客的主要地方）
 * 个人博客：http://dely.vip
 * github：https://github.com/Delyer
 * 邮箱：jiayaoit@126.com
 * 微信：Delyer521
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JYConfiguration;

//#define kDebugLog (如果想看打印注释放开即可)

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

//titleLabel默认大小
static CGFloat DefaultTitileFont = 10.0;

@interface JYConfiguration : NSObject

/**
 占位图
 */
@property (nonatomic, strong) UIImage *placeholder;

/**
 轮播时间间隔（默认：3s，当设置为0s时,停止自动轮播）
 */
@property (assign, nonatomic) NSTimeInterval interValTime;

/**
 指示器类型（label和pageContoller样式）
 */
@property (nonatomic, assign) CarouselPageControllType pageContollType;

/**
 指示器填充颜色
 */
@property (strong, nonatomic) UIColor *currentPageTintColor;

/**
 指示器颜色
 */
@property (strong, nonatomic) UIColor *pageTintColor;


/**
 图片填充类型(默认是UIViewContentModeScaleToFill)
 */
@property (nonatomic, assign) UIViewContentMode contentMode;


/**
 imageView加载图片失败重试次数(默认2次)
 */
@property (nonatomic, assign) NSInteger faileReloadTimes;



/**
 titleLabel的frame（默认(0,superViewHeight-20,superViewWidth,20)）
 */
@property (nonatomic, assign) CGRect titleFrame;

/**
 titleLabel的font（默认10.0）
 */
@property (nonatomic, assign) CGFloat titleFont;

/**
 titleLabel的对齐模式（默认左对齐）
 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/**
 titleLabel的backgroundColor（默认黑色透明度0.5）
 */
@property (nonatomic, assign) UIColor *titleBackGroundColor;

/**
 titleLabel的titleColor（默认白色）
 */
@property (nonatomic, assign) UIColor *titleColor;

@end
