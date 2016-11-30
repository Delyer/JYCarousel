//
//  JYImageCache.m
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "JYImageCache.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

#define Default_cachePath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/JYCarouselImages"]

NSString *const JYDidSettingTime = @"JYDidSettingTime";

#pragma mark --------NSString的分类方法-----------
@interface NSString (md5Hash)

+ (NSString *)jy_md5Hash:(NSString *)string;
+ (NSString *)jy_cachePath;
+ (NSString *)jy_keyForRequest:(NSURLRequest *)request;

@end

@implementation NSString (md5Hash)

+ (NSString *)jy_keyForRequest:(NSURLRequest *)request {
    return [NSString stringWithFormat:@"%@_JYCarousel",
            request.URL.absoluteString];
}

+ (NSString *)jy_cachePath {
    return Default_cachePath;
}

+ (NSString *)jy_md5Hash:(NSString *)string {
    if (string) {
        const char *cStr = [string UTF8String];
        unsigned char result[16];
        CC_MD5(cStr, (UInt32) strlen(cStr), result);
        NSString *md5Result = [NSString stringWithFormat:
                               @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                               result[0], result[1], result[2], result[3],
                               result[4], result[5], result[6], result[7],
                               result[8], result[9], result[10], result[11],
                               result[12], result[13], result[14], result[15]];
        return md5Result;
    }
    return nil;

}

@end

#pragma mark --------cache-----------

@implementation JYImageCache

+ (JYImageCache *)sharedImageCache {
    static JYImageCache *instance;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JYImageCache alloc] init];
    });
    return instance;
}


- (NSMutableDictionary *)jy_cacheFaileTimesDict{
    if (!_jy_cacheFaileTimesDict) {
        _jy_cacheFaileTimesDict = [NSMutableDictionary dictionary];
    }
    return _jy_cacheFaileTimesDict;
}

- (void)jy_clearCacheFaileTimesDict{
    [self.jy_cacheFaileTimesDict removeAllObjects];
    self.jy_cacheFaileTimesDict = nil;
}


- (void)jy_clearDiskCaches{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(queue, ^{
        NSString *directoryPath = [NSString jy_cachePath];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:nil]) {
            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:directoryPath error:&error];
        }
        [self jy_clearCacheFaileTimesDict];
    });
   

}

- (UIImage *)jy_cacheImageForRequest:(NSURLRequest *)request{
    if (request) {
        NSString *directoryPath = [NSString jy_cachePath];
        NSString *path = [NSString stringWithFormat:@"%@/%@",
                          directoryPath,
                          [NSString jy_md5Hash:[NSString jy_keyForRequest:request]]];
        return [UIImage imageWithContentsOfFile:path];
    }
    
    return nil;
    
}
- (void)jy_cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request{
    if (image == nil || request == nil) {
        return;
    }
    
    NSString *directoryPath = Default_cachePath;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:nil]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&error];

        if (error) {
#ifdef kDebugLog
            NSLog(@"create cache dir error: %@", error);
#endif
            return;
        }

    }

    NSString *path = [NSString stringWithFormat:@"%@/%@",
                      directoryPath,
                      [NSString jy_md5Hash:[NSString jy_keyForRequest:request]]];
    NSData *data = UIImagePNGRepresentation(image);
    if (data) {
        BOOL isOk = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
        
        if (isOk) {
#ifdef kDebugLog
            NSLog(@"save file ok for request: %@", [NSString jy_md5Hash:[NSString jy_keyForRequest:request]]);
#endif
        } else {
#ifdef kDebugLog
            NSLog(@"save file error for request: %@", [NSString jy_md5Hash:[NSString jy_keyForRequest:request]]);
#endif
        }
    }
}
- (void)jy_cacheFailRequest:(NSURLRequest *)request{
    
    NSNumber *faileTimes = [self.jy_cacheFaileTimesDict objectForKey:[NSString jy_md5Hash:[NSString jy_keyForRequest:request]]];
    NSInteger times = 0;
    if (faileTimes && [faileTimes respondsToSelector:@selector(integerValue)]) {
        times = [faileTimes integerValue];
    }
    times++;
    
    [self.jy_cacheFaileTimesDict setObject:@(times) forKey:[NSString jy_md5Hash:[NSString jy_keyForRequest:request]]];

}

- (NSUInteger)jy_failTimesForRequest:(NSURLRequest *)request{
    
    NSNumber *faileTimes = [self.jy_cacheFaileTimesDict objectForKey:[NSString jy_md5Hash:[NSString jy_keyForRequest:request]]];
    
    if (faileTimes && [faileTimes respondsToSelector:@selector(integerValue)]) {
        return [faileTimes integerValue];
    }
    
    return 0;
}


- (void)jy_clearDiskCachesWithTimeout:(NSTimeInterval)time{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd-HH:mm:ss";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *settingTime = [defaults objectForKey:JYDidSettingTime];
    
    if (!settingTime ||[settingTime isEqualToString:JYDidSettingTime] ) {
        NSTimeInterval  timeInterval = 60*60*time;
        NSDate *tmpDate = [nowDate initWithTimeIntervalSinceNow:timeInterval];
        NSString *string = [formatter stringFromDate:tmpDate];
        [defaults setObject:string forKey:JYDidSettingTime];
        [defaults synchronize];
    }else{
        NSString *nowDateString = [formatter stringFromDate:nowDate];
        if ([settingTime compare:nowDateString] == NSOrderedAscending) {
            //升序，说明时间到了 清除缓存
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
            dispatch_async(queue, ^{
                NSString *directoryPath = [NSString jy_cachePath];
                
                if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:nil]) {
                    NSError *error = nil;
                    [[NSFileManager defaultManager] removeItemAtPath:directoryPath error:&error];
                }
                [self jy_clearCacheFaileTimesDict];
                [defaults setObject:JYDidSettingTime forKey:JYDidSettingTime];
                [defaults synchronize];
            });
        }
    }
}

- (void)jy_changeDiskCacheWithTimeout:(NSTimeInterval)time{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:JYDidSettingTime forKey:JYDidSettingTime];
    [defaults synchronize];
    [self jy_clearDiskCachesWithTimeout:time];
}



@end
