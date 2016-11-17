//
//  JYPageControl.h
//  JYCarousel
//
//  Created by Dely on 16/11/16.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JYConfiguration.h"

@interface JYPageControl : NSObject

- (void)initViewWithNumberOfPages:(NSInteger)numberOfPages configuration:(JYConfiguration *)config addInView:(UIView *)superView;

- (void)updateCurrentPageWithIndex:(NSInteger)index;

@end
