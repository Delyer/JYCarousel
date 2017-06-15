//
//  JYTitleLabel.m
//  JYCarousel
//
//  Created by Dely on 2017/6/13.
//  Copyright © 2017年 Dely. All rights reserved.
//

#import "JYTitleLabel.h"

@interface CustomLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets textInsets;

@end

@implementation CustomLabel

- (instancetype)init {
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}
- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

@end


@interface JYTitleLabel ()

@property (nonatomic, strong) JYConfiguration *config;
@property (nonatomic, assign) CGRect superViewFrame;
@property (nonatomic, strong) CustomLabel *titleLabel;
@property (nonatomic, strong) UIView *titleSuperView;

@end


@implementation JYTitleLabel

- (void)initViewWithConfiguration:(JYConfiguration *)config addInView:(UIView *)superView{
    self.config = config;
    self.superViewFrame = superView.frame;
    self.titleSuperView = superView;
    [self removeTitleView];
    
    if (!self.titleLabel) {
        self.titleLabel = [[CustomLabel alloc] init];
        self.titleLabel.textInsets = UIEdgeInsetsMake(0.f, 5.f, 0.f, 5.f);
        [superView addSubview:self.titleLabel];
    }
    
    if ((CGRectGetWidth(config.titleFrame)>0) && (CGRectGetHeight(config.titleFrame)>0)) {
        self.titleLabel.frame = config.titleFrame;
    }else{
        self.titleLabel.frame = CGRectMake(0, CGRectGetHeight(self.superViewFrame) - 20, CGRectGetWidth(self.superViewFrame), 20);
    }
    
    if (config.titleBackGroundColor) {
        self.titleLabel.backgroundColor = config.titleBackGroundColor;
    }else{
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    }
    
    self.titleLabel.textAlignment = config.textAlignment;
    
    self.titleLabel.font = [UIFont systemFontOfSize:config.titleFont];
    
    if (config.titleColor) {
        self.titleLabel.textColor = config.titleColor;
    }else{
        self.titleLabel.textColor = [UIColor whiteColor];
    }
}

- (void)removeTitleView{
    if (self.titleLabel) {
        [self.titleLabel removeFromSuperview];
        self.titleLabel = nil;
    }
}

- (void)updateCurrentTitleLabelWithTitle:(NSString *)title{
    if (title) {
        if (!self.titleLabel) {
            [self initViewWithConfiguration:self.config addInView:self.titleSuperView];
        }
        self.titleLabel.text = title;
    }else{
        [self removeTitleView];
    }
}

@end
