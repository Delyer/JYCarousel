//
//  JYImageDownloader.h
//  JYCarousel
//
//  Created by Dely on 16/11/17.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^JYDownLoadDataFinshedBlock)(NSData *data, NSError *error);
typedef void (^JYDownloadProgressBlock)(unsigned long long total, unsigned long long current);
typedef void (^JYCompletionImageBlock)(UIImage *image);

@interface JYImageDownloader : NSObject

@property (nonatomic, strong) NSURLSessionDownloadTask *task;

+ (JYImageDownloader *)sharedDownloader;

- (void)startDownloadImageWithUrl:(NSString *)url
                         progress:(JYDownloadProgressBlock)progress
                         finished:(JYDownLoadDataFinshedBlock)finished;

@end
