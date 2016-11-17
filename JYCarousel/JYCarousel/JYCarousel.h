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

@interface JYCarousel : UIView

#pragma mark -自定义变量
//图片数据(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】)
@property (strong, nonatomic) NSMutableArray *images;

#pragma mark -初始化方法
- (instancetype)initWithFrame:(CGRect)frame configBlock:(CarouselConfigurationBlock)configBlock clickBlock:(CarouselClickBlock)clickBlock;


//开始定时器
- (void)beginTimer;

//销毁定时器
- (void)stopTimer;






@end
