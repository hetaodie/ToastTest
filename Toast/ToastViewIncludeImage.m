//
//  ToastViewIncludeImage.m
//  ToastTest
//
//  Created by Netease on 16/2/15.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ToastViewIncludeImage.h"


@interface ToastViewIncludeImage()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *messageLabel;
@end

@implementation ToastViewIncludeImage

static const CGFloat ToastViewIncludeImageToTopDistance = 5.0f;
static const CGFloat ToastViewIncludeImageToLeftDistance = 5.0f;
static const CGFloat ToastViewIncludeImageToRightDistance = 5.0f;
static const CGFloat ToastViewIncludeImageToBottomDistance = 5.0f;

static const CGFloat ToastViewIncludeImageMessageFontSize = 18.0f;

static const CGFloat ToastViewIncludeImagecornerRadius = 3.0f;

static const CGFloat ToastViewIncludeImageEdge = 30.0f;       //此值为屏幕的宽度减去此值，为宽度的最大值

static const CGFloat ToastViewIncludeImageAndLabelDistance = 10.0f;

- (id)initToastViewWithToastObject:(ToastObject *)aToastObject{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = ToastViewIncludeImagecornerRadius;
        [self setUpImageAndLabel];
        
        self.messageLabel.text = aToastObject.message;
        self.imageView.image = aToastObject.showImage;
        
        switch (aToastObject.showImagePoint) {
            case ShowImageAtUp: {
                [self adjustSizeWithImageAtTop:aToastObject];
                break;
            }
            case ShowImageAtLeft: {
                [self adjustSizeWithImageAtLeft:aToastObject];
                break;
            }
            case ShowImageAtRight: {
                [self adjustSizeWithImageAtRight:aToastObject];
                break;
            }
            case ShowImageAtBelow: {
                [self adjustSizeWithImageAtBottom:aToastObject];
                break;
            }
        }
    
    }

    return self;
}

- (void)adjustSizeWithImageAtTop:(ToastObject *)aToastObject{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    if (width > screenWidth - ToastViewIncludeImageEdge) {
        width = screenWidth - ToastViewIncludeImageEdge;
        height = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:NO fixedValue:width];
    }
    
    CGFloat imageWidth = aToastObject.showImage.size.width;
    CGFloat toastWidth = MAX(imageWidth, width) + ToastViewIncludeImageToLeftDistance + ToastViewIncludeImageToRightDistance;
    CGFloat toastHeight = aToastObject.showImage.size.height + height + 20;
    [self setFrame:CGRectMake(0, 0, toastWidth, toastHeight)];
    
    self.imageView.frame = CGRectMake((toastWidth - imageWidth)/2, ToastViewIncludeImageToTopDistance, aToastObject.showImage.size.width, aToastObject.showImage.size.height);
    
    self.messageLabel.frame = CGRectMake((toastWidth - width)/2,CGRectGetMaxY(self.imageView.frame)+ToastViewIncludeImageAndLabelDistance, width, height);
    
}

- (void)adjustSizeWithImageAtBottom:(ToastObject *)aToastObject{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    if (width > screenWidth - ToastViewIncludeImageEdge) {
        width = screenWidth - ToastViewIncludeImageEdge;
        height = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:NO fixedValue:width];
    }
    
    CGFloat imageWidth = aToastObject.showImage.size.width;
    CGFloat toastWidth = MAX(imageWidth, width) + ToastViewIncludeImageToRightDistance + ToastViewIncludeImageToLeftDistance;
    CGFloat toastHeight = aToastObject.showImage.size.height + height + ToastViewIncludeImageToTopDistance + ToastViewIncludeImageToBottomDistance + ToastViewIncludeImageAndLabelDistance;
    [self setFrame:CGRectMake(0, 0, toastWidth, toastHeight)];
    
    
    self.messageLabel.frame = CGRectMake((toastWidth - width)/2,ToastViewIncludeImageToTopDistance, width, height);
    self.imageView.frame = CGRectMake((toastWidth - imageWidth)/2, CGRectGetMaxY(self.messageLabel.frame), aToastObject.showImage.size.width, aToastObject.showImage.size.height);

    
}

- (void)adjustSizeWithImageAtLeft:(ToastObject *)aToastObject{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    CGFloat maxWidth = screenWidth - 20 - aToastObject.showImage.size.width - ToastViewIncludeImageToLeftDistance - ToastViewIncludeImageToRightDistance;
    if (width > maxWidth ) {
        width = maxWidth;
        height = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:NO fixedValue:width];
    }
    
    CGFloat imageWidth = aToastObject.showImage.size.width;
    CGFloat imageHeight = aToastObject.showImage.size.height;
    
    CGFloat toastHeight = MAX(imageHeight, height)+ ToastViewIncludeImageToTopDistance + ToastViewIncludeImageToBottomDistance;
    CGFloat toastWidth = 20 + imageWidth + width;

    [self setFrame:CGRectMake(0, 0, toastWidth, toastHeight)];
    
    

    self.imageView.frame = CGRectMake(ToastViewIncludeImageToLeftDistance,(toastHeight - imageHeight)/2, aToastObject.showImage.size.width, aToastObject.showImage.size.height);
    
    self.messageLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + ToastViewIncludeImageAndLabelDistance,(toastHeight - height)/2, width, height);
}

- (void)adjustSizeWithImageAtRight:(ToastObject *)aToastObject{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat width = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:YES fixedValue:30];
    CGFloat height = 30;
    CGFloat maxWidth = screenWidth - 20 - aToastObject.showImage.size.width - ToastViewIncludeImageToLeftDistance - ToastViewIncludeImageToRightDistance;
    if (width > maxWidth ) {
        width = maxWidth;
        height = [self stringText:aToastObject.message font:ToastViewIncludeImageMessageFontSize isHeightFixed:NO fixedValue:width];
    }
    
    CGFloat imageWidth = aToastObject.showImage.size.width;
    CGFloat imageHeight = aToastObject.showImage.size.height;
    
    CGFloat toastHeight = MAX(imageHeight, height)+ ToastViewIncludeImageToTopDistance + ToastViewIncludeImageToBottomDistance;
    CGFloat toastWidth = 20 + imageWidth + width;
    
    [self setFrame:CGRectMake(0, 0, toastWidth, toastHeight)];
    
    self.messageLabel.frame = CGRectMake(ToastViewIncludeImageToLeftDistance,(toastHeight - height)/2, width, height);
    
    self.imageView.frame = CGRectMake(CGRectGetMaxX(self.messageLabel.frame)+ToastViewIncludeImageAndLabelDistance,(toastHeight - imageHeight)/2, aToastObject.showImage.size.width, aToastObject.showImage.size.height);
    

}

- (void)setUpImageAndLabel{
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.textColor = [UIColor whiteColor];
    
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.lineBreakMode = NSLineBreakByCharWrapping;
    messageLabel.numberOfLines = 0;
    [self addSubview:messageLabel];
    self.messageLabel = messageLabel;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor clearColor];
    [self addSubview:imageView];
    self.imageView = imageView;
}


//根据字符串长度获取对应的宽度或者高度
- (CGFloat)stringText:(NSString *)text font:(CGFloat)font isHeightFixed:(BOOL)isHeightFixed fixedValue:(CGFloat)fixedValue
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
