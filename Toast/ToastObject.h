//
//  ToastObject.h
//  ToastTest
//
//  Created by Netease on 16/2/4.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,ShowImagePoint) {
    ShowImageAtUp,                                // 图片显示在上面
    ShowImageAtLeft,                              // 图片显示在左边
    ShowImageAtRight,                             // 图片显示在右边
    ShowImageAtBelow,                             // 图片显示在下面
};

typedef NS_ENUM(NSUInteger,ShowToastPoint) {
    ShowToastAtTop = 101,                        // Toast 显示在屏幕的上面
    ShowToastAtModdle,                           // Toast 显示在屏幕的中间
    ShowToastAtBottom,                           // Toast 显示在屏幕的下面
};

@interface ToastObject : NSObject


@property (nonatomic, copy)   UIImage *showImage;                    // 用来显示的图片
@property (nonatomic, copy)   NSString *message;                     // 显示的信息内容
@property (nonatomic, assign) ShowImagePoint showImagePoint;         // 图片的显示位置
@property (nonatomic, assign) CGFloat showTime;                      // Toast 显示的时间
@property (nonatomic, assign) ShowToastPoint toastPoint;             // 显示的坐标位置

@end
