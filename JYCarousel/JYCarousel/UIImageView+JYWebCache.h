//
//  UIImageView+JYWebCache.h
//  JYCarousel
//
//  Created by Dely on 16/11/16.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JYWebCache)

- (void)jy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
