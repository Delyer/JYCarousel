//
//  JYCarousel.h
//  JYCarousel
//
//  Created by Dely on 16/11/14.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYConfiguration.h"
#import "JYPageControl.h"


@protocol JYCarouselDelegate <NSObject>

@optional
- (void)carouselViewClick:(NSInteger)index;

@end

@interface JYCarousel : UIView

#pragma mark -initMethod

/**
 block方式回调初始化

 @param frame       frame
 @param configBlock 轮播属性配置
 @param clickBlock  点击回调

 @return carousel
 */
- (instancetype)initWithFrame:(CGRect)frame configBlock:(CarouselConfigurationBlock)configBlock clickBlock:(CarouselClickBlock)clickBlock;


/**
 delegate方式回调初始化
 
 @param frame       frame
 @param configBlock 轮播属性配置
 @param target      delegate
 
 @return carousel
 */
- (instancetype)initWithFrame:(CGRect)frame configBlock:(CarouselConfigurationBlock)configBlock target:(id<JYCarouselDelegate>)target;



/**
 start Carousel

 @param imageArray imageArray(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】)
 */
- (void)startCarouselWithArray:(NSMutableArray *)imageArray;



@end
