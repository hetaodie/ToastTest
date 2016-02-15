//  ToastUtils.h
//  vsfa
//
//  Created by xu.wei on 15/7/29.
//  Copyright © 2015年 weixu. All rights reserved.
//


#import "ToastUtils.h"
#import "ToastViewIncludeImage.h"

@implementation ToastUtils

static const CGFloat ToastUtilsToastShowDefaultTime = 2.0;

+ (void)showAtTop:(NSString *)message{
    [self showAtTop:message showTime:ToastUtilsToastShowDefaultTime];
}

+ (void)showAtBottom:(NSString *)message{
    [self showAtBottom:message showTime:ToastUtilsToastShowDefaultTime];
}

+ (void)showAtMiddle:(NSString *)message{
    [self showAtMiddle:message showTime:ToastUtilsToastShowDefaultTime];
}

+ (void)showMessage:(NSString *)aMessage AtPoint:(CGPoint)aPoint{
    [self showMessage:aMessage AtPoint:aPoint showTime:ToastUtilsToastShowDefaultTime];
}

+ (void)showAtTop:(NSString *)message showTime:(float)aShowTime{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:message font:18 isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    if (width > screenWidth - 20) {
        width = screenWidth - 20;
        height = [self stringText:message font:18 isHeightFixed:NO fixedValue:width];
    }
    
    CGPoint topPoint = CGPointMake(([UIScreen mainScreen].bounds.size.width-width)/2,22);
    [self showMessage:message AtPoint:topPoint showTime:aShowTime];
}

+ (void)showAtBottom:(NSString *)message showTime:(float)aShowTime{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:message font:18 isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    if (width > screenWidth - 20) {
        width = screenWidth - 20;
        height = [self stringText:message font:18 isHeightFixed:NO fixedValue:width];
    }
    
    CGPoint topPoint = CGPointMake(([UIScreen mainScreen].bounds.size.width-width)/2,([UIScreen mainScreen].bounds.size.height - height - 44));
    [self showMessage:message AtPoint:topPoint showTime:aShowTime];
}

+ (void)showAtMiddle:(NSString *)message showTime:(float)aShowTime{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:message font:18 isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    if (width > screenWidth - 20) {
        width = screenWidth - 20;
        height = [self stringText:message font:18 isHeightFixed:NO fixedValue:width];
    }
    
    CGPoint topPoint = CGPointMake(([UIScreen mainScreen].bounds.size.width-width)/2,([UIScreen mainScreen].bounds.size.height-height)/2);
    [self showMessage:message AtPoint:topPoint showTime:aShowTime];
}

+ (void)showMessage:(NSString *)aMessage AtPoint:(CGPoint)aPoint showTime:(float)aShowTime{
    
    //如果调用的时候不是在主线程中，切换到主线程中进行显示
    if (![[NSThread currentThread] isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showMessage:aMessage AtPoint:aPoint showTime:aShowTime];
        });
        return;
    }
    
    UILabel * toastViewLabel = [[UILabel alloc] init];
    toastViewLabel.backgroundColor = [UIColor darkGrayColor];
    toastViewLabel.textColor = [UIColor whiteColor];
    toastViewLabel.font = [UIFont systemFontOfSize:17];
    toastViewLabel.layer.masksToBounds = YES;
    toastViewLabel.layer.cornerRadius = 3.0f;
    toastViewLabel.textAlignment = NSTextAlignmentCenter;
    toastViewLabel.alpha = 0;
    toastViewLabel.numberOfLines = 0;
    toastViewLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [[UIApplication sharedApplication].keyWindow addSubview:toastViewLabel];
    
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:aMessage font:18 isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    if (width > screenWidth - 20) {
        width = screenWidth - 20;
        height = [self stringText:aMessage font:18 isHeightFixed:NO fixedValue:width];
    }
    
    CGRect frame = CGRectMake(aPoint.x, aPoint.y, width, height);
    toastViewLabel.hidden = NO;
    toastViewLabel.alpha = 1;
    toastViewLabel.text = aMessage;
    toastViewLabel.frame = frame;
    [UIView animateWithDuration:aShowTime animations:^{
        toastViewLabel.alpha = 0;
    } completion:^(BOOL finished) {
        toastViewLabel.hidden = YES;
        [toastViewLabel removeFromSuperview];
    }];
}




+ (void)showToastIncludeImage:(ToastObject *)aToastObject{
    if (![[NSThread currentThread] isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showToastIncludeImage:aToastObject];
        });
        return;
    }
    

    ToastViewIncludeImage *toastView = [[ToastViewIncludeImage alloc] initToastViewWithToastObject:aToastObject];

    [[UIApplication sharedApplication].keyWindow addSubview:toastView];


    CGRect toastViewFrame = toastView.frame;
    CGPoint toastPoint;
    
    switch (aToastObject.toastPoint) {
        case ShowToastAtTop:
        {
            toastPoint = CGPointMake(([UIScreen mainScreen].bounds.size.width-toastViewFrame.size.width)/2,22);
            break;
        }
        case ShowToastAtModdle:
        {
            toastPoint = CGPointMake(([UIScreen mainScreen].bounds.size.width-toastView.frame.size.width)/2,([UIScreen mainScreen].bounds.size.height - toastViewFrame.size.height)/2);
            break;
        }
        case ShowToastAtBottom:
        {
            toastPoint = CGPointMake(([UIScreen mainScreen].bounds.size.width-toastView.frame.size.width)/2,([UIScreen mainScreen].bounds.size.height-toastViewFrame.size.height - 65));
            
            break;
        }
    }
    
    toastViewFrame.origin = toastPoint;
    [toastView setFrame:toastViewFrame];
    
    toastView.hidden = NO;
    toastView.alpha = 1;

    [UIView animateWithDuration:aToastObject.showTime animations:^{
        toastView.alpha = 0;
    } completion:^(BOOL finished) {
        toastView.hidden = YES;
        [toastView removeFromSuperview];
    }];
    
}


//根据字符串长度获取对应的宽度或者高度
+ (CGFloat)stringText:(NSString *)text font:(CGFloat)font isHeightFixed:(BOOL)isHeightFixed fixedValue:(CGFloat)fixedValue
{
    CGSize size;
    if (isHeightFixed) {
        size = CGSizeMake(MAXFLOAT, fixedValue);
    } else {
        size = CGSizeMake(fixedValue, MAXFLOAT);
    }
    
    CGSize resultSize;
    //返回计算出的size
    resultSize = [text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]} context:nil].size;
    
    if (isHeightFixed) {
        return resultSize.width;
    } else {
        return resultSize.height;
    }
}

@end