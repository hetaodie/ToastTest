//
//  ToastUtils.h
//  vsfa
//
//  Created by xu.wei on 15/7/29.
//  Copyright © 2015年 weixu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ToastObject.h"


@interface ToastUtils : NSObject

#pragma mark -
#pragma mark only Message of Toast
/*!
 *  显示提示视图, 默认显示在屏幕上方，防止被软键盘覆盖，1.5s后自动消失
 *
 *  @param message 需要显示的信息
 */
+ (void)showAtTop:(NSString *)message;

/**
 *  /显示提示视图, 默认显示在屏幕下方，1.5s后自动消失
 *
 *  @param message 需要显示的信息
 */
+ (void)showAtBottom:(NSString *)message;

/*!
 *  //显示提示视图, 默认显示在屏幕的中间，1.5s后消失
 *
 *  @param message 需要显示的信息
 */
+ (void)showAtMiddle:(NSString *)message;


/*!
 *  显示提示视图, 默认显示在屏幕上方，防止被软键盘覆盖，1.5s后自动消失
 *
 *  @param message 需要显示的信息
 */
+ (void)showAtTop:(NSString *)message showTime:(float)aShowTime;

/**
 *  /显示提示视图, 默认显示在屏幕下方，1.5s后自动消失
 *
 *  @param message 需要显示的信息
 */
+ (void)showAtBottom:(NSString *)message showTime:(float)aShowTime;

/*!
 *  //显示提示视图, 默认显示在屏幕的中间，1.5s后消失
 *
 *  @param message 需要显示的信息
 */
+ (void)showAtMiddle:(NSString *)message showTime:(float)aShowTime;


#pragma mark -
#pragma mark include image

/*!
 *
 *
 *  @param aToastObject <#aToastObject description#>
 */
+ (void)showToastIncludeImage:(ToastObject *)aToastObject;


@end
