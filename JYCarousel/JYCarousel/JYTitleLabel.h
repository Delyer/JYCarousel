//
//  JYTitleLabel.h
//  JYCarousel
//
//  Created by Dely on 2017/6/13.
//  Copyright © 2017年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JYConfiguration.h"

@interface JYTitleLabel : NSObject

- (void)initViewWithConfiguration:(JYConfiguration *)config addInView:(UIView *)superView;

- (void)updateCurrentTitleLabelWithTitle:(NSString *)title;

@end
