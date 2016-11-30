//
//  JYImageCache.h
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const JYDidSettingTime;

//#define kDebugLog

@interface JYImageCache : NSObject

+ (JYImageCache *)sharedImageCache;

@property (nonatomic, strong) NSMutableDictionary *jy_cacheFaileTimesDict;

- (UIImage *)jy_cacheImageForRequest:(NSURLRequest *)request;
- (void)jy_cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request;
- (void)jy_cacheFailRequest:(NSURLRequest *)request;
- (NSUInteger)jy_failTimesForRequest:(NSURLRequest *)request;

- (void)jy_clearCacheFaileTimesDict;
- (void)jy_clearDiskCaches;

/**
 超时清除缓存，可以在App启动时设置，以后就会定时清除轮播的缓存

 @param time 超时时间（单位为h）
 */
- (void)jy_clearDiskCachesWithTimeout:(NSTimeInterval)time;


/**
 修改超时清除缓存的时间

 @param time 重新设定的超时时间（单位为h）
 */
- (void)jy_changeDiskCacheWithTimeout:(NSTimeInterval)time;



@end
