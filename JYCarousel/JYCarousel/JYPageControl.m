//
//  JYPageControl.m
//  JYCarousel
//
//  Created by Dely on 16/11/16.
//  Copyright © 2016年 Dely. All rights reserved.
//

#import "JYPageControl.h"

//pageControl边距
static CGFloat pageControlMagin = 20.0;

@interface JYPageControl ()

@property (nonatomic, strong) JYConfiguration *config;
@property (nonatomic, assign) CGRect superViewFrame;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UILabel *pageLabel;
@property (nonatomic, assign) NSInteger numberOfPages;

@end


@implementation JYPageControl

- (void)initViewWithNumberOfPages:(NSInteger)numberOfPages configuration:(JYConfiguration *)config addInView:(UIView *)superView{
    
    self.numberOfPages = numberOfPages;
    self.config = config;
    self.superViewFrame = superView.frame;
    [self removePageControl];
    
    if (self.config.pageContollType == LabelPageControl){
        if (!self.pageLabel && (self.numberOfPages > 1)) {
            self.pageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.superViewFrame) - 20 - 34, CGRectGetHeight(self.superViewFrame) - 13 -34, 34, 34)];
            self.pageLabel.textAlignment = NSTextAlignmentCenter;
            self.pageLabel.font = [UIFont systemFontOfSize:14.0];
            self.pageLabel.textColor = [UIColor whiteColor];
            self.pageLabel.layer.cornerRadius = 17.0;
            self.pageLabel.layer.masksToBounds = YES;
            self.pageLabel.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
            self.pageLabel.text = [NSString stringWithFormat:@"%d/%@",1,@(self.numberOfPages)];
            [superView addSubview:self.pageLabel];
            
        }else if (self.pageLabel && (self.numberOfPages == 1)){
            //数量为1隐藏label
            [self.pageLabel removeFromSuperview];
            self.pageLabel = nil;
        }
    }else if (self.config.pageContollType != NonePageControl){
        
        if (!self.pageControl && (self.numberOfPages > 0)) {
            self.pageControl = [[UIPageControl alloc] init];
            self.pageControl.hidesForSinglePage = YES;
            self.pageControl.userInteractionEnabled = NO;
            if (self.config.currentPageTintColor) {
                self.pageControl.currentPageIndicatorTintColor = self.config.currentPageTintColor;
            }
            if (self.config.pageTintColor) {
                self.pageControl.pageIndicatorTintColor = self.config.pageTintColor;
            }
            [superView addSubview:self.pageControl];
        }
        self.pageControl.numberOfPages = _numberOfPages;
        self.pageControl.frame = CGRectMake(0, CGRectGetHeight(self.superViewFrame) - 25, CGRectGetWidth(self.superViewFrame), 25);
        
        CGSize pointSize = [self.pageControl sizeForNumberOfPages:self.numberOfPages];
        CGFloat page_x = (self.pageControl.bounds.size.width - pointSize.width - 2*pageControlMagin) / 2 ;
        
        //设置轮播页码的位置
        if (self.config.pageContollType == LeftPageControl){
            [self.pageControl setBounds:CGRectMake(page_x, self.pageControl.bounds.origin.y, self.pageControl.bounds.size.width, self.pageControl.bounds.size.height)];
            
        }else if (self.config.pageContollType == MiddlePageControl){
            [self.pageControl setBounds:CGRectMake(0, self.pageControl.bounds.origin.y, self.pageControl.bounds.size.width, self.pageControl.bounds.size.height)];
            
        }else if (self.config.pageContollType == RightPageControl){
            [self.pageControl setBounds:CGRectMake(-page_x, self.pageControl.bounds.origin.y, self.pageControl.bounds.size.width, self.pageControl.bounds.size.height)];
        }
        
    }
}

- (void)removePageControl{
    if (self.pageControl) {
        [self.pageControl removeFromSuperview];
        self.pageControl = nil;
    }
    
    if (self.pageLabel) {
        [self.pageLabel removeFromSuperview];
        self.pageLabel = nil;
    }
    
}

- (void)updateCurrentPageWithIndex:(NSInteger)index{
    self.pageControl.currentPage = index;
    self.pageLabel.text = [NSString stringWithFormat:@"%ld/%@",(index+1),@(self.numberOfPages)];
}


@end
