//
//  JYCarouselAnimation.h
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JYConfiguration.h"

@interface JYCarouselAnimation : NSObject

@property (nonatomic, assign) CarouselPushType pushAnimationType;

@property (nonatomic, strong) JYConfiguration *config;

- (instancetype)initWithConfiguration:(JYConfiguration *)config;

- (void)startAnimationInView:(UIView *)view;

@end
