//
//  JYCarousel.h
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
 * 新浪博客：http://blog.sina.com.cn/u/1721109400
 * github：https://github.com/Delyer
 * 邮箱：jiayaoit@126.com
 * 微信：Delyer521
 */

#import <UIKit/UIKit.h>
#import "JYConfiguration.h"
#import "JYPageControl.h"


@protocol JYCarouselDelegate <NSObject>

@optional
- (void)carouselViewClick:(NSInteger)index;

@end

@interface JYCarousel : UIView

#pragma mark - ==============初始化==============

/**
 block方式回调初始化

 @param frame       frame
 @param configBlock 轮播属性配置（可以为nil，为nil时采用默认的配置）
 @param clickBlock  点击回调

 @return carousel
 */
- (instancetype)initWithFrame:(CGRect)frame
                  configBlock:(CarouselConfigurationBlock)configBlock
                   clickBlock:(CarouselClickBlock)clickBlock;


/**
 delegate方式回调初始化
 
 @param frame       frame
 @param configBlock 轮播属性配置（可以为nil，为nil时采用默认的配置）
 @param target      delegate
 
 @return carousel
 */
- (instancetype)initWithFrame:(CGRect)frame
                  configBlock:(CarouselConfigurationBlock)configBlock
                       target:(id<JYCarouselDelegate>)target;




#pragma mark - ==============开始轮播==============

/**
 start Carousel

 @param imageArray imageArray(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】)
 */
- (void)startCarouselWithArray:(NSMutableArray *)imageArray;


/**
 start Carousel With new Config（更新轮播配置，新的样式轮播）
 
 @param configBlock 轮播属性配置（可以为nil，为nil时采用之前默认的配置）
 */
- (void)startCarouselWithNewConfig:(CarouselConfigurationBlock)configBlock array:(NSMutableArray *)imageArray;



@end
