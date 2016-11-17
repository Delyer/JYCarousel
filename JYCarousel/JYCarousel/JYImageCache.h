//
//  JYImageCache.h
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define kDebugLog

@interface JYImageCache : NSObject

+ (JYImageCache *)sharedImageCache;

@property (nonatomic, strong) NSMutableDictionary *jy_cacheFaileTimesDict;

- (UIImage *)jy_cacheImageForRequest:(NSURLRequest *)request;
- (void)jy_cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request;
- (void)jy_cacheFailRequest:(NSURLRequest *)request;
- (NSUInteger)jy_failTimesForRequest:(NSURLRequest *)request;

- (void)jy_clearCacheFaileTimesDict;
- (void)jy_clearDiskCaches;


@end
