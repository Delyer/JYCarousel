//
//  UIImageView+JYImageViewManager.h
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYImageDownloader.h"


@interface UIImageView (JYImageViewManager)

@property (nonatomic, assign) NSInteger reloadTimesForFailedURL;
@property (nonatomic, weak) JYImageDownloader *imageDownLoader;

@property (nonatomic, copy) JYCompletionImageBlock completion;

- (void)jy_setImageWithURLString:(NSString *)url placeholderImage:(NSString *)placeholderImage;
- (void)jy_setImageWithURLString:(NSString *)url placeholder:(UIImage *)placeholderImage;
- (void)jy_setImageWithURLString:(NSString *)url
                  placeholder:(UIImage *)placeholderImage
                   completion:(void (^)(UIImage *image))completion;
- (void)jy_setImageWithURLString:(NSString *)url
             placeholderImage:(NSString *)placeholderImage
                   completion:(void (^)(UIImage *image))completion;


@end
